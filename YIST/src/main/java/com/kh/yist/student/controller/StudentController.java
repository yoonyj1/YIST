package com.kh.yist.student.controller;

import java.util.ArrayList;

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
import com.kh.yist.member.model.vo.Alarm;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.service.StudentService;
import com.kh.yist.student.model.vo.Exam;
import com.kh.yist.student.model.vo.Material;
import com.kh.yist.student.model.vo.Notice;
import com.kh.yist.student.model.vo.QnA;
import com.kh.yist.student.model.vo.Task;

@Controller
public class StudentController {

	@Autowired
	private StudentService sService;

	@RequestMapping("main.st")
	public String main() {
		return "student/studentMain";
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
	public ModelAndView testList(ModelAndView mv) {

		ArrayList<Exam> list = sService.testList();

		mv.addObject("list", list).setViewName("student/studentTestList");

		return mv;
	}

	// 시험 상세 조회
	@RequestMapping("testDetail.st")
	public String testDetail(@RequestParam(value = "eno") int examNo, Model model) {

		Exam e = sService.testDetail(examNo);

		model.addAttribute("e", e);

		return "student/studentTestDetail";
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

		Notice n = sService.selectNotice(nno);
		System.out.println(n);

		mv.addObject("n", n).setViewName("student/studentNoticeDetail");

		return mv;
	}

	@RequestMapping("videoList.st")
	public String videoList() {
		return "student/studentVideoList";
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

		mv.addObject("pi", pi).addObject("list", list).setViewName("student/studentBoardList");

		return mv;
	}

	// 우리반 게시판 학습자료 목록 조회
	@ResponseBody
	@RequestMapping(value = "MaterialList.st", produces = "application/json; charset=UTF-8")
	public String MaterialList() {

		ArrayList<Material> list = sService.MaterialList();

		return new Gson().toJson(list);
	}

	// 우리반 게시판 과제 목록(제출여부) 조회
	@ResponseBody
	@RequestMapping(value = "taskList.st", produces = "application/json; charset=UTF-8")
	public String taskList(HttpSession session) {

		Member student = (Member) session.getAttribute("loginUser");

		ArrayList<Task> submitList = sService.taskSubmitList(student);

		return new Gson().toJson(submitList);
	}

	// 과제 상세 조회
	@RequestMapping("taskDetail.st")
	public ModelAndView selectTask(Task task, ModelAndView mv, HttpSession session) {

		Member m = (Member) session.getAttribute("loginUser");

		task.setStudentId(m.getId());

		Task selectTask = sService.selectTask(task);

		System.out.println(selectTask);

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

		int result = sService.taskInsert(t);

		if (result > 0) {
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
			session.setAttribute("student_alertMsg", "과제 성공적으로 수정했습니다.");
		} else {
			session.setAttribute("student_alertMsg", "과제 수정을 실패했습니다.");
		}

		return "redirect:taskDetail.st?taskNo=" + task.getTaskNo() + "&studentId=" + task.getStudentId();
	}

	// 과제 삭제
	@RequestMapping("deleteTask.st")
	public String delete(Task task, HttpSession session) {

		int result = sService.deleteTask(task);

		if (result > 0) {
			session.setAttribute("student_alertMsg", "게시글이 삭제되었습니다!");
			return "redirect:boardList.st";
		} else {
			session.setAttribute("student_alertMsg", "게시글 삭제 실패했습니다.");
			return "redirect:taskReplyDetail.st?tno=" + task.getTaskNo();
		}
	}

	// 알람 조회
	@ResponseBody
	@RequestMapping(value="alarm.st", produces = "application/json; charset=UTF-8")
	public String selectAlarm(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		// 학생 알람 모델
		ArrayList<Alarm> alarmList = sService.selectAlarmList(loginUser.getId());
		
		return new Gson().toJson(alarmList);
	}
	
	// 알림 읽음 처리
	@RequestMapping(value="alarmCheck.st")
	public String taskAlarmCheck(int alarmNo) {
		
		sService.taskAlarmCheck(alarmNo); 
		
		return "redirect:boardList.st";
	}
	
	// 우리반 게시판 Q&A 목록 조회
	@ResponseBody
	@RequestMapping(value = "qnaList.st", produces = "application/json; charset=UTF-8")
	public String qnaList() {

		ArrayList<QnA> list = sService.qnaList();

		return new Gson().toJson(list);
	}

	@RequestMapping("myPage.st")
	public String myPage() {
		return "student/studentMyPage";
	}

	@RequestMapping("myTask.st")
	public String myTask() {
		return "student/studentMyTask";
	}

	@RequestMapping("myTest.st")
	public String myTest() {
		return "student/studentMyTestState";
	}

	@RequestMapping("myAttendance.st")
	public String myAttendance() {
		return "student/studentMyAttendance";
	}
}