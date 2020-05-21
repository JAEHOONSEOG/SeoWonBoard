package com.seowon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.seowon.domain.BoardVO;
import com.seowon.domain.Criteria;
import com.seowon.domain.SearchCriteria;
import com.seowon.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Transactional
	@Override
	public void regist(BoardVO board) throws Exception {
		dao.create(board);
		
		String[] files = board.getFiles();
		
		if(files == null)
			return;
		for(String fullName : files)
			dao.addAttach(fullName);
	}

	@Override
	public BoardVO read(Integer bno) throws Exception {
		return dao.read(bno);
	}

	@Transactional
	@Override
	public void modify(BoardVO board) throws Exception {
		dao.update(board);
		
		Integer bno = board.getBno();
		
		dao.delete(bno);
		
		String[] files = board.getFiles();
		
		if(files == null)
			return;
		
		for(String fileName : files)
			dao.replaceAttach(fileName, bno);
	}

	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {
		dao.deleteAttach(bno);
		dao.delete(bno);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return dao.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		return dao.getAttach(bno);
	}

	@Override
	public String getCategory(String category) throws Exception {
		return dao.getCategory(category);
	}
}
