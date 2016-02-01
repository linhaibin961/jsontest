package com.jsontest.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsontest.entity.User;
import com.jsontest.service.UserService;

/**
 * 
 * @ClassName: UserController
 * @Description: User的控制器
 * @author linhaibin
 * @date 2015年8月26日 上午10:29:31
 *
 */
@Controller
@RequestMapping("/test")
public class ModelAndViewTestController {
	@Autowired
	@Qualifier("userService")
	UserService userService;

	@RequestMapping("/modelAndViewTest.do")
	public ModelAndView modelAndViewTest(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("test/modelandviewtest");
		User user = userService.getUserById(1);
		mv.addObject("testStr", user.getName());
//		req.getSession().setAttribute("testStr", user.getName());
		return mv;
	}

}