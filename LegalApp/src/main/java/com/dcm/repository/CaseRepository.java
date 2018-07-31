package com.dcm.repository;



import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.dcm.modal.Case;

public interface CaseRepository extends CrudRepository<Case, Integer>{

	Case findById(int id);
    
	@Query(value = "select caseno from cases;", nativeQuery = true)
	public List<String> findTitle();

	@Query(value = "select caseno from cases;", nativeQuery = true)
	public List<String> findCaseno();
	

}
