package calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class calendarTempController {
	@RequestMapping("temp.calendar")
	public String doAction() {
		
		return "temp_calendar";
	}
}
