package com.dcm;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.dcm.mail.EmailServiceImpl;
import com.dcm.service.UserService;

@SpringBootApplication
@EnableScheduling
public class LegalAppApplication {
	
	@Autowired
	private EmailServiceImpl emailService;
	
	@Autowired
	private UserService userservice;

	public static void main(String[] args) {
		SpringApplication.run(LegalAppApplication.class, args);
	}
	
	
	
	@Scheduled(cron = "0 0 9,17 * * *")
	public void scheduleFixedRateTask() throws MessagingException {
	    String[] to = userservice.getEmail();
		emailService.sendMailWithAttachement(to);
		System.out.println("Reminder Send");
		
	}
}
