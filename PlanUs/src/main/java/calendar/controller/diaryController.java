package calendar.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import calendar.model.CalendarBean;
import calendar.model.CalendarDao;
import calendar.model.DiaryBean;
import calendar.model.DiaryDao;
import calendar.model.ScheduleBean;
import calendar.model.ScheduleDao;
import calendar.model.TodoBean;
import calendar.model.TodoDao;

@Controller
public class diaryController {
	@Autowired
	private DiaryDao diaryDao;
	
	@RequestMapping(value = "diary.calendar", method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value = "year" , required = false) int year,
			@RequestParam(value = "month" , required = false) int month,
			@RequestParam(value = "day" , required = false) int day,
			HttpServletRequest request,
			Model model
			) {
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		
		 String c_ymd = null;
		 
		 String y = String.valueOf(year);
		 String m = String.valueOf(month);
		 String d = String.valueOf(day);
		 
		 if(month < 10) {
			 m = "-0" + m;
		 }
		 else {
			 m = "-" + m;
		 }
		 
		 if(day < 10) {
			 d = "-0" + d;
		 }
		 else {
			 d = "-" + d;
		 }
		 
		 c_ymd = y + m + d;
		DiaryBean diary = null;
		diary = diaryDao.getTodaDiary(c_ymd);
		model.addAttribute("diary", diary);
		
		return "diary";
	}
}
