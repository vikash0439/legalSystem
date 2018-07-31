package com.dcm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dcm.modal.CasesTrigger;

public interface CasesTriggerRepository extends JpaRepository<CasesTrigger, Integer>{
   
	List<CasesTrigger> findByUpdateid(int updateid);
}
