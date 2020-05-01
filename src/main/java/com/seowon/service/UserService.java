package com.seowon.service;

import com.seowon.domain.UserVO;
import com.seowon.dto.LoginDTO;

public interface UserService {

	public UserVO login(LoginDTO dto) throws Exception;
	
}
