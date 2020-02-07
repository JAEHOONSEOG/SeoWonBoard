package com.seowon.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SampleController2 {

	private static final Logger logger =
			LoggerFactory.getLogger(SampleController2.class);
	
	@RequestMapping(value="/doC", method=RequestMethod.GET)
	public String doC(@ModelAttribute("msg") String msg) {
        logger.info("doc called......");		
		return "result";
	}
}
