package calendar.controller;

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
import calendar.model.RepeatBean;
import calendar.model.RepeatDao;
import calendar.model.ScheduleBean;
import calendar.model.ScheduleDao;

@Controller
public class ScheduleController {
	@Autowired
	private CalendarDao calendarDao;
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private RepeatDao repeatDao;
	
	@RequestMapping(value = "schedule.calendar", method = RequestMethod.GET)
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

		 List<ScheduleBean> scheduleList = scheduleDao.getTodaySchedule(c_ymd);
		model.addAttribute("scheduleList", scheduleList);
		
		return "schedule";
	}
	
	@RequestMapping(value = "insertSchedule.calendar", method = RequestMethod.POST)
	@ResponseBody
	public String doAction(/* @ModelAttribute("diary") @Valid DiaryBean diary, BindingResult result, */
			@RequestParam(value = "s_name") String s_name,
			@RequestParam(value = "s_color") String s_color,
			@RequestParam(value = "g_cd", required = false) String g_cd,
			@RequestParam(value = "s_memo" , required = false) String s_memo,
			@RequestParam(value = "r_type" , required = false) String r_type,
			@RequestParam(value = "r_detail" , required = false) String r_detail,
			@RequestParam(value = "year") int year,
			@RequestParam(value = "month") int month,
			@RequestParam(value = "day") int day) {
		
		 String c_ymd = null;
		 
		 String y = String.valueOf(year);
		 String m = String.valueOf(month);
		 String d = String.valueOf(day);
		 
		 String s_cd = null;
		 String r_cd = null;
		 
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
		 
		 ScheduleBean schedule = new ScheduleBean();
		 schedule.setS_name(s_name);
		 schedule.setG_cd(g_cd);
		 schedule.setS_memo(s_memo);
		 schedule.setS_color(s_color);
		 
		 scheduleDao.insertSchedule(schedule);
		 
		 s_cd = scheduleDao.getRecentS_cd();
		 System.out.println("-------------------------recent s_cd : " + s_cd);

		 if(r_type != null) {
			 System.out.println("----------------------------------r_detail : " + r_detail);
			 
			 RepeatBean repeat = new RepeatBean();
			 repeat.setC_type("S");
			 repeat.setType_cd( s_cd);
			 repeat.setR_type(r_type);
			 repeat.setR_detail(r_detail);
			 
			 repeatDao.insertRepeat(repeat);
			 
			 r_cd = repeatDao.getRecentR_cd();
			 System.out.println("-------------------------recent r_cd : " + r_cd);
		 }
		 
		 
		 CalendarBean calendar = new CalendarBean();
		 calendar.setC_type("S");
		 calendar.setType_cd(s_cd);
		 calendar.setR_cd(r_cd);
		 calendar.setC_ymd(c_ymd);
		 
		 calendarDao.insertCalendarSchedule(calendar);
		 
		return "Y" ;
	}
}
