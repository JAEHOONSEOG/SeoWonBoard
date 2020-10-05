package com.seowon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/calendar")
public class CalendarController {
	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public void calendar(Model model) throws Exception{
		
	}
}
