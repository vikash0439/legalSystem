package com.dcm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dcm.modal.CasesTrigger;
import com.dcm.repository.CasesTriggerRepository;

@Service
@Transactional
public class CasesTriggerService {
	
	private final CasesTriggerRepository casesTriggerRepository;
	
	public CasesTriggerService(CasesTriggerRepository casesTriggerRepository) {
		this.casesTriggerRepository = casesTriggerRepository;
	}
	
	
	public List<CasesTrigger> getCasesTrigger(int updateid) {
		List<CasesTrigger> casesTrigger=new ArrayList<CasesTrigger>();
		casesTriggerRepository.findByUpdateid(updateid).forEach(casesTrigger :: add);
		return casesTrigger;
	}

}
