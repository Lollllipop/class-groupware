package com.ja.classgroupware.classlist.controller;

import java.util.*;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ja.classgroupware.base.vo.ClassVO;
import com.ja.classgroupware.base.vo.DataManagerVO;
import com.ja.classgroupware.classlist.domain.BoardVO;
import com.ja.classgroupware.classlist.service.BoardService;


@Controller
@RequestMapping(value = "entity/class/*")
public class ClassController {
	private static final Logger logger = LoggerFactory.getLogger(ClassController.class);

	@Inject/*(name ="classService")*/
	private BoardService service;

	

	/**
	 * @throws Exception
	 */
/*@RequestMapping(value = "/classlist", method = RequestMethod.GET)
public void classlistGET() throws Exception {
	// throw new Exception();
	
	// 임시 코드...
		AlertVO alertVO = new AlertVO(2,2,2,"2",2,"2");
	boardMapper.insert(alertVO);
	//
	
}*/

@RequestMapping(value = "/class_list", method=RequestMethod.GET)
public void classlist(@ModelAttribute DataManagerVO dm, Model model) throws Exception {
	logger.info("class List Start ........");

	List<ClassVO> list = service.selectAll();

	System.out.println("클래스 리스트 스타트");

	model.addAttribute("list", list);
	model.addAttribute("aaa", dm.getUser_idx());
	
	
	
	/*return "/entity/class/class_list";*/
}

@RequestMapping(value = "/class_create", method = RequestMethod.GET)
public void CreateGET() throws Exception {
	// throw new Exception();
	logger.info("class create Start ......");


}




@RequestMapping(value = "/class_create", method = RequestMethod.POST)
public String CreatePOST(@ModelAttribute ClassVO board, RedirectAttributes rttr) throws Exception {
	// throw new Exception();
	logger.info("class create Start ......");
	logger.info(board.toString());	
	System.out.println("클래스 크리에이트 스타트");
	
	service.insert(board);
	
	System.out.println("인서트 성공");
	
	
	rttr.addFlashAttribute("msg", "SUCCESS");

	//	
	return "redirect:/entity/class/class_list";
}

@RequestMapping(value = "/class_read", method = RequestMethod.GET)
public void read(@RequestParam("class_idx") Integer class_idx, Model model) throws Exception {
	logger.info("read GET...");
	
	ClassVO classVO = service.read(class_idx); 
	model.addAttribute("classVO", classVO);
}

@RequestMapping(value = "/delete", method = RequestMethod.GET)
public String delete(@RequestParam("class_idx") int class_idx, RedirectAttributes rttr) throws Exception {
  logger.info("delete");
  System.out.println("class_idx  : " + class_idx);
  service.delete(class_idx);
  rttr.addFlashAttribute("msg", "SUCCESS");
  return "redirect:/entity/class/class_list";
}

@RequestMapping(value = "/class_update", method = RequestMethod.GET)
public void updateGET(int class_idx, Model model) throws Exception {
  model.addAttribute(service.read(class_idx));
  System.out.println("노답이네 진짜");
}
 

@RequestMapping(value = "/class_update", method = RequestMethod.POST)
public String updatePOST(ClassVO board, RedirectAttributes rttr) throws Exception {
	System.out.println("예스답");
  logger.info("mod post............");


  service.update(board);
  rttr.addFlashAttribute("msg", "SUCCESS");

  return "redirect:/entity/class/class_list";
}

}