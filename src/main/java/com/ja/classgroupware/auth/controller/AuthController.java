package com.ja.classgroupware.auth.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;
import com.ja.classgroupware.base.vo.UsersVO;
import com.ja.classgroupware.auth.domain.LoginDTO;
import com.ja.classgroupware.auth.service.UserService;

@Controller
@RequestMapping("/entity/auth")
public class AuthController {

	@Inject
	private UserService service;

	// 로그인 창
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
	}
	
	// 아이디 , 비밀번호 찾기
	
	
	@RequestMapping(value = "/checkidpopup", method = RequestMethod.GET)
	public void checkidpopup(UsersVO vo, Model model) throws Exception {
		
	}
	
	@RequestMapping(value = "/checkidpopup", method = RequestMethod.POST)
	public void checkedidpopup(UsersVO vo, Model model, String user_email) throws Exception 	{
		System.out.println("111");
		System.out.println("checkidpopup" + user_email);
		model.addAttribute("user_id",service.selectByEmail(user_email));
		
	}
	
	@RequestMapping(value = "/completeidpopup", method = RequestMethod.GET)
	public void completeidpopup(String user_email, Model model) throws Exception {
		
	}
	
	@RequestMapping(value = "/completeidpopup", method = RequestMethod.POST)
	public void completedidpopup(@ModelAttribute("user") String user_email,Model model) throws Exception {
		System.out.println("user email : " + user_email);
		model.addAttribute("user", service.selectByEmail(user_email));
	}
	

	@RequestMapping(value = "/checkpwpopup", method = RequestMethod.GET)
	public void checkpwpopup(UsersVO vo, Model model) throws Exception {

	}
	
	
	@RequestMapping(value = "/checkpwpopup", method = RequestMethod.POST)
	public String checkedpwpopup(UsersVO vo, Model model) throws Exception {
		return "/entity/auth/completepwpopup";
	}

	

	@RequestMapping(value = "/completepwpopup", method = RequestMethod.GET)
	public void completepwpopup(UsersVO vo, Model model) throws Exception {

	}
	
	@RequestMapping(value = "/completepwpopup", method = RequestMethod.POST)
	public void completedpwpopup(@ModelAttribute String user_email) throws Exception {
		service.selectByEmail(user_email);
	}



	// 회원가입
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public void signUp() {
		
	}
	

	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String create(@ModelAttribute UsersVO vo) throws Exception {
		service.insert(vo);
		return "/entity/auth/signUpcomplete";
	}
	
	//회원가입 환영
	@RequestMapping(value = "/signUpcomplete", method = RequestMethod.GET)
	public void Welcome(UsersVO vo, Model model) throws Exception {
		
	}
	
	@RequestMapping(value = "/signUpcomplete", method = RequestMethod.POST)
	public String Welcom(UsersVO vo, Model model) throws Exception {
		return "/entity/auth/signUpcomplete";

	}
	
	// 로그아웃 하는 부분
    @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 전체를 날려버림
//      session.removeAttribute("login"); // 하나씩 하려면 이렇게 해도 됨.
        return "redirect:/entity/auth/login"; // 로그아웃 후 게시글 목록으로 이동하도록...함
    }

	//로그인 세션 
	/*@RequestMapping(value = "/loginPost", method = RequestMethod.GET)
	public void loginPOSTs(LoginDTO dto, HttpSession session, Model model) throws Exception {
	}
	*/
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

		UsersVO vo = service.login(dto);
		
		if (vo == null) {
			return;
		}
		System.out.println("id : " + vo.getUser_id());
		System.out.println("pw : " + vo.getUser_password());

		model.addAttribute("usersVO", vo);

		if (dto.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			service.keepLogin(vo.getUser_id(), session.getId(), sessionLimit);
			System.out.println("test");
		}
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {
			UsersVO vo = (UsersVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getUser_id(), session.getId(), new Date());
			}
		}

		return "entity/auth/logout";
	}
}