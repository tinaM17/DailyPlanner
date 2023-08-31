package com.tina.dailyPlanner.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tina.dailyPlanner.model.Tasks;
import com.tina.dailyPlanner.model.User;
import com.tina.dailyPlanner.service.TaskService;
import com.tina.dailyPlanner.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes("username")
public class PlannerController {

	private TaskService taskService;
	private UserService userService;

	public PlannerController(TaskService taskService, UserService userService) {
		super();
		this.taskService = taskService;
		this.userService = userService;
	}

	@RequestMapping("")
	public String home() {
		return "home";
	}

	@RequestMapping("/user")
	public String userHome(HttpSession session,ModelMap model) {
		String username = (String) session.getAttribute("username");
		System.out.println(username);
		model.put("username", username);
		return "home";
	}

	@GetMapping("/user/showPlanner")
	public String addPlannerPage(ModelMap model, HttpSession session) {
		String username = (String) session.getAttribute("username");
		model.put("username", username);
		return "addPlanner";
	}

	@GetMapping("/user/addPlanner")
	public String searchPlan(@RequestParam LocalDate date, ModelMap model, HttpSession session) {
		String username = (String) session.getAttribute("username");
		User user = userService.getByUsername(username);
		List<Tasks> tasks = taskService.searchByDateAndUser(date, user);
		int totalTask = tasks.size();
		if (totalTask > 0) {
			int completedTask = 0;
			for (Tasks task : tasks) {
				if (task.isStatus()) {
					completedTask++;
				}
			}
			double completedPercentage = (completedTask * 100.0) / totalTask;
			model.put("totalTasks", totalTask);
			model.put("completedTasks", completedTask);
			model.put("completedPercentage", completedPercentage);
		}
		boolean previousDay = false;
		if (date.isBefore(LocalDate.now())) {
			previousDay = true;
			model.put("previous", previousDay);
		}
		model.put("tasks", tasks);
		model.put("date", date);
		System.out.println(date);
		return "addPlanner";

	}

	@PostMapping("/user/createPlan")
	public String addPlan(@RequestParam LocalTime time, @RequestParam LocalDate date, @RequestParam String description,
			ModelMap model, HttpSession session) {
		String username = (String) session.getAttribute("username");
		User user = userService.getByUsername(username);
		Tasks task = new Tasks(description, date, time, false, user);
		taskService.addTask(task);
		return "redirect:/user/addPlanner?date=" + date;

	}

	@PostMapping("/user/editPlan")
	public String edit(@RequestParam LocalTime time, @RequestParam LocalDate date,
			@RequestParam(name = "taskId") Long task_id, @RequestParam String description, ModelMap model,
			HttpSession session) {
		String username = (String) session.getAttribute("username");
		User user = userService.getByUsername(username);
		Tasks task = new Tasks(task_id, description, date, time, false, user);
		taskService.addTask(task);
		return "redirect:/user/addPlanner?date=" + date;

	}

	@GetMapping("/user/createPlan")
	public String createPlan(@RequestParam(name = "date") LocalDate date, ModelMap model) {
		model.put("date", date);
		return "createPlan";

	}

	@GetMapping("/user/editPlan")
	public String editPlan(@RequestParam(name = "date") LocalDate date, @RequestParam(name = "task_id") Long id,
			ModelMap model) {
		model.put("date", date);
		Tasks task = taskService.getById(id);
		model.put("task", task);
		return "createPlan";

	}

	@GetMapping("/user/deletePlan")
	public String deletePlan(@RequestParam(name = "id") Long id, @RequestParam(name = "date") LocalDate date) {

		taskService.deleteById(id);
		return "redirect:/user/addPlanner?date=" + date;

	}

	@GetMapping("/user/updateTaskStatus")
	public String updateTaskStatus(@RequestParam Long taskId, @RequestParam LocalDate date,
			@RequestParam boolean status) {
		// Update the task status in the database
		taskService.updateTaskStatus(taskId, status);

		return "redirect:/user/addPlanner?date=" + date;
	}

}
