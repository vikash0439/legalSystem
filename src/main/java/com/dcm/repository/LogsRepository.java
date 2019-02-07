package com.dcm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dcm.modal.Logs;

public interface LogsRepository extends JpaRepository<Logs, Integer>{

	List<Logs> findByCaseno(String caseno);

}
