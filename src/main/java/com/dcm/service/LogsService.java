package com.dcm.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.dcm.modal.Logs;
import com.dcm.repository.LogsRepository;

@Service
@Transactional
public class LogsService {
	
	public final LogsRepository logsRepository;
	   
	 public LogsService(LogsRepository logsRepository) {
			this.logsRepository = logsRepository;
		}
	 
	 
	 public void saveLogs(Logs logs) {
		 logsRepository.save(logs);
	 }
	 
	 public List<Logs> getLog(String caseno){
		return logsRepository.findByCaseno(caseno);
		 
	 }

}
