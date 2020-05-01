package com.seowon.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seowon.domain.UserVO;
import com.seowon.dto.LoginDTO;
import com.seowon.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO dao;
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		
		return dao.login(dto);
	}

}
