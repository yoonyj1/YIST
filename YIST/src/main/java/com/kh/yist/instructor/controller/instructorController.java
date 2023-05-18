package com.kh.yist.instructor.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.task.model.service.TaskService;
import com.kh.yist.task.model.vo.Task;
import com.kh.yist.task.model.vo.TaskSubmit;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.exam.model.vo.Exam;
import com.kh.yist.member.model.service.MemberServiceImpl;
import com.kh.yist.member.model.vo.Alarm;
import com.kh.yist.member.model.vo.Member;

@Controller
public class instructorController {

	@Autowired
	private TaskService tService;

	@Autowired
	private MemberServiceImpl mService;
	
	// 알람 조회
	@ResponseBody
	@RequestMapping(value="insAlarm.ins", produces = "application/json; charset=UTF-8")
	public String selectInsAlarm(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 학생 알람 모델
		ArrayList<Alarm> alarmList = tService.selectInsAlarmList(loginUser.getId());
		
		return new Gson().toJson(alarmList);
	}
	
	// 알림 읽음 처리
	@RequestMapping(value="insAlarmCheck.ins")
	public String insAlarmCheck(int alarmNo, String type) {
		
		tService.insAlarmCheck(alarmNo); 
		
		if (type.equals("과제")) {
			return "redirect:taskForm.ins";
		} else {
			return "redirect:examForm.ins";
		}
		
	}
	
	@RequestMapping("scoreForm.ins")
	public String scoreForm(HttpSession session, Model model, int testNo) {

		Exam question = tService.selectQuestion(testNo);
		ArrayList<Exam> examSubmitList = tService.selectExamSubmitList(testNo);

		model.addAttribute("question", question);
		model.addAttribute("examSubmitList", examSubmitList);

		return "instructor/detailExamForm";
	}

	@RequestMapping("examForm.ins")
	public String examForm(HttpSession session, Model model) {

		Member ins = (Member) session.getAttribute("loginUser");

		ArrayList<Exam> examList = tService.selectExamList(ins.getId());
		ArrayList<Exam> memberList = tService.selectExamMemberList(ins.getSubject());

		model.addAttribute("examList", examList);
		model.addAttribute("memberList", memberList);

		return "instructor/examForm";
	}

	// 시험 점수 등록
	@RequestMapping("examSetScore.ins")
	public String examSetScore(Exam exam, HttpSession session) {
		
		int result = tService.updateSetExamAnswer(exam);
		
		
		if (result > 0) {
			Alarm examAlarm = new Alarm();
			examAlarm.setId(exam.getStudentId());
			examAlarm.setAlarmType("시험");
			examAlarm.setAlarmContent("[" + exam.getTestTitle() + "] 채점이 완료되었습니다.");
			examAlarm.setStatus("N");
			
			tService.insertAlarm(examAlarm);
			session.setAttribute("alertMsg", exam.getStudentId() + " 학생의 채점이 완료 되었습니다.");
			
			return "redirect:examForm.ins";
		} else {
			session.setAttribute("alertMsg", exam.getStudentId() + " 학생의 채점이 등록에 실패 하였습니다.");
		}
		
		return "redirect:examForm.ins";
	}
	
	@RequestMapping("teacher.ins")
	public String teacher() {
		return "instructor/teacher";
	}

	@ResponseBody
	@RequestMapping("setExam.ins")
	public int setExam(String data, int testNo, int setTime) {

		int resultCount = 0;

		Exam setExamTime = new Exam();
		setExamTime.setExamTime(setTime);
		setExamTime.setTestNo(testNo);
		tService.setExamTime(setExamTime);

		List<Map<String, Object>> users = new Gson().fromJson(String.valueOf(data),
				new TypeToken<List<Map<String, String>>>() {}.getType());

		for (Map<String, Object> user : users) {
			String status = (String)user.get("status");
			String studentId = (String)user.get("id");
			
			System.out.println(status);
			System.out.println(studentId);
			
			Exam exam = new Exam();
			exam.setTestNo(testNo);
			exam.setExamTime(setTime);
			exam.setStudentId(studentId);
			
			Alarm taskAlarm = new Alarm();
			taskAlarm.setId(studentId);
			taskAlarm.setAlarmType("시험");
			taskAlarm.setAlarmContent("[자바시험3] 시험 응시가 가능합니다.");
			taskAlarm.setStatus("N");
			
			tService.insertAlarm(taskAlarm);
			tService.updateSetExam(exam);
			
			resultCount++;
		}
		
		if (resultCount == users.size()) {
			return 1;
		} else {
			return 0;
		}
		
	}

