package com.tina.dailyPlanner.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfiguration{
	
	@Autowired
    private CustomAuthenticationSuccessHandler authenticationSuccessHandler;

	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public UserDetailsService getUserDetails() {
		return new CustomUserDetailsService();
	}
	
	@Bean
	public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
		return configuration.getAuthenticationManager();
	}
	
	@Bean
	public DaoAuthenticationProvider daoAuthenticationProvider() {
		DaoAuthenticationProvider provider=new DaoAuthenticationProvider();
		provider.setUserDetailsService(getUserDetails());
		provider.setPasswordEncoder(passwordEncoder());
		return provider;
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {	
		http
			// Possibly more configuration ...
		.authorizeHttpRequests(auth->auth.requestMatchers(new AntPathRequestMatcher("/user/**")).authenticated())
		.authorizeHttpRequests(auth->auth.requestMatchers(new AntPathRequestMatcher("/user/webjars/**")).permitAll().anyRequest().permitAll())		
		.formLogin(login->login.loginPage("/login")
				.successHandler(authenticationSuccessHandler)
				.failureUrl("/login?error=true").permitAll())
	    .logout(logout->logout.logoutUrl("/logout").logoutSuccessUrl("/").invalidateHttpSession(true) // Invalidate the HttpSession after logout
	            .deleteCookies("JSESSIONID")); // Delete cookies after logout)	
		// enable form based log in
			// set permitAll for all URLs associated with Form Login;
	return http.build();

		}

}
