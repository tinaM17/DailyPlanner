package com.tina.dailyPlanner.model;

import java.time.LocalDate;
import java.time.LocalTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table
public class Tasks {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long task_id;
	
	@Column
	private String description;
	@Column
	private LocalDate date;
	@Column
	private LocalTime time;
	@Column
	private boolean status;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id",nullable=false)
	private User user;

	public Tasks(String description, LocalDate date, LocalTime time, boolean status, User user) {
		super();
		this.description = description;
		this.date = date;
		this.time = time;
		this.status = status;
		this.user = user;
	}
	

}
