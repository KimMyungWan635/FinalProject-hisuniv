package com.exam.mvc01;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import model.BoardTO;
import model.LcategoryTO;
import model.ScategoryTO;
import model.SearchTO;

@Controller
public class SearchController {
	
	@Autowired
	private Mapper mapper;
	
	@RequestMapping("search.do")
	public String search(HttpServletRequest request, Model model) {	
		
		String sContent = "%"+request.getParameter("s_content")+"%";
		
		ArrayList<SearchTO> searchList = new ArrayList<SearchTO>();
		searchList = mapper.search(sContent);
		
		model.addAttribute("searchList", searchList);
		
		return "search";
	}
	
}
