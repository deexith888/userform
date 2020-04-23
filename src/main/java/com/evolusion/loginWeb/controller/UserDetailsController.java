package com.evolusion.loginWeb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.evolusion.loginWeb.bean.UserDetails;

@Controller
@RequestMapping(value = "/")
public class UserDetailsController {
	@RequestMapping(value = "/user-details")
	public String  userDetails(@ModelAttribute("UserDetails") UserDetails formUser) {
		//ModelAndView mav = new ModelAndView("userdetails");
	    return "userdetails";
	}
	
	@RequestMapping(value = "/submitDetails")
	public String  submitDetails(@ModelAttribute("UserDetails") UserDetails formUser,Model model) {
		model.addAttribute("UserDetails", formUser);
	    return "success";
	}
	
}
