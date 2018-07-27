package com.dcm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dcm.modal.Pay;
import com.dcm.repository.PayRepository;

@Service
@Transactional
public class PayService {
	
	 private final PayRepository payRepository;
		
		public PayService(PayRepository payRepository) {
			this.payRepository = payRepository;
		}
		
		
		public List<Pay> getPay(int paymentid) {
			List<Pay> pay=new ArrayList<Pay>();
			payRepository.findByPaymentid(paymentid).forEach(pay :: add);
			return pay;
		}

}
