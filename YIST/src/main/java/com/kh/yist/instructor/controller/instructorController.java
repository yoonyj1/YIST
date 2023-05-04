package com.kh.yist.instructor.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yist.task.model.service.TaskService;
import com.kh.yist.task.model.vo.Task;
import com.kh.yist.task.model.vo.TaskSubmit;
import com.sun.tools.javac.util.List;
import com.kh.yist.common.model.vo.PageInfo;
import com.kh.yist.common.template.Pagination;
import com.kh.yist.member.model.service.MemberService;
import com.kh.yist.member.model.vo.Member;
import com.kh.yist.student.model.service.StudentService;

@Controller
public class instructorController {

	@Autowired
	private TaskService tService;
	@Autowired
	private MemberService mService;
	

	@RequestMapping("examForm.ins")
	public String examForm() {
		return "instructor/examForm";
	}

	@RequestMapping("calendar.ins")
	public String Calendar() {
		return "instructor/calendarForm";
	}

	@RequestMapping("studentForm.ins")
	public String studentForm(Model model) {
		//리스트조회
		ArrayList<Member> list = mService.selectList();
		model.addAttribute("list",list);
		// 모델 셋팅
		return "instructor/studentForm";
	}
	

	

	@RequestMapping("main.ins")
	public String main() {
		return "instructor/main";
	}

	@RequestMapping("yistcheck.ins")
	public String yistcheck() {
		return "instructor/yistcheck";
	}

	@RequestMapping("teacher.ins")
	public String teacher() {
		return "instructor/teacher";
	}

	@RequestMapping("dataForm.ins")
	public String dataForm() {
		return "instructor/dataForm";
	}

	@RequestMapping("gradeForm.ins")
	public String gradeForm() {
		return "instructor/gradeForm";
	}

	@RequestMapping(value = "insert.task")
	public String insertTask(Task task, MultipartFile upfile, HttpSession session, Model model) {

		System.out.println(task);

		if (!upfile.getOriginalFilename().equals("")) {

			String changeName = saveFile(upfile, session);

			task.setOriginName(upfile.getOriginalFilename());
			task.setChangeName("resources/instructor/uploadFiles/" + changeName);

		}

		int insertTask = tService.insertTask(task);
		int result = 0;

		if (insertTask > 0) {
			result = tService.insertTaskFile(task);
		}
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 파일이 등록되었습니다.");
			return "redirect:taskForm.ins";
		} else {
			System.out.println("실패 하였습니다.");
		}

		return "";
	}
	
	@RequestMapping("update.task")
	public String updateTask(Task task, MultipartFile reupfile, HttpSession session, Model model) {

		System.out.println("수정할 파일 : " + reupfile.getOriginalFilename());
		System.out.println("원본 파일 : " + task.getOriginName());
		
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
			session.setAttribute("alertMsg", "과제 수정에 실패했습니다.");
		}
		
		return "redirect:taskForm.ins";
	}
	
	@RequestMapping("taskForm.ins")
	public ModelAndView taskForm(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			                     @RequestParam(value = "keyword", defaultValue = "none") String keyword,
			                     @RequestParam(value = "startDate", defaultValue = "none") String startDate,
			                     @RequestParam(value = "endDate", defaultValue = "none") String endDate,
			                     ModelAndView mv, HttpSession session) {
		
		System.out.println("키워드 : " + keyword);
		System.out.println("시작날짜 : " + startDate);
		
		Member m = (Member) session.getAttribute("loginUser");

		Map<String,String> optMap = new HashMap<String,String>();
		
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
	
	/**
	 * 과제 상세 페이지 조회
	 * @param taskNo
	 * @param model
	 * @return
	 */
	@RequestMapping("detail.task")
	public String detailTask(int taskNo, Model model) {
		System.out.println("taskNo : " + taskNo);
		
		ArrayList<TaskSubmit> submitList = tService.selectSubmitList(taskNo);
		
		model.addAttribute("submitList", submitList);
		
		return "instructor/detailTaskForm";
	}
	
	@RequestMapping("taskCheck.ins")
	public String checkTaskSubmit(TaskSubmit ts, HttpSession session) {
		
		int result = tService.checkTaskSubmit(ts);
		
		String msg = "";
		
		if (result > 0) {
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
	
	

}
