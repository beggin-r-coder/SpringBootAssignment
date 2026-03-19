package com.capgemini.training.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.capgemini.training.entity.UserEntity;
import com.capgemini.training.service.LoginService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@GetMapping("/")
	public String loginPage() {
		return "login";
	}
	
	@PostMapping("/login")
	public String validate(String user, String password, HttpServletRequest request, HttpServletResponse response) {
		String page = null;
		System.out.println(user);
		System.out.println(password);
		
		boolean flag = loginService.validateUser(user, password);
		if(flag)
			try {
				request.getRequestDispatcher("/allemp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		else
			page = "login";
		return page;
	}
	
	@PostMapping("/sign-up")
	public String signUp(HttpServletRequest request) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		
		System.out.println("Name : "+name+" Email : "+email);
		System.out.println("User : "+user+" Password : "+password);
		
		UserEntity userEntity = new UserEntity();
		
		userEntity.setEmail(email);
		userEntity.setName(name);
		userEntity.setPassword(password);
		userEntity.setUser(user);
		
		loginService.registerUser(userEntity);
		
		return "home";
	}
	
}