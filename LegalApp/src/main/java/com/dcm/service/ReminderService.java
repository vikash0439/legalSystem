package com.dcm.service;

import java.util.ArrayList;
import java.time.LocalDate;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

import com.dcm.modal.Reminder;
import com.dcm.repository.ReminderRepository;

@Service
@Transactional
public class ReminderService {
	
private final ReminderRepository reminderRepository;

	LocalDate date= java.time.LocalDate.now();	
	String d=date.toString();
	
	public ReminderService(ReminderRepository reminderRepository) {
		this.reminderRepository = reminderRepository;
	}
	
	public void saveReminder(Reminder reminder){
		reminderRepository.save(reminder);
	}
	
	public List<Reminder> showAllReminder(){
		List<Reminder> reminder=new ArrayList<Reminder>();
		reminderRepository.findAll().forEach(reminder :: add);
		return reminder;
	}
	
	public List<Reminder> AllReminder(){
		List<Reminder> reminder=new ArrayList<Reminder>();
		System.out.println(d);
		reminderRepository.findByDate(d).forEach(reminder:: add);
		return reminder;
	}
	
	public List<Reminder> showByCaseno(String caseno){
		List<Reminder> reminder=new ArrayList<Reminder>();
	    reminderRepository.findByCaseno(caseno).forEach(reminder :: add);
	    return reminder;
	}

}
