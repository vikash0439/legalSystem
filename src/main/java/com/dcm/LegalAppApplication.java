package com.dcm;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.dcm.mail.EmailServiceImpl;
import com.dcm.modal.Users;
import com.dcm.service.UserService;

@SpringBootApplication
@EnableScheduling
public class LegalAppApplication extends SpringBootServletInitializer {

	private static final Logger LOGGER = LoggerFactory.getLogger(LegalAppApplication.class);
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
		LOGGER.info("Main program running");
	}

	// Scheduled for hearing dates and back up 10AM everyday
	@Scheduled(cron = "0 0 10 * * *")
	public void HearingReminder() throws MessagingException {
		String[] to = userservice.getEmail();
		emailService.hearingReminder(to);
		LOGGER.info("Hearing Reminder Executed");
		
		// Automatic database backup code
		
		String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());

		File f = new File("DB_backup//");
		if (!f.exists()) {
			if (f.mkdir()) {
				LOGGER.info("Directory created");
			}
		}
		String path = f.getAbsolutePath();
//		path = path.replace('\\', '/');
		path = path + "/" + date + ".sql";

		Process p = null;
		try {
			Runtime runtime = Runtime.getRuntime();
			p = runtime.exec("C:/Program Files (x86)/MySQL/MySQL Server 5.5/bin/mysqldump.exe -uroot -pdcm --add-drop-database -B legal -r"+ path);
			int processComplete = p.waitFor();
			if (processComplete == 0) {
				LOGGER.info("Backup Created Success at : " +path);
			}
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.info("Can't Create backup");
		}
		LOGGER.info("Database Backup Executed");
	}

	// Reminder 1 min interval
	@Scheduled(fixedRate = 60000)
	public void DateTimeReminder() throws MessagingException {
		String[] to = userservice.getEmail();
		emailService.sendMailWithAttachement(to);

	}
	
	@Scheduled(cron = "0 1 0 * * *")
	public void Birthday() throws MessagingException {		
		List<Users> bday = userservice.TodayBirthday();	
		String[] bcc = userservice.getEmail();
		emailService.BirthdayReminder(bday, bcc);
		bcc = null;
		LOGGER.info("Birthday Module Executed");
	}

}
