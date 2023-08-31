package com.tina.dailyPlanner.service;

import com.tina.dailyPlanner.model.User;




public interface UserService {
    
	String register(User user);
	
	User login(String email,String password);
	
	User getById(long id);
	
	User getByUsername(String username);
	
}
