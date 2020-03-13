package com.seowon.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.seowon.domain.Criteria;
import com.seowon.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.seowon.mapper.ReplyMapper";
	
	@Override
	public List<ReplyVO> list(Integer bno) throws Exception {
		return session.selectList(namespace + ".list", bno);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer bno, Integer rno) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bno", bno);
		paramMap.put("rno", rno);
		session.delete(namespace + ".delete", paramMap);
	}

	@Override
	public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		return session.selectList(namespace + ".listPage", paramMap);
	}

	@Override
	public int count(Integer bno) throws Exception {
		return session.selectOne(namespace + ".count", bno);
	}
}
