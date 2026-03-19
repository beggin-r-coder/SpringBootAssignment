package com.capgemini.training.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.capgemini.training.entity.Employee;
import com.capgemini.training.entity.UserEntity;
import com.capgemini.training.service.EmployeeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
	
	@GetMapping("/addemp")
	public String createEmp() {
		return "register-emp.jsp";
		
	}
	
	@PostMapping("/addemp")
	public String signUp(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Add Employee is Called");
		String empId = request.getParameter("empId");
		String empName = request.getParameter("empName");
		String empEmail = request.getParameter("empEmail");
		String empContact = request.getParameter("empContactNo");
		String empCity = request.getParameter("empCity");	
		
		System.out.println("Emp Id : "+empId);
		System.out.println("Emp Name : "+empName+" Email : "+empEmail);
		System.out.println("Emp Contact : "+empContact+" City : "+empCity);
		
		Employee emp = new Employee();
		
		emp.setEmpId(empId);
		emp.setEmpName(empName);
		emp.setEmpEmail(empEmail);
		emp.setEmpContactNo(Long.parseLong(empContact));
		emp.setEmpCity(empCity);
		
		employeeService.registerEmployee(emp);

		List<Employee> listOfEmployees = employeeService.getAllEmployees();
		request.setAttribute("emplist", listOfEmployees);
		
		return "redirect:/allemp";
	}
	
	@GetMapping("/view-emp")
	public String viewEmp(@RequestParam int id, HttpServletRequest request) {
		System.out.println("Id : "+id);
		Employee emp = employeeService.getEmployeeByInfo(id);
		request.setAttribute("emp", emp);
		return "view-emp.jsp";
	}
}