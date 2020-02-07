package com.seowon.test;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.seowon.persistence.BoardDAO;
import com.seowon.domain.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class BoardDAOTest {

	private static final Logger logger = 
			LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Inject
	private BoardDAO dao;
	
	@Test
	public void testCreate() throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("New Article");
		board.setContent("New Article");
		board.setWriter("user02");
		dao.create(board);
	}
	
	@Test
	public void testRead() throws Exception {
		logger.info(dao.read(2).toString());
	}
	
	@Test
	public void testUpdate() throws Exception {
		BoardVO board = new BoardVO();
		board.setBno(2);
		board.setTitle("Updated Article");
		board.setContent("Updated Article");
		dao.update(board);
	}
	
	@Test 
	public void testDelete() throws Exception { 
		dao.delete(2); 
	}
}
