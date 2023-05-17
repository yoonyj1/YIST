package com.kh.yist.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminCotroller {

	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	

	@RequestMapping("encode.me")
	public String getEncodePwd(String pwd) {
		
		String encPwd = bcryptPasswordEncoder.encode(pwd);
		System.out.println(encPwd);
		
		return "redirect:/";
	}

	
}
