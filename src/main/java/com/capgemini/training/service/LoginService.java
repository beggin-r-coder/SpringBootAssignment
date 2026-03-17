package com.capgemini.training.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capgemini.training.dao.LoginRepository;
import com.capgemini.training.entity.UserEntity;

@Service
public class LoginService {
	
	@Autowired
	LoginRepository loginRepository;
	
	public UserEntity registerUser(UserEntity userEntity) {
		return loginRepository.save(userEntity);
	}
	
	public boolean validateUser(String username, String password) {
		UserEntity user = loginRepository.findByUserAndPassword(username, password);
		if(user!=null)
			return true;
		return false;
	}
	
}
