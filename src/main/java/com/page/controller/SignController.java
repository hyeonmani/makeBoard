package com.page.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.page.domain.MemberVO;
import com.page.service.SignDAO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = {"/page/*", "/board/*"})
@AllArgsConstructor
public class SignController {

	private SignDAO service;
	
	@GetMapping("/join")
	public String join() {
		log.info("joinPage");
		return "sign/join";
	}
	
	@PostMapping("/join")
	public String joinMember(MemberVO vo, RedirectAttributes rt) {
		log.info("join : " + vo);
		if(service.checkMember(vo) == 0) {
			service.createMember(vo);
			return "/login";
		} else {
			rt.addFlashAttribute("msg", false);
			return "redirect:/page/join";
		}
	}
	
	@GetMapping("/login")
	public String login() {
		log.info("LoginPage");
		return "/login";
	}
	
	@PostMapping("/login")
	public String loginMember(MemberVO member, HttpServletRequest req, RedirectAttributes rt) {
		HttpSession session = req.getSession();
		MemberVO vo = service.loginMember(member);
		
		if(vo == null) {
			session.setAttribute("member", null);
			rt.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", vo);
		}
		
		return "redirect:/page/login";
	}
	
//	@GetMapping("/successLogin")
//	public String success() {
//		return "/sign/successLogin";
//	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/board/list";
	}
}