	@ResponseBody
	@RequestMapping(value="ajaxGradeForm.ins", produces = "application/json; charset=utf-8")
	public String ajaxGradeForm(int testNo, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Exam exam = new Exam();
		exam.setSubjectNo(Integer.parseInt(loginUser.getSubject()));
		exam.setTestNo(testNo);
		
		ArrayList<Exam> list = tService.selectAjaxGradeList(exam);
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping("calendar.ins")
	public String Calendar() {
		return "instructor/calendarForm";
	}

	@RequestMapping("studentForm.ins")
	public String studentForm(Model model) {
		// 리스트조회
		ArrayList<Member> list = mService.selectList();
		model.addAttribute("list", list);
		// 모델 셋팅
		return "instructor/studentForm";
	}

	@RequestMapping("main.ins")
	public String main() {
		return "instructor/main";
	}

	@RequestMapping("yistcheck.ins")
	public String yistcheck(Model model,Member m,HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String subject= loginUser.getSubject();
		ArrayList<Member> list = mService.selectList2(subject);
		
		model.addAttribute("list",list);
		return "instructor/yistcheck";
	}

	@RequestMapping("dataForm.ins")
	public String dataForm() {
		return "instructor/dataForm";
	}

	@RequestMapping("gradeForm.ins")
	public String gradeForm(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		ArrayList<Exam> gradeList = tService.selectGradeList(loginUser);
		
		ArrayList<Exam> examList = tService.selectExamScore(loginUser); 
		
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("examList", examList);
		
		return "instructor/gradeForm";
	}

	@RequestMapping(value = "insert.task")
	public String insertTask(Task task, MultipartFile upfile, HttpSession session, Model model) {

		int insertTask = tService.insertTask(task);

		if (!upfile.getOriginalFilename().equals("")) {

			if (insertTask > 0) {

				String changeName = saveFile(upfile, session);

				task.setOriginName(upfile.getOriginalFilename());

				task.setChangeName("resources/instructor/uploadFiles/" + changeName);

				tService.insertTaskFile(task);

			} else {
				session.setAttribute("alertMsg", "과제 등록에 실패했습니다.");
				return "redirect:taskForm.ins";
			}

		}

		if (insertTask > 0) {
			Member member = (Member) session.getAttribute("loginUser");

			// 강사 과목을 수강하고있는 학생 전체 과제 알람등록
			ArrayList<Member> membList = tService.selectTaskMember(member.getSubject());

			for (Member m : membList) {
				tService.insertTaskSubmit(m.getId());
			}

			for (Member m : membList) {
				Alarm taskAlarm = new Alarm();
				taskAlarm.setId(m.getId());
				taskAlarm.setAlarmType("과제");
				taskAlarm.setAlarmContent("[" + task.getTaskTitle() + "] 과제가 등록 되었습니다.");
				taskAlarm.setStatus("N");
				tService.insertAlarm(taskAlarm);
			}

			session.setAttribute("alertMsg", "성공적으로 과제가 등록되었습니다.");
		} else {
			session.setAttribute("alertMsg", "과제 등록에 실패했습니다.");
		}

		return "redirect:taskForm.ins";
	}

	@RequestMapping("update.task")
	public String updateTask(Task task, MultipartFile reupfile, HttpSession session, Model model) {


		if (!reupfile.getOriginalFilename().equals("")) {// 수정할 첨부 파일이 있을 경우

			if (task.getOriginName() != null) { // 원본 파일이 있을 경우
				new File(session.getServletContext().getRealPath(task.getChangeName())).delete(); // 원본 파일 삭제
			}

			String changeName = saveFile(reupfile, session);

			task.setOriginName(reupfile.getOriginalFilename());
			task.setChangeName("resources/instructor/uploadFiles/" + changeName);
		}

		int result = tService.updateTask(task);

		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 과제가 수정되었습니다");
		} else {
			session.setAttribute("alertMsg", "과제 수정에 실패했습니다.");
		}

		return "redirect:taskForm.ins";

	}

