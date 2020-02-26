package com.seowon.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.seowon.domain.SampleVO;

/*
 * @RestController : return data itself like JSON, XML type
 *   without creating views such as JSP files, etc
 * */
@RestController
@RequestMapping("/sample")
public class SampleController6 {
	
	@RequestMapping(value="/hello")
	public String sayHello() {
		return "Hello World";
	}
	
	@RequestMapping(value="/sendVO")
	public SampleVO sendVO() {
		SampleVO vo = new SampleVO();
		vo.setFirstName("Daniel");
		vo.setLastName("Stone");
		vo.setMno(123);
		return vo;
	}
	
	@RequestMapping(value="/sendList")
	public List<SampleVO> sendList() {
		List<SampleVO> list = new ArrayList<SampleVO>();
		for(int i=0; i<10; i++) {
			SampleVO vo = new SampleVO();
			vo.setFirstName("Daniel");
			vo.setLastName("Stone");
			vo.setMno(i);
			list.add(vo);
		}
		return list;
	}
	
	@RequestMapping(value="/sendMap")
	public Map<Integer, SampleVO> sendMap() {
		Map<Integer, SampleVO> map = new HashMap<Integer, SampleVO>();
		for(int i=0; i<10; i++) {
			SampleVO vo = new SampleVO();
			vo.setFirstName("Daniel");
			vo.setLastName("Stone");
			vo.setMno(i);
			map.put(i, vo);
		}
		return map;
	}
	
	@RequestMapping(value="/sendErrorAuth")
	public ResponseEntity<Void> sendErrorAuth() {
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	@RequestMapping(value="/sendErrorNot")
	public ResponseEntity<List<SampleVO>> sendListNot() {
		List<SampleVO> list = new ArrayList<SampleVO>();
		for(int i=0; i<10; i++) {
			SampleVO vo = new SampleVO();
			vo.setFirstName("Daniel");
			vo.setLastName("Stone");
			vo.setMno(i);
			list.add(vo);
		}
		return new ResponseEntity<>(list, HttpStatus.NOT_FOUND);
	}
}
