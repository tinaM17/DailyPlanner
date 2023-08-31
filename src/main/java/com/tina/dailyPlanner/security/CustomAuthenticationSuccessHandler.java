package com.tina.dailyPlanner.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		authentication = SecurityContextHolder.getContext().getAuthentication();
		String username=authentication.getName();
		HttpSession session= request.getSession();
		System.out.println(username);
		
		session.setAttribute("username", username);
		response.sendRedirect("/user");
		System.out.println("Authentication successful for user: " + username);
    }
		
}
