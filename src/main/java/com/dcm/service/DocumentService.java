package com.dcm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dcm.modal.Document;
import com.dcm.repository.DocumentRepository;

@Service
@Transactional
public class DocumentService {
	
	private final DocumentRepository documentRepository;
	
	public DocumentService(DocumentRepository documentRepository) {
		this.documentRepository = documentRepository;
	}
	
	public void saveMyDocument(Document document) {
		documentRepository.save(document);
	}
	
	public Long noOfDocument() {
		return documentRepository.count();
	}
	
	public List<Document> showAllDocument(){
		List<Document> document=new ArrayList<Document>();
	    documentRepository.findAll().forEach(document :: add);
	    return document;
	}
	
	public List<Document> showByCaseno(String caseno){
		List<Document> document=new ArrayList<Document>();
	    documentRepository.findByCaseno(caseno).forEach(document :: add);
	    return document;
	}


}
