package com.seowon.test;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.seowon.service.BoardService;
import com.seowon.domain.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class BoardServiceTest {
	
	private static final Logger logger =
			LoggerFactory.getLogger(BoardServiceTest.class);
	
	@Inject
	private BoardService service;
	
	@Test
	public void registerTest() throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("New Article for ServiceTest");
		board.setContent("New Article for ServiceTest");
		board.setWriter("user04");
		service.regist(board);
	}
	
	@Test
	public void readTest() throws Exception {
		logger.info(service.read(5).toString());
	}
	
	@Test
	public void modifyTest() throws Exception {
		BoardVO board = new BoardVO();
		board.setBno(5);
		board.setTitle("Updated Article for Service");
		board.setContent("Updated Article for Service");
		service.modify(board);
	}
	
	@Test
	public void removeTest() throws Exception {
		service.read(5);
	}
}
