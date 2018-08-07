package com.dcm;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import com.dcm.mail.EmailServiceImpl;
import com.dcm.service.UserService;

@SpringBootApplication
@EnableScheduling
public class LegalAppApplication extends SpringBootServletInitializer{
	
	@Autowired
	private EmailServiceImpl emailService;
	
	@Autowired
	private UserService userservice;
	
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(LegalAppApplication.class);
    }

	public static void main(String[] args) {
		SpringApplication.run(LegalAppApplication.class, args);
	}	

	@Scheduled(cron = "0 0 9,17 * * *")
	public void scheduleFixedRateTask() throws MessagingException {
	    String[] to = userservice.getEmail();
		emailService.sendMailWithAttachement(to);
		
	}
}