	@RequestMapping("delete.task")
	public String deleteTask(Task task, HttpSession session, Model model) {

		int result = tService.deleteTask(task);

		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 과제가 삭제되었습니다.");
		} else {
			session.setAttribute("alertMsg", "과제 삭제에 실패했습니다.");
		}

		return "redirect:taskForm.ins";
	}

	@RequestMapping("taskForm.ins")
	public ModelAndView taskForm(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyword", defaultValue = "none") String keyword,
			@RequestParam(value = "startDate", defaultValue = "none") String startDate,
			@RequestParam(value = "endDate", defaultValue = "none") String endDate, ModelAndView mv,
			HttpSession session) {

		System.out.println("키워드 : " + keyword);
		System.out.println("시작날짜 : " + startDate);

		Member m = (Member) session.getAttribute("loginUser");

		Map<String, String> optMap = new HashMap<String, String>();

		optMap.put("id", m.getId());
		optMap.put("keyword", keyword);
		optMap.put("startDate", startDate);
		optMap.put("endDate", endDate);

		int taskListCount = tService.selectTaskListCount(optMap);

		PageInfo pi = Pagination.getPageInfo(taskListCount, currentPage, 10, 5);

		ArrayList<Task> taskList = tService.selectTaskList(pi, optMap);

		mv.addObject("pi", pi).addObject("taskList", taskList).setViewName("instructor/taskForm");

		return mv;
	}

	// 과제 페이지 상세조회
	@RequestMapping("detail.task")
	public String detailTask(int taskNo, Model model) {

		ArrayList<TaskSubmit> submitList = tService.selectSubmitList(taskNo);

		model.addAttribute("submitList", submitList);

		return "instructor/detailTaskForm";
	}

	@RequestMapping("taskCheck.ins")
	public String checkTaskSubmit(TaskSubmit ts, HttpSession session) {

		System.out.println("과제 확ㅇ니~~~~");
		System.out.println(ts);
		
		int result1 = tService.checkTaskSubmit(ts);
		int result2 = 0;

		if (result1 > 0) {
			Alarm taskAlarm = new Alarm();
			taskAlarm.setId(ts.getStudentId());
			taskAlarm.setAlarmType("과제");
			taskAlarm.setAlarmContent("[" + ts.getTaskTitle() + "] 과제 확인이 완료되었습니다.");
			taskAlarm.setStatus("N");
			result2 = tService.insertAlarm(taskAlarm);
		}

		String msg = "";

		if (result2 > 0) {
			msg = "확인이 완료되었습니다.";
		} else {
			msg = "확인 실패하였습니다.";
		}

		session.setAttribute("alertMsg", msg);

		return "redirect:detail.task?taskNo=" + ts.getTaskNo();
	}

	public String saveFile(MultipartFile upfile, HttpSession session) {

		String originName = upfile.getOriginalFilename(); // flower.png

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int) (Math.random() * 90000 + 10000);

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = originName;

		String savePath = session.getServletContext().getRealPath("/resources/instructor/uploadFiles/");

		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return changeName;
	}

	@RequestMapping("/update.me")
	public String updateMember(Member m, HttpSession session, Model model) {
		int result = mService.updateTeacher(m);
		System.out.println(m);
		System.out.println(result);
		if (result > 0) {

			session.setAttribute("loginUser", mService.selectTeacher(m));
			session.setAttribute("alerMsg", "수정 완료");
			return "redirect:teacher.ins";

		} else {
			model.addAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="slist.bo", produces = "application/json; charset=utf-8")
	public String ajaxSelectStudent(String id) {
		System.out.println(id);
		Member m = mService.selectStudentList(id);
		return new Gson().toJson(m);
		
		//return "redirect:studentForm.ins";
	}
	
	@ResponseBody
	@RequestMapping(value="ylist.bo", produces = "application/json; charset=utf-8")
	public String ajaxSelectCheck(String date) {
		System.out.println(date);
		ArrayList<Member> m = mService.selectStudentList2(date);
		System.out.println(m);
		return  new Gson().toJson(m);
	}

}
