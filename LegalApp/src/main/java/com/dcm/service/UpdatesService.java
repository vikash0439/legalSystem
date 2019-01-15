package com.dcm.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.dcm.modal.Updates;
import com.dcm.repository.UpdatesRepository;

@Service
@Transactional
public class UpdatesService{
	
	private final UpdatesRepository updatesRepository;
	
	public UpdatesService(UpdatesRepository updatesRepository) {
		this.updatesRepository = updatesRepository;
	}
	
	public void saveMyUpdates(Updates updates) {
		updatesRepository.save(updates);
	}
	
	public List<Updates> showAllUpdates(){
		List<Updates> updates=new ArrayList<Updates>();
		updatesRepository.findAll().forEach(updates :: add);
		return updates;
	}
	
	

	

}
