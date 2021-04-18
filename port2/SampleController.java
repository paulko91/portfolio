package org.zerock.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/sample/*")

public class SampleController {

	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@RequestMapping(value = "/guguprj", method = RequestMethod.GET)
	public String guguprj(Model model) {

		logger.info("guguprj----------------------");

		String danTemp="";
		
		int sum=0;
		
		for(int i=2; i<10; i++) {
			for(int j=1; j<10; j++) {
				danTemp = danTemp + i + "*" + j + "=" + i * j + "<br/>";
				
				sum = sum + i*j;
			}
				model.addAttribute("dan"+i, danTemp);
				model.addAttribute("dansum"+i, sum);
				
				danTemp = "";
				sum = 0;
		}
		
		
		return "guguprj";
	}
	

	
}
