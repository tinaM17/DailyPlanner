package com.tina.dailyPlanner.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;

import com.tina.dailyPlanner.model.Tasks;
import com.tina.dailyPlanner.model.User;
import com.tina.dailyPlanner.repository.TaskRepository;
import com.tina.dailyPlanner.service.TaskService;

@Service
public class TaskServiceImpl implements TaskService {
	
	private TaskRepository taskRepo;

	public TaskServiceImpl(TaskRepository taskRepo) {
		super();
		this.taskRepo = taskRepo;
	}

	@Override
	public String addTask(Tasks task) {
		taskRepo.save(task);
		return "Task added successfully!!!";
	}

	@Override
	public List<Tasks> searchByDateAndUser(LocalDate date,User user) {
		List<Tasks> tasks=taskRepo.findByDateAndUserOrderByTime(date,user);
		return tasks;
	}

	@Override
	public Tasks getById(long id) {
		Tasks task=taskRepo.findById(id).orElseThrow();
		return task;
	}

	@Override
	public String deleteById(Long id) {
		taskRepo.deleteById(id);
		return "Deleted successfully";
	}

	@Override
	public void updateTaskStatus(Long taskId, boolean status) {
		Tasks task=taskRepo.findById(taskId).orElseThrow();
		task.setStatus(status);
		taskRepo.save(task);
		
	}

}
