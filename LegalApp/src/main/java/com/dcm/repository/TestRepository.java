package com.dcm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.dcm.modal.Acts;
import com.dcm.modal.Test;

public interface TestRepository extends CrudRepository<Test, Integer>{
	
	

}
