package com.dcm.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.dcm.modal.Reminder;
import com.dcm.repository.ReminderRepository;

@Service
@Transactional
public class ReminderService {

	private final ReminderRepository reminderRepository;
	

	public ReminderService(ReminderRepository reminderRepository) {
		this.reminderRepository = reminderRepository;
	}

	public void saveReminder(Reminder reminder) {
		reminderRepository.save(reminder);
	}

	public List<Reminder> showAllReminder() {
		List<Reminder> reminder = new ArrayList<Reminder>();
		reminderRepository.findAll().forEach(reminder::add);
		return reminder;
	}

	public List<Reminder> AllReminder() {
		LocalDate dash = java.time.LocalDate.now();
		DateTimeFormatter formatters = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String d = dash.format(formatters);
		List<Reminder> reminder = new ArrayList<Reminder>();
		reminderRepository.findByDate(d).forEach(reminder::add);
		dash = null;
		return reminder;
	}

	public List<Reminder> MailReminder() {
		LocalDate date= java.time.LocalDate.now();
		 DateTimeFormatter formatters = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String d = date.format(formatters);
		List<Reminder> reminder = new ArrayList<Reminder>();
		reminderRepository.findByDate(d).forEach(reminder::add);
		d= null;	
		return reminder;
	}
	
	public List<Reminder> MailReminderwithTime() {
		LocalDate date= java.time.LocalDate.now();
		 DateTimeFormatter formatters = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		String d = date.format(formatters);
		
		LocalTime t= java.time.LocalTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("hh:mm");
		String time = t.format(format);
		System.out.println("Time  from mailReminderwithTime : "+time + " Date : "+d);
		
		List<Reminder> reminder = new ArrayList<Reminder>();
		reminderRepository.findByDateAndTime(d, time).forEach(reminder::add);
		d= null;	
		return reminder;
	}

	public List<Reminder> showByCaseno(String caseno) {
		List<Reminder> reminder = new ArrayList<Reminder>();
		reminderRepository.findByCaseno(caseno).forEach(reminder::add);
		return reminder;
	}

}
