package com.capgemini.training.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.capgemini.training.entity.UserEntity;

@Repository
public interface LoginRepository extends JpaRepository<UserEntity, Integer>{

	UserEntity findByUserAndPassword(String username, String password);
}