package com.page.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.page.domain.BoardVO;
import com.page.domain.PageDTO;
import com.page.domain.PagingVO;
import com.page.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	@GetMapping("/list")
	public void list(PagingVO paging, Model model) {
		log.info("listPage");
		int total = service.totalCount(paging);
		model.addAttribute("list", service.getListPage(paging));
		model.addAttribute("page", new PageDTO(paging, total));
	}
	
	@GetMapping("/regist")
	public void register() {
		//regist페이지 이동
	}
	
	@PostMapping("/regist")
	public String regist(BoardVO board, RedirectAttributes rt) {
		service.regist(board);
		rt.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") int bno, Model model, @ModelAttribute("paging") PagingVO paging) {
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rt, @ModelAttribute("paging") PagingVO paging) {
		if(service.modify(board)) {
			rt.addFlashAttribute("result", "success");
		}
		rt.addAttribute("pageNum", paging.getPageNum());
		rt.addAttribute("amount", paging.getAmount());
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") int bno, RedirectAttributes rt, @ModelAttribute("paging") PagingVO paging) {
		if(service.remove(bno)) {
			rt.addFlashAttribute("result", "success");
		}
		rt.addAttribute("pageNum", paging.getPageNum());
		rt.addAttribute("amount", paging.getAmount());
		return "redirect:/board/list";
	}
}
