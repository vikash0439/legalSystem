package com.dcm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.dcm.modal.UpdateCase;

public interface UpdatecaseRepository extends JpaRepository<UpdateCase, Integer>{
	
	public UpdateCase findTop1ByCasenoOrderByUpdateidDesc(String caseno);
	
	@Query(value = "select * from updatecase where nexthearing = ?1 or nexthearing = ?2 ;", nativeQuery = true)
	public Iterable<UpdateCase> findHearings(String d2, String d);

	public Iterable<UpdateCase> findByNexthearing(String d);
	
}
