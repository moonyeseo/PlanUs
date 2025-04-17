package calendar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import calendar.model.CalendarDao;
import calendar.model.DiaryBean;
import calendar.model.DiaryDao;

@Controller
public class DiaryWriteController {
	@Autowired
	private CalendarDao calendarDao;
	@Autowired
	private DiaryDao diaryDao;
	
	@RequestMapping(value = "writeDiaryForm.calendar", method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value = "year" , required = false) int year,
			@RequestParam(value = "month" , required = false) int month,
			@RequestParam(value = "day" , required = false) int day,
			@RequestParam(value = "d_cd" ) String d_cd,
			HttpServletRequest request,
			Model model
			) {
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		
		if(!d_cd.equals("X")) {
			DiaryBean diary = diaryDao.getDiaryByDcd(d_cd);
			
			request.setAttribute("diary", diary);
		}
		
		return "writeDiary";
	}
	
	@RequestMapping(value = "insertDiary.calendar", method = RequestMethod.POST)
	@ResponseBody
	public String doAction(/* @ModelAttribute("diary") @Valid DiaryBean diary, BindingResult result, */
			@RequestParam(value = "d_title") String d_title,
			@RequestParam(value = "d_detail") String d_detail,
			@RequestParam(value = "year") int year,
			@RequestParam(value = "month") int month,
			@RequestParam(value = "day") int day) {
		
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
//		
//		if(result.hasErrors()) {
//			System.out.println("DIARY INSERT ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//		}
//		else {
//			diaryDao.insertDiary(diary);
//			
//			String d_cd = diaryDao.getRecentD_cd();
//			
//			diary.setD_cd(d_cd);
//			diary.setD_title( c_ymd); // d_title에 임시로 c_ymd 저장
//			
//			calendarDao.insertCalendarDiary(diary);
//		}
		 
		 DiaryBean diary = new DiaryBean();
		 diary.setD_title(d_title);
		 diary.setD_detail(d_detail);
		 
		diaryDao.insertDiary(diary);
			
		String d_cd = diaryDao.getRecentD_cd();
		
		diary.setD_cd(d_cd);
		diary.setD_title( c_ymd); // d_title에 임시로 c_ymd 저장
		
		calendarDao.insertCalendarDiary(diary);
		
		return "Y" ;
	}
	
	@RequestMapping(value = "modifyDiary.calendar", method = RequestMethod.POST)
	@ResponseBody
	public String doAction(
			@RequestParam(value = "d_cd") String d_cd,
			@RequestParam(value = "d_title") String d_title,
			@RequestParam(value = "d_detail") String d_detail) {
	 
		 DiaryBean diary = new DiaryBean();
		 diary.setD_cd(d_cd);
		 diary.setD_title(d_title);
		 diary.setD_detail(d_detail);
		 
		diaryDao.modifyDiary(diary);
		
		return "Y" ;
	}
	

	
	@RequestMapping(value = "deleteDiary.calendar", method = RequestMethod.POST)
	@ResponseBody
	public String doAction(@RequestParam(value = "d_cd") String d_cd) {
		 
		diaryDao.deleteDiary(d_cd);
		calendarDao.deleteCalendarDiary(d_cd);
		
		return "Y" ;
	}
}
