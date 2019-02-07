package com.dcm.repository;



import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.dcm.modal.Reminder;

public interface ReminderRepository extends CrudRepository<Reminder, Integer>{
	
	public Iterable<Reminder> findByDate(String date);
	
	public List<Reminder> findByCaseno(String caseno);

	public Iterable<Reminder> findByDateAndTime(String d, String time);
}
