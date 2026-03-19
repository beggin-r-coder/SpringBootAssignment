package com.capgemini.training.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capgemini.training.dao.EmployeeRepository;
import com.capgemini.training.entity.Employee;

@Service
public class EmployeeService {
	@Autowired
	EmployeeRepository employeeRepository;
	
	public List<Employee> getAllEmployees(){
		return employeeRepository.findAll();
	}
	
	public Employee registerEmployee(Employee emp) {
		return employeeRepository.save(emp);
	}
	
	public Employee getEmployeeByInfo(int id) {
		return employeeRepository.findById(id).get();
	}
}
