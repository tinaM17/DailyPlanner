package com.tina.dailyPlanner.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tina.dailyPlanner.model.Tasks;
import com.tina.dailyPlanner.model.User;

public interface TaskRepository extends JpaRepository<Tasks,Long> {
    List<Tasks> findByDateAndUser(LocalDate date,User user);
    List<Tasks> findByDateAndUserOrderByTime(LocalDate date,User user);
}
