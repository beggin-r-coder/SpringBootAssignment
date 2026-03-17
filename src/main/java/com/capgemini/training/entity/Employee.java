package com.capgemini.training.entity;

import jakarta.persistence.*;

@Entity
@Table(name="employees")
public class Employee {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;

	@Column(name="emp_id")
	private String empId;
	
	@Column(name="emp_name")
	private String empName;
	
	@Column(name="emp_mail")
	private String empEmail;
	
	@Column(name="emp_contact_no")
	private long empContactNo;
	
	@Column(name="emp_city")
	private String empCity;
	
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public long getEmpContactNo() {
		return empContactNo;
	}
	public void setEmpContactNo(long empContactNo) {
		this.empContactNo = empContactNo;
	}
	public String getEmpCity() {
		return empCity;
	}
	public void setEmpCity(String empCity) {
		this.empCity = empCity;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}