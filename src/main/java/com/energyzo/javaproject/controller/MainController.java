package com.energyzo.javaproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {

	@RequestMapping("/main.do")
	public String getUsers(Model model) {

		return "main/main";

	}
	
	
	
	
	
}
