package com.seowon.service;

import java.util.Date;

import com.seowon.domain.UserVO;
import com.seowon.dto.LoginDTO;

public interface UserService {

	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String uid, String sessionId, Date next) throws Exception;
	
	public UserVO checkLoginBefore(String value) throws Exception;
}
