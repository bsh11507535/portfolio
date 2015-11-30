package com.moviews.main.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.moviews.main.dao.RegisterDaoService;

@Service
public class RegisterImpl implements RegisterService {

	@Inject
	RegisterDaoService reDao;


	@Override
	public void emailCheck(int userNo) {
		System.out.println("되냐??"+userNo);	
		reDao.emailCheck(userNo);
	}


}
