package com.dcm.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dcm.modal.Payment;
import com.dcm.repository.PaymentRepository;

@Service
@Transactional
public class PaymentService {
	
	 private final PaymentRepository paymentRepository;
		
		public PaymentService(PaymentRepository paymentRepository) {
			this.paymentRepository = paymentRepository;
		}
		
	

		public void UpdatePaymentById(Payment payment) {
			// TODO Auto-generated method stub
			paymentRepository.save(payment);
		}

}
