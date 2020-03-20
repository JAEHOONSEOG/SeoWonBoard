package com.seowon.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seowon.domain.MessageVO;
import com.seowon.persistence.MessageDAO;
import com.seowon.persistence.PointDAO;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO messageDao;

	@Inject
	private PointDAO pointDao;
	
	@Override
	public void addMessage(MessageVO vo) throws Exception {
		messageDao.create(vo);
		pointDao.updatePoint(vo.getSender(), 10);
	}

	@Override
	public MessageVO readMessage(String uid, Integer mid) throws Exception {
		messageDao.updateState(mid);
		pointDao.updatePoint(uid, 5);
		return messageDao.readMessage(mid);
	}

}
