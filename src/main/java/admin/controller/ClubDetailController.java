package admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.ClubBean;
import admin.model.ClubDao;

@Controller
public class ClubDetailController {

	@Autowired
	private ClubDao cdao;
	
	private final String command = "clubDetail.ad";
	private final String getPage = "clubDetailForm";
	private final String gotoPage = "redirect:clubList.ad";
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public ModelAndView updateForm(
			ModelAndView mav,
			@RequestParam("num") int num,
			@RequestParam("pageNumber") int pageNumber,
			HttpServletRequest request) {
				
		
		ClubBean bean = cdao.getClub(num);
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("bean", bean);
		mav.setViewName(getPage);
		
		return mav;
		
	}
	
}
