package com.seowon.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.seowon.domain.BoardVO;
import com.seowon.domain.PageMaker;
import com.seowon.domain.SearchCriteria;
import com.seowon.service.BoardService;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {

	private static final Logger logger =
			LoggerFactory.getLogger(SearchBoardController.class);
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception {
		
		logger.info(cri.toString());
		
		model.addAttribute("category", service.getCategory(cri.getCategory()));

		// Get List
		List<BoardVO> list = service.listSearchCriteria(cri);
		for(BoardVO vo : list) {
			// Edit Content
			if(vo.getContent().length() > 300) {
				String content = vo.getContent().substring(0, 299);
				content = content + "....";
				vo.setContent(content);
			}
		}
		
		//model.addAttribute("list", service.listCriteria(cri));
		//model.addAttribute("list", service.listSearchCriteria(cri));
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		//pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("register get......");
		logger.info("Get Category : " + cri.getCategory());
		
		model.addAttribute("category", cri.getCategory());
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("register post.......");
		logger.info(board.toString());
		
		String[] files = board.getFiles();
		if(files != null) {
			for(String file : files) {
				logger.info("Get Files : " + file);
			}
		}
		
		service.regist(board);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/sboard/list?category=" + board.getCategory();
	}
	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,
			@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.read(bno));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/sboard/modifyPage", method=RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("bno") int bno,
			@ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception {
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/sboard/modifyPage", method=RequestMethod.POST)
	public String modifyPagingPOST(BoardVO board, SearchCriteria cri, 
			RedirectAttributes rttr) throws Exception {
		
		service.modify(board);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/sboard/list?category=" + board.getCategory();
	}
	
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno,
			SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		
		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg","success");
		return "redirect:/sboard/list";
	}
	
	@RequestMapping(value="/getAttach/{bno}", method=RequestMethod.GET)
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno") Integer bno) throws Exception {
		return service.getAttach(bno);
	}
}