package com.dcm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.dcm.modal.UpdateCase;

public interface UpdatecaseRepository extends JpaRepository<UpdateCase, Integer>{
	
	public UpdateCase findTop1ByCasenoOrderByUpdateidDesc(String caseno);
	
}
