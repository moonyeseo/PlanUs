package calendar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import calendar.model.CalendarDao;

@Controller
public class CalendarController {
	@Autowired
	private CalendarDao calendarDao;
	
	@RequestMapping(value = "go.calendar", method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value = "year" , required = false) int year,
			@RequestParam(value = "month" , required = false) int month,
			@RequestParam(value = "day" , required = false) int day,
			HttpServletRequest request
			) {
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		
		return "calendar";
	}
}
