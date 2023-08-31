package com.tina.dailyPlanner.service.impl;

import org.springframework.stereotype.Service;

import com.tina.dailyPlanner.model.User;
import com.tina.dailyPlanner.repository.UserRepository;
import com.tina.dailyPlanner.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	private UserRepository userRepo;
	

	public UserServiceImpl(UserRepository userRepo) {
		super();
		this.userRepo = userRepo;
	}

	@Override
	public String register(User user) {
		User user1=userRepo.findByEmail(user.getEmail());
		if(user1==null) {
			userRepo.save(user);
			return "";
		}
		return "User already exists try to login";
	}

	@Override
	public User login(String email, String password) {
		User user1=userRepo.findByEmailAndPassword(email, password);
		if(user1!=null) {
			return user1;
		}
		return null;
	}

	@Override
	public User getById(long id) {
		User user=userRepo.findById(id).orElseThrow();
		return user;
	}

	@Override
	public User getByUsername(String username) {
		User user=userRepo.findByUsername(username);
		return user;
	}
}
