package com.capgemini.training;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
	
	@Autowired
	LoginService loginService;
	
	@GetMapping("/")
	public String loginPage() {
		return "login.jsp";
	}
	
	@PostMapping("/login")
	public String validate(String user, String password) {
		System.out.println(user);
		System.out.println(password);
		if(user.isEmpty()||password.isEmpty())
			return "login.jsp";
		return "home.jsp";
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
		
		return "home.jsp";
	}
	
}