package com.seowon.persistence;

import java.util.Date;

import com.seowon.domain.UserVO;
import com.seowon.dto.LoginDTO;

public interface UserDAO {
	
	public UserVO login(LoginDTO dto) throws Exception;
	
	public void keepLogin(String uid, String sessionId, Date next) throws Exception;
	
	public UserVO checkUserWithSessionKey(String value) throws Exception;

}
