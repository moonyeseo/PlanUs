package calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import calendar.model.DiaryDao;

@Controller
public class DiaryWriteController {
	@Autowired
	private DiaryDao diaryDao;
	
	@RequestMapping(value = "writeDiaryForm.calendar", method = RequestMethod.GET)
	public String doAction() {
		
		return "writeDiary";
	}
}
