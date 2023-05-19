package com.kh.yist.student.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.service.MailSendService;
import com.kh.yist.student.model.service.StudentService;
import com.kh.yist.student.model.vo.Notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.member.model.service.MemberServiceImpl;
import com.kh.yist.member.model.vo.Alarm;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.service.StudentService;
import com.kh.yist.student.model.vo.Attendance;
import com.kh.yist.student.model.vo.Exam;
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;
import com.kh.yist.student.model.vo.QnA;
import com.kh.yist.student.model.vo.Reply;
import com.kh.yist.student.model.vo.Task;
import com.kh.yist.student.model.vo.Video;
import com.kh.yist.subject.model.vo.Subject;

@Controller
public class StudentController {

	@Autowired
	private StudentService sService;

	@Autowired
	private MailSendService mailService;

	@Autowired
	private MemberServiceImpl mService;

	@RequestMapping("main.st")
	public ModelAndView main(Member m, HttpSession session, ModelAndView mv) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		ArrayList<Member> ins = sService.selectIns(loginUser);

		mv.addObject("ins", ins).setViewName("student/studentMain");

		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "mainNotice.st", produces = "application/json; charset=UTF-8")
	public String mainNotic(ModelAndView mv) {

		ArrayList<Notice> nlist = sService.mainNotice();

		return new Gson().toJson(nlist);
	}

	// 로그아웃
	@RequestMapping("logout.st")
	public String logoutStudent(HttpSession session) {

		session.invalidate();

		return "redirect:/"; // "main"
	}

	// 시험 목록 조회
	@RequestMapping("testList.st")
	public ModelAndView testList(ModelAndView mv, HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		ArrayList<Exam> list = sService.testList(loginUser);

		mv.addObject("list", list).setViewName("student/studentTestList");

		return mv;
	}

	// 시험 상세 조회
	@RequestMapping("testDetail.st")
	public String testDetail(@RequestParam(value = "eno") int testNo, Model model) {

		Exam e = sService.testDetail(testNo);
		e.setTestNo(testNo);

		model.addAttribute("e", e);

		return "student/studentTestDetail";
	}

	// 시험 제출
	@RequestMapping("testInsert.st")
	public String testInsert(Exam e, HttpSession session) {
		
		Member loginMember = (Member)session.getAttribute("loginUser");
		
		Member m = sService.selectExamIns(e);
		
		int result = sService.testInsert(e);
		
		if(result>0) {
			Alarm examAlarm = new Alarm();
			examAlarm.setId(m.getId());
			examAlarm.setAlarmType("시험");
			examAlarm.setAlarmContent(loginMember.getName() + "님이 시험을 완료했습니다.");
			examAlarm.setStatus("N");
			
			sService.insertAlarm(examAlarm);
			
			session.setAttribute("student_alertMsg", "평가 제출되었습니다");
			return "redirect:testList.st";
		} else {
			session.setAttribute("student_alertMsg", "평가 제출 실패!");
			return "redirect:testList.st";
		}

	}

	// 시험 결과
	@RequestMapping("examResult.st")
	public String examResult(Exam exam, Model model, HttpSession session) {

		Exam examResult = sService.selectExamResult(exam);
		Exam examQuestion = sService.selectExamQuestion(exam);

		if (examResult != null) {
			model.addAttribute("ea", examResult);
			model.addAttribute("q", examQuestion);
			return "student/studentTestResult";
		} else {
			session.setAttribute("student_alertMsg", "시험 결과 조회에 실패했습니다.");
			return "redirect:testList.st";
		}

	}

	@RequestMapping("certificate.st")
	public String certificate() {
		return "student/studentCertificate";
	}

	// 공지사항 목록 조회
	@RequestMapping("noticeList.st")
	public ModelAndView noticeList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {

		int listCount = sService.noticeListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Notice> list = sService.selectList(pi);

		mv.addObject("pi", pi).addObject("list", list).setViewName("student/studentNoticeList");

		return mv;
	}

	// 공지사항 상세 조회
	@RequestMapping("noticeDetail.st")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {

		int result = sService.increaseCount(nno);

		if (result > 0) {

			Notice n = sService.selectNotice(nno);
			System.out.println(n);

			mv.addObject("n", n).setViewName("student/studentNoticeDetail");
		}

		return mv;
	}

	@RequestMapping("search.bo")
	public ModelAndView noticeSearch(String condition, String keyword,
			@RequestParam(value = "page", defaultValue = "1") int currentPage, ModelAndView mv) {

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("condition", condition);
		map.put("keyword", keyword);

		int listCount = sService.noticeSearchCount(map);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Notice> list = sService.noticeSearchList(map, pi);

		mv.addObject("list", list);
		mv.addObject("condition", condition);
		mv.addObject("keyword", keyword);
		mv.addObject("pi", pi).setViewName("student/studentNoticeList");

		return mv;
	}

	// 동영상 게시판 목록 조회
	@RequestMapping("videoList.st")
	public ModelAndView videoList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {

		int listCount = sService.videoListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Video> list = sService.selectVideoList(pi);

		System.out.println(list);

		mv.addObject("pi", pi).addObject("list", list).setViewName("student/studentVideoList");

		return mv;
	}

	@RequestMapping("search.vi")
	public ModelAndView videoSearch(String condition, String keyword,
			@RequestParam(value = "page", defaultValue = "1") int currentPage, ModelAndView mv) {

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("condition", condition);
		map.put("keyword", keyword);

		int listCount = sService.videoSearchCount(map);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);

		ArrayList<Video> list = sService.videoSearchList(map, pi);

		mv.addObject("list", list);
		mv.addObject("condition", condition);
		mv.addObject("keyword", keyword);
		mv.addObject("pi", pi).setViewName("student/studentVideoList");

		return mv;
	}

	// 우리반 게시판 목록 조회
	@RequestMapping("boardList.st")
	public ModelAndView boardList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv,
			HttpSession session) {

		int listCount = sService.boardListCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<Material> list = sService.boardList(pi);

		// (초기 과제 리스트받아오기)
		Member student = (Member) session.getAttribute("loginUser");

		ArrayList<Task> taskList = sService.taskList(student);

		mv.addObject("taskList", taskList);

		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.setViewName("student/studentBoardList");

		return mv;
	}

	/*
	 * // 우리반 게시판 학습자료 목록 조회
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "MaterialList.st", produces =
	 * "application/json; charset=UTF-8") public String MaterialList(int
	 * currentPage) {
	 * 
	 * int listCount = sService.materialListCount();
	 * 
	 * PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
	 * 
	 * ArrayList<Material> list = sService.materialList(pi);
	 * 
	 * return new Gson().toJson(list); }
	 */
	// 우리반 게시판 학습자료 목록 조회
	@ResponseBody
	@RequestMapping(value = "MaterialList.st", produces = "application/json; charset=UTF-8")
	public Map<String, Object> MaterialList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			 @RequestParam(required = false, defaultValue="") String searchType,
			 @RequestParam(required = false, defaultValue="") String keyword,
			 Model model, HttpSession session) {

		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		
		int listCount = sService.materialListCount(map);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		System.out.println("cpage "+ currentPage);
		System.out.println("searchType "+ searchType);
		System.out.println("keyword "+ keyword);
		System.out.println("listCount "+ listCount);
		System.out.println("pi "+ pi);
		
		
		ArrayList<Material> list = sService.materialList(pi, map);

		int listcount = pi.getListCount(); // 현재 총 게시글 개수 저장
		int page = pi.getCurrentPage(); // 현재페이지
		int pageLimit = pi.getPageLimit(); // 페이징바의 페이지 최대개수 (1~10)(11~20) -> 10개
		int boardLimit = pi.getBoardLimit(); // 보여질 보드게시글갯수
		int maxPage = pi.getMaxPage(); // 가장 마지막페이지 (총페이지) 전체게시글의 가장 끝
		int startPage = pi.getStartPage(); // 페이징바의 시작수 4번선택시 1, 12번시 11
		int endPage = pi.getEndPage(); // 페이징바의 끝수 4번선택시10, 12선택시 20

		System.out.println("리스트값: " + list);

		result.put("list", list);
		result.put("listcount", listcount);
		result.put("page", page);
		result.put("pageLimit", pageLimit);
		result.put("boardLimit", boardLimit);
		result.put("maxPage", maxPage);
		result.put("startPage", startPage);
		result.put("endPage", endPage);

		return result;
	}

	// 학습자료 상세 조회
	@ResponseBody
	@RequestMapping("materialDetail.st")
	public ModelAndView selectMaterial(int materialNo, ModelAndView mv) {

		int result = sService.increaseCount(materialNo);

		if (result > 0) {

			Material m = sService.selectMaterial(materialNo);

			mv.addObject("m", m).setViewName("student/studentMaterialsDetail");
		}

		return mv;
	}
	
	// 우리반 게시판 과제 목록조회
	@ResponseBody
	@RequestMapping(value = "taskList.st", produces = "application/json; charset=UTF-8")
	public String taskList(HttpSession session) {

		Member student = (Member) session.getAttribute("loginUser");

		ArrayList<Task> taskList = sService.taskList(student);

		return new Gson().toJson(taskList);
	}

	// 과제 상세 조회
	@RequestMapping("taskDetail.st")
	public ModelAndView selectTask(Task task, ModelAndView mv, HttpSession session) {

		Member m = (Member) session.getAttribute("loginUser");

		task.setStudentId(m.getId());

		Task selectTask = sService.selectTask(task);

		if (selectTask != null) {
			mv.addObject("t", selectTask).setViewName("student/studentTaskDetail");
		} else {
			mv.setViewName("student/common/errorPage");
		}

		return mv;
	}

	// 과제 등록(제출)
	@RequestMapping("taskInsert.st")
	public String taskInsert(Task t, HttpSession session) {

		Member m = (Member) session.getAttribute("loginUser");

		t.setStudentId(m.getId());

		int result = sService.taskSubmitInsert(t);
		
		if (result > 0) {
			Alarm taskAlarm = new Alarm();
			taskAlarm.setId(t.getId());
			taskAlarm.setAlarmType("과제");
			taskAlarm.setAlarmContent(m.getName() + "님이 과제를 제출하셨습니다.");
			taskAlarm.setStatus("N");
			
			sService.insertAlarm(taskAlarm);
			
			session.setAttribute("student_alertMsg", "과제가 제출되었습니다!");
		} else {
			session.setAttribute("student_alertMsg", "과제 제출에 실패했습니다.");
		}

		return "redirect:boardList.st";
	}

	// 과제 수정
	@RequestMapping("updateTask.st")
	public String updateTask(Task task, Model model, HttpSession session) {

		Member m = (Member) session.getAttribute("loginUser");
		
		task.setStudentId(m.getId());

		int result = sService.updateTask(task);

		if (result > 0) {
			Alarm taskAlarm = new Alarm();
			taskAlarm.setId(task.getId());
			taskAlarm.setAlarmType("과제");
			taskAlarm.setAlarmContent(m.getName() + "님이 과제를 수정 했습니다");
			taskAlarm.setStatus("N");
			
			sService.insertAlarm(taskAlarm);
			
			session.setAttribute("student_alertMsg", "과제 성공적으로 수정했습니다.");
		} else {
			session.setAttribute("student_alertMsg", "과제 수정을 실패했습니다.");
		}

		return "redirect:taskDetail.st?taskNo=" + task.getTaskNo() + "&studentId=" + task.getStudentId();
	}

	// 과제 삭제
	@RequestMapping("deleteTaskJW.st")
	public String delete(Task task, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");

		task.setStudentId(m.getId());

		int result = sService.deleteTask(task);

		if (result > 0) {
			Alarm taskAlarm = new Alarm();
			taskAlarm.setId(task.getId());
			taskAlarm.setAlarmType("과제");
			taskAlarm.setAlarmContent(m.getName() + "님이 과제를 삭제 했습니다");
			taskAlarm.setStatus("N");
			
			sService.insertAlarm(taskAlarm);
			
			session.setAttribute("student_alertMsg", "게시글이 삭제되었습니다!");
		} else {
			session.setAttribute("student_alertMsg", "게시글 삭제 실패했습니다.");
		}
		return "redirect:boardList.st";
	}

	// 알람 조회
	@ResponseBody
	@RequestMapping(value = "alarm.st", produces = "application/json; charset=UTF-8")
	public String selectAlarm(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 학생 알람 모델
		ArrayList<Alarm> alarmList = sService.selectAlarmList(loginUser.getId());
		
		return new Gson().toJson(alarmList);
	}

	// 알림 읽음 처리
	@RequestMapping(value = "alarmCheck.st")
	public String taskAlarmCheck(int alarmNo, String type) {

		sService.taskAlarmCheck(alarmNo);

		if (type.equals("과제")) {
			return "redirect:boardList.st";
		} else {
			return "redirect:testList.st";
		}

	}

	// 우리반 게시판 Q&A 목록 조회
	@ResponseBody
	@RequestMapping(value = "qnaList.st", produces = "application/json; charset=utf-8")
	public Map<String, Object> qnaList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
			 @RequestParam(required = false, defaultValue="") String searchType,
			 @RequestParam(required = false, defaultValue="") String keyword,
			HttpSession session) {

		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);

		int listCount = sService.qnaListCount(map);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);

		ArrayList<QnA> list = sService.qnaList(pi, map);

		int listcount = pi.getListCount(); // 현재 총 게시글 개수 저장
		int page = pi.getCurrentPage(); // 현재페이지
		int pageLimit = pi.getPageLimit(); // 페이징바의 페이지 최대개수 (1~10)(11~20) -> 10개
		int boardLimit = pi.getBoardLimit(); // 보여질 보드게시글갯수
		int maxPage = pi.getMaxPage(); // 가장 마지막페이지 (총페이지) 전체게시글의 가장 끝
		int startPage = pi.getStartPage(); // 페이징바의 시작수 4번선택시 1, 12번시 11
		int endPage = pi.getEndPage(); // 페이징바의 끝수 4번선택시10, 12선택시 20

		result.put("list", list);
		result.put("listcount", listcount);
		result.put("page", page);
		result.put("pageLimit", pageLimit);
		result.put("boardLimit", boardLimit);
		result.put("maxPage", maxPage);
		result.put("startPage", startPage);
		result.put("endPage", endPage);
		System.out.println(currentPage);

		return result;
	}

	// Q&A 게시판 상세 조회
	@RequestMapping("qnaDetail.st")
	public ModelAndView selectQna(int qno, ModelAndView mv, HttpSession session) {

		QnA q = sService.selectQna(qno);
		System.out.println(q);
	
		if (q != null) {	
			mv.addObject("q", q).setViewName("student/studentQnaDetail");
		
		} else  {
			mv.setViewName("student/common/errorPage");

		}

		return mv;
	}
	
	
	@RequestMapping("qnaInsert.st")
	public String qnaInsertForm() {
		return "student/studentQnaEnrollForm";
	}
	
	@RequestMapping("qnaModify.st")
	public ModelAndView qnaModifyForm(int qno, Model model, ModelAndView mv, HttpSession session) {

		QnA q = sService.selectQna(qno);
		Member m = (Member) session.getAttribute("loginUser");
		
		if (q != null && q.getBoardWriter().equals(m.getId())) {	
			mv.addObject("q", q).setViewName("student/studentQnaUpdateForm");
		
		} else  {
			mv.setViewName("student/common/errorPage");

		}

		return mv;
		
		//return "student/studentQnaUpdateForm";
	}

	
	// QnA 등록
	@PostMapping("qnaInsert.st")
	public String qnaInsert(QnA q, HttpSession session) {
		System.out.println("QnA "+ q);
		
		Member m = (Member) session.getAttribute("loginUser");
		
		q.setViews(q.getViews()+1); 
		q.setBoardWriter(m.getId());
		
		int result = sService.insertQna(q);

		if (result > 0) {
			session.setAttribute("student_alertMsg", "QnA 등록이 되었습니다!");
		} else {
			session.setAttribute("student_alertMsg", "QnA 등록에 실패했습니다.");
		}

		return "redirect:boardList.st";
	}
	
	// qna 수정
	@PostMapping("updateQna.st")
	public String updateQna(QnA qna, Model model, HttpSession session) {

		Member m = (Member) session.getAttribute("loginUser");

		qna.setBoardWriter(m.getId());

		int result = sService.updateQna(qna);

		if (result > 0) {
			session.setAttribute("student_alertMsg", "QnA를 성공적으로 수정했습니다.");
		} else {
			session.setAttribute("student_alertMsg", "QnA 수정을 실패했습니다.");
		}

		return "redirect:qnaDetail.st?qno=" + qna.getBoardNo() ;
	}

	// qna 삭제
	@RequestMapping("deleteQna.st")
	public String deleteQna(QnA qna, HttpSession session) {
		Member m = (Member) session.getAttribute("loginUser");

		qna.setBoardWriter(m.getId());

		int result = sService.deleteQna(qna);

		if (result > 0) {
			session.setAttribute("student_alertMsg", "QnA가 삭제되었습니다!");
		} else {
			session.setAttribute("student_alertMsg", "QnA 삭제 실패했습니다.");
		}
		return "redirect:boardList.st";
	}

	// Q&A 게시판 댓글 등록
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxInsertReply(Reply r) {

		int result = sService.insertReply(r);

		return result > 0 ? "success" : "fail";
	}

	// Q&A 게시판 답댓글 등록
	@ResponseBody
	@RequestMapping("rereplyinsert.bo")
	public String ajaxInsertReReply(Reply r) {
		System.out.println(r);
		int result = sService.insertReReply(r);
		return result > 0 ? "success" : "fail";
	}

	
	@ResponseBody
	@RequestMapping(value = "rlist.bo", produces = "application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int qno) {

		ArrayList<Reply> list = sService.selectReplyList(qno);

		return new Gson().toJson(list);
	}

	@RequestMapping("myPage.st")
	public String myPage() {
		return "student/studentMyPage";
	}

	// 마이페이지 정보 수정
	@RequestMapping("update.st")
	public String updateStudent(Member m, HttpSession session, Model model) {

		int result = sService.updateStudent(m);

		System.out.println("result 의 값 : " + result);
		if (result > 0) {

			System.out.println("수정 성공시");
			m.setSort(3);
			Member updateMember = mService.loginMember(m);
			System.out.println(updateMember);

			session.setAttribute("loginUser", updateMember);
			session.setAttribute("student_alertMsg", "성공적으로 회원정보가 변경되었습니다!");

		}

		return "redirect:myPage.st";
	}

	// 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {

		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);

		return mailService.joinEmail(email);
	}

	// 마이페이지 내 과제 목록
	@RequestMapping("myTask.st")
	public ModelAndView myTask(ModelAndView mv, HttpSession session) {

		Member id = (Member) session.getAttribute("loginUser");

		ArrayList<Task> list = sService.selectMyTask(id.getId());

		mv.addObject("list", list).setViewName("student/studentMyTask");

		return mv;
	}

	/*
	 * // 마이페이지 내 과제 삭제
	 * 
	 * @RequestMapping("deleteMyTask.st")
	 * 
	 * @ResponseBody public void deleteTask(@RequestParam(value = "taskNoList[]")
	 * List<Integer> taskNoList) {
	 * 
	 * sService.deleteMyTask(taskNoList); }
	 */

	@RequestMapping("deleteMyTask.st")
	@ResponseBody
	public void deleteTask(@RequestParam(value = "collection") List<Integer> taskNoList) {

		sService.deleteMyTask(taskNoList);
	}

	@RequestMapping("myTest.st")
	public String myTest(HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		Exam e = new Exam();
		e.setTestNo(0);
		e.setStudentId(m.getId());
		
		ArrayList<Exam> list = sService.selectExamResultList(e);
		
		model.addAttribute("list", list);
		
		return "student/studentMyTestState";
	}

	@RequestMapping("myAttendance.st")
	public ModelAndView myAttendance(Member m, HttpSession session, ModelAndView mv) {

		Member loginUser = (Member) session.getAttribute("loginUser");

		ArrayList<Member> ins = sService.selectIns(loginUser);
		ArrayList<Attendance> att = sService.selectAtt(); // 출석률
		ArrayList<Attendance> attDay = sService.selectAttDay(); // 출석일
		ArrayList<Attendance> attTotal = sService.selectAttTotal(); // 총수업일
		
		System.out.println(att + "1353" + attDay + "gagndf" + attTotal);
		mv.addObject("ins", ins).addObject("att", att).addObject("attDay", attDay).addObject("attTotal", attTotal).setViewName("student/studentMyAttendance");
		
		return mv;
	}
	
	@RequestMapping("fileDown.do")
	public void fileDown(HttpServletRequest request , HttpServletResponse response, String fileName, String fileDir,  ModelAndView mv) throws Exception {
		//String fileName = request.getParameter("fileName");
		//String fileDir =  request.getParameter("fileDir");
		
		try {
			String realPath = "c:/";

			// 파일 이름이 파라미터로 넘어오지 않으면 리다이렉트 시킨다.
			if(request.getParameter("fileName") == null || "".equals(request.getParameter("fileName"))){

				response.sendRedirect("/redirect.jsp");

			}else{

				// 파라미터로 받은 파일 이름.
				String requestFileNameAndPath = request.getParameter("fileName");
				
				// 서버에서 파일찾기 위해 필요한 파일이름(경로를 포함하고 있음)
				// 한글 이름의 파일도 찾을 수 있도록 하기 위해서 문자셋 지정해서 한글로 바꾼다.
				String UTF8FileNameAndPath = new String(requestFileNameAndPath.getBytes("8859_1"), "UTF-8");
				
				// 파일이름에서 path는 잘라내고 파일명만 추출한다.
				String UTF8FileName = UTF8FileNameAndPath.substring(UTF8FileNameAndPath.lastIndexOf("/") + 1).substring(UTF8FileNameAndPath.lastIndexOf(File.separator) + 1);
				
				// 브라우저가 IE인지 확인할 플래그.
				boolean MSIE = request.getHeader("user-agent").indexOf("MSIE") != -1;
				
				// 파일 다운로드 시 받을 때 저장될 파일명
				String fileNameToSave = "";

				// IE,FF 각각 다르게 파일이름을 적용해서 구분해주어야 한다.
				if(MSIE){
					// 브라우저가 IE일 경우 저장될 파일 이름
					// 공백이 '+'로 인코딩된것을 다시 공백으로 바꿔준다.
					fileNameToSave = URLEncoder.encode(UTF8FileName, "UTF8").replaceAll("\\+", " ");
				}else{
					// 브라우저가 IE가 아닐 경우 저장될 파일 이름
					fileNameToSave = new String(UTF8FileName.getBytes("UTF-8"), "8859_1");
				}

				// 다운로드 알림창이 뜨도록 하기 위해서 컨텐트 타입을 8비트 바이너리로 설정한다.
				response.setContentType("application/octet-stream");
				
				// 저장될 파일 이름을 설정한다.
				response.setHeader("Content-Disposition", "attachment; filename=\"" + fileNameToSave + "\";");
				
				// 파일패스 및 파일명을 지정한다.
				//  String filePathAndName = pageContext.getServletContext().getRealPath("/") + UTF8FileNameAndPath;
				String filePathAndName = realPath + UTF8FileNameAndPath;
				File file = new File(filePathAndName);
				
				// 버퍼 크기 설정
				byte bytestream[] = new byte[2048000];

				// response out에 파일 내용을 출력한다.
				if (file.isFile() && file.length() > 0){
					
					FileInputStream fis = new FileInputStream(file);
					BufferedInputStream bis = new BufferedInputStream(fis);
					BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
						
					int read = 0;
						
					while ((read = bis.read(bytestream)) != -1){
						bos.write(bytestream , 0, read);
					}
					
					bos.close();
					bis.close();
					
				}

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		// 파일이 저장될 경로.
		
		
		//mv.addObject("fileName", fileName);
		//mv.addObject("fileDir", fileDir);
		//mv.setViewName("down");
		
		//return mv;
	}
}