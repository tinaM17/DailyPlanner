package com.tina.dailyPlanner.service;

import java.time.LocalDate;
import java.util.List;

import com.tina.dailyPlanner.model.Tasks;
import com.tina.dailyPlanner.model.User;

public interface TaskService {

	String addTask(Tasks task);
	List<Tasks> searchByDateAndUser(LocalDate date,User user);
	Tasks getById(long id);
	String deleteById(Long id);
	void updateTaskStatus(Long taskId, boolean status);
}
