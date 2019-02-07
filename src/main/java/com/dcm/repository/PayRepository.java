package com.dcm.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.dcm.modal.Pay;

public interface PayRepository extends CrudRepository<Pay, Integer>{

	List<Pay> findByPaymentid(int paymentid);

}
