package com.baway.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.baway.pojo.Email;
import com.baway.pojo.Msg;
import com.baway.service.EmService;

@Controller
@RequestMapping("em")
public class EmailController {
	@Autowired
	private EmService es;
	
	@RequestMapping("selectAll")
	@ResponseBody
	public Msg selectAll(@RequestParam(value="pageno",defaultValue="1")Integer pageno,@RequestParam(value="pagesize",defaultValue="3")Integer pagesize){
		PageHelper.startPage(pageno, pagesize);
		List<Email> selectAll = es.selectAll();
		PageInfo<Email> pageInfo = new PageInfo<>(selectAll);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("selectAllup")
	public ModelAndView selectAllup(ModelAndView mav){
		List<Email> selectAllup = es.selectAllup();
		mav.addObject("selectAll", selectAllup);
		mav.setViewName("forward:/index.jsp");
		return mav;
	}
	
	@RequestMapping("selectAlldown")
	public ModelAndView selectAlldown(ModelAndView mav){
		List<Email> selectAlldown = es.selectAlldown();
		mav.addObject("selectAll", selectAlldown);
		mav.setViewName("forward:/index.jsp");
		return mav;
	}
	
	@RequestMapping("selectwd")
	public ModelAndView selectwd(ModelAndView mav){
		List<Email> selectwd = es.selectwd();
		mav.addObject("selectAll", selectwd);
		mav.setViewName("forward:/index.jsp");
		return mav;
	}
	
	@RequestMapping("selectyd")
	public ModelAndView selectyd(ModelAndView mav){
		List<Email> selectyd = es.selectyd();
		mav.addObject("selectAll", selectyd);
		mav.setViewName("forward:/index.jsp");
		return mav;
	}
	
	@RequestMapping("delSome")
	@ResponseBody
	public String delSome(String eids){
		System.out.println("delSome进来了");
		try {
			es.delSome(eids);
			return "ok";
		} catch (Exception e) {
			return "error";
		}
	}
	
	@RequestMapping("updStatus")
	@ResponseBody
	public String updStatus(Integer id){
		System.out.println("updStatus进来了");
		try {
			es.updStatus(id);
			return "ok";
		} catch (Exception e) {
			return "error";
		}
	}
}
