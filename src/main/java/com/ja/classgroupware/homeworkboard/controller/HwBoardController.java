package com.ja.classgroupware.homeworkboard.controller;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ja.classgroupware.base.vo.Hw_boardVO;
import com.ja.classgroupware.homeworkboard.domain.Criteria;
import com.ja.classgroupware.homeworkboard.domain.PageMaker;
import com.ja.classgroupware.homeworkboard.domain.SearchCriteria;
import com.ja.classgroupware.homeworkboard.service.Hw_boardService;

@Controller
@RequestMapping("entity/homework_board/*")
public class HwBoardController {

	// private static final Logger logger =
	// LoggerFactory.getLogger(HwBoardController.class);
	//@Resource(name = "hw_boardSerivce")
	@Inject
	private Hw_boardService service;

	/*
	 * @RequestMapping(value = "/homework_board_list", method = RequestMethod.GET)
	 * public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model)
	 * throws Exception {
	 * 
	 * // Logger.info(cri.toString()); model.addAttribute("list",
	 * service.listSearch(cri));
	 * 
	 * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(cri);
	 * 
	 * pageMaker.setTotalCount(service.countPaging(cri));
	 * 
	 * model.addAttribute("PageMaker", pageMaker);
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/homework_board_view", method = RequestMethod.GET)
	 * public void read(@RequestParam("hw_idx") int hw_idx, @ModelAttribute("cri")
	 * SearchCriteria cri, Model model) throws Exception {
	 * 
	 * model.addAttribute(service.read(hw_idx)); }
	 * 
	 * @RequestMapping(value = "/removePage", method = RequestMethod.POST) public
	 * String remove(@RequestParam("hw_idx") int hw_idx, SearchCriteria cri,
	 * RedirectAttributes rttr) throws Exception {
	 * 
	 * service.delete(hw_idx); rttr.addAttribute("page", cri.getPage());
	 * rttr.addAttribute("perPageNum", cri.getPerPageNum());
	 * rttr.addAttribute("searchType", cri.getSearchType());
	 * rttr.addAttribute("keyword", cri.getKeyword());
	 * 
	 * rttr.addFlashAttribute("msg", "SUCCESS");
	 * 
	 * return "redirect:/entity/homework_board/list"; }
	 * 
	 * @RequestMapping(value = "/modifyPage", method = RequestMethod.POST) public
	 * String modiPagingPOST(Hw_boardVO vo, SearchCriteria cri, RedirectAttributes
	 * rttr) throws Exception {
	 * 
	 * service.update(vo);
	 * 
	 * rttr.addAttribute("page", cri.getPage()); rttr.addAttribute("perPageNum",
	 * cri.getPerPageNum()); rttr.addAttribute("searchType", cri.getSearchType());
	 * rttr.addAttribute("keyword", cri.getKeyword());
	 * 
	 * // rttr.addFlashAttribute("msg", "SUCCESS");
	 * 
	 * return "redirect:/entity/homework_board/homework_board_list"; }
	 * 
	 * @RequestMapping(value = "/homework_board_write", method = RequestMethod.GET)
	 * public void registGET() throws Exception {
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/homework_board_write", method = RequestMethod.POST)
	 * public String registPOST(Hw_boardVO vo, RedirectAttributes rttr) throws
	 * Exception {
	 * 
	 * service.regist(vo);
	 * 
	 * // rttr.addFlashAttribute("msg", "SUCCESS");
	 * 
	 * return "redirect:/homework_board_list"; }
	 */
	////// 페이징
	@RequestMapping(value = "/homework_board_list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		
		//model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("totalCount", service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/homework_board_view", method = RequestMethod.GET)
	public void read(@RequestParam("hw_idx") int hw_idx, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {
		model.addAttribute(service.selectByIdx(hw_idx));
	}

	@RequestMapping(value = "/removePage", method = RequestMethod.POST)
	public String remove(@RequestParam("hw_idx") int hw_idx, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		service.delete(hw_idx);
		rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
	    
		return "redirect:/entity/homework_board/homework_board_list";
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("hw_idx") int hw_idx, @ModelAttribute("cri") Criteria cri, Model model)
			throws Exception {
		model.addAttribute(service.selectByIdx(hw_idx));
	}

	@RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
	public String modifyPagingPOST(Hw_boardVO vo, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		// logger.info(cri.toString());
		service.update(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		//rttr.addFlashAttribute("msg", "SUCCESS");
		// logger.info(rttr.toString());
		return "redirect:/entity/homework_board/homework_board_list";
	}

	@RequestMapping(value = "/homework_board_write", method = RequestMethod.GET)
	public void registGET() throws Exception {
		//logger.info("regist get ...........");
	}

	@RequestMapping(value = "/homework_board_write", method = RequestMethod.POST)
	public String registPOST(@ModelAttribute Hw_boardVO vo, RedirectAttributes rttr) throws Exception {
		//logger.info("regist post ...........");
		//logger.info(board.toString());
		service.insert(vo);
		//rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/entity/homework_board/homework_board_list";
	}
}
