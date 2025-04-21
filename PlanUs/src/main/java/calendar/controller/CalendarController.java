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

import calendar.model.CalendarBean;
import calendar.model.CalendarDao;
import calendar.model.DiaryBean;
import calendar.model.DiaryDao;
import calendar.model.ScheduleBean;
import calendar.model.ScheduleDao;
import calendar.model.TodoBean;
import calendar.model.TodoDao;

@Controller
public class CalendarController {
	@Autowired
	private CalendarDao calendarDao;
	@Autowired
	private TodoDao todoDao;
	@Autowired
	private ScheduleDao scheduleDao;
	
	@RequestMapping(value = "go.calendar", method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value = "year" , required = false) int year,
			@RequestParam(value = "month" , required = false) int month,
			@RequestParam(value = "day" , required = false) int day,
			HttpServletRequest request,
			Model model
			) {

		// calendar 
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		
		// calendar schedule
		 String c_ym = null;
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
		 
		c_ym = y + m;
		List<CalendarBean> calendarThisMonthList = calendarDao.getThisMonthCalendar(c_ym);
		model.addAttribute("calendarList", calendarThisMonthList);
		
		// todo
		 if(day < 10) {
			 d = "-0" + d;
		 }
		 else {
			 d = "-" + d;
		 }
		 
		 c_ymd = y + m + d;
		 
		List<TodoBean> todoList = todoDao.getTodayTodo(c_ymd);
		List<TodoBean> todoList_n = new ArrayList<TodoBean>();
		List<TodoBean> todoList_y = new ArrayList<TodoBean>();
		
		for(int i = 0; i < todoList.size(); i++) {
			if(todoList.get(i).getT_ok_yn().equals("N")) {
				todoList_n.add(todoList.get(i));
			}
			else {
				todoList_y.add(todoList.get(i));
			}
		}
		
		todoList.clear();
		todoList.addAll(todoList_n);
		todoList.addAll(todoList_y);
		
		model.addAttribute("todoList", todoList);
		
		// schedule
		/*
		 * List<ScheduleBean> scheduleList = scheduleDao.getTodaySchedule(c_ymd);
		 * model.addAttribute("scheduleList", scheduleList);
		 */
		
		return "calendar";
	}
}
