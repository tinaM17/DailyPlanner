package com.tina.dailyPlanner.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tina.dailyPlanner.model.User;


public interface UserRepository extends JpaRepository<User,Long> {

	public User findByEmail(String email);
	public User findByEmailAndPassword(String email,String password);
	public User findByUsername(String username);
}
