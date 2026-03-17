package com.capgemini.training.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.capgemini.training.entity.Employee;
import com.capgemini.training.service.EmployeeService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class EmployeeController {
	@Autowired
	EmployeeService employeeService;
	
	@RequestMapping("/allemp")
	public String getAllEmployees(HttpServletRequest request) {
		System.out.println("**************************");
		List<Employee> listOfEmployees = employeeService.getAllEmployees();
		for(Employee emp : listOfEmployees) {
			System.out.println("Emp : "+emp.getEmpName());
		}
		request.setAttribute("emplist", listOfEmployees);
		return "home.jsp";
	}
}