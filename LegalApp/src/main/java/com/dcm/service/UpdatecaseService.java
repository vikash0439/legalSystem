package com.dcm.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.dcm.modal.UpdateCase;
import com.dcm.repository.UpdatecaseRepository;

@Service
@Transactional
public class UpdatecaseService {
	
private final UpdatecaseRepository updatecaseRepository;
	
	public UpdatecaseService(UpdatecaseRepository updatecaseRepository) {
		this.updatecaseRepository = updatecaseRepository;
	}
	
	public void saveMyUpdateCaseDetail(UpdateCase updatecase) {
		updatecaseRepository.save(updatecase);
	}
	
	public UpdateCase getBycaseno(String caseno) {
		UpdateCase updatecase = updatecaseRepository.findTop1ByCasenoOrderByUpdateidDesc(caseno);
		return updatecase;
	}

}
