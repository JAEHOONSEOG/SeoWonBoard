package com.seowon.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SampleController4 {

	private static final Logger logger = 
			LoggerFactory.getLogger(SampleController4.class);
	
	@RequestMapping(value="/doE")
	public String doE(RedirectAttributes rttr) {
		logger.info("doE called out but redirect to doF......");
		
		rttr.addFlashAttribute("msg", "This is the Message! with redirect.");
		return "redirect:/doF";
	}
	
	@RequestMapping(value="/doF")
	public void doF(String msg) {
		logger.info("doF called out with" + msg);
	}
}
