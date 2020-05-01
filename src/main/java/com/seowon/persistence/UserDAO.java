package com.seowon.persistence;

import com.seowon.domain.UserVO;
import com.seowon.dto.LoginDTO;

public interface UserDAO {
	
	public UserVO login(LoginDTO dto) throws Exception;

}
