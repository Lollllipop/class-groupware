package com.ja.classgroupware.alert.controller;

import javax.inject.Inject;

import org.apache.log4j.spi.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ja.classgroupware.homeworkboard.domain.SearchCriteria;
import com.ja.classgroupware.base.vo.Hw_boardVO;
import com.ja.classgroupware.homeworkboard.domain.PageMaker;
import com.ja.classgroupware.homeworkboard.service.Hw_boardService;

import ch.qos.logback.classic.Logger;

@Controller
@RequestMapping("/Hwboard/*")
public class HwBoardController {

	// private static final Logger logger =
	// LoggerFactory.getLogger(HwBoardController.class);
	@Inject
	private Hw_boardService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		// Logger.info(cri.toString());

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(service.countPaging(cri));

		model.addAttribute("PageMaker", pageMaker);

	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("hw_idx") int hw_idx, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {

		model.addAttribute(service.read(hw_idx));
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("hw_idx") int hw_idx, SearchCriteria cri, RedirectAttributes rttr)
			throws Exception {

		service.delete(hw_idx);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/Hwboard/list";
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modiPagingPOST(Hw_boardVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {

		service.update(vo);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/HwBoard/list";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registGET() throws Exception {

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registPOST(Hw_boardVO vo, RedirectAttributes rttr) throws Exception {

		service.regist(vo);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/Hwboard/list";
	}
}
