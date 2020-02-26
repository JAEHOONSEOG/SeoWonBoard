package com.seowon.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.seowon.domain.ReplyVO;
import com.seowon.domain.SearchCriteria;
import com.seowon.persistence.ReplyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class ReplyDAOTest {

	private static final Logger logger = 
			LoggerFactory.getLogger(ReplyDAOTest.class);
	
	@Inject
	private ReplyDAO dao;
	
//	@Test
//	public void testCreate() throws Exception{
//		ReplyVO vo = new ReplyVO();
//		vo.setBno(10);
//		vo.setRno(1);
//		vo.setReplyText("testComment");
//		vo.setReplyer("Replyer001");
//		dao.create(vo);
//	}
	
//	@Test
//	public void testUpdate() throws Exception {
//		ReplyVO vo = new ReplyVO();
//		vo.setRno(1);
//		vo.setReplyText("testUpdatedComment");
//		dao.update(vo);
//	}
	
	@Test
	public void testDelete() throws Exception {
		dao.delete(1);
	}
}
