package com.tina.dailyPlanner.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long user_id;
	
	@Column
	private String username;
	@Column
	private String email;
	@Column
	private String password;
	
	@Column
	private String role;
	
	public User(String username, String email, String password,String role) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.role=role;
	}
    
}
