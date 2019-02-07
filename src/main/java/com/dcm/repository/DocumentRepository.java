package com.dcm.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.dcm.modal.Document;

public interface DocumentRepository extends CrudRepository<Document, Integer>{
	
	public List<Document> findByCaseno(String caseno);

}
