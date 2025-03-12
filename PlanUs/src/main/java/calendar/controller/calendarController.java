package calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class calendarController {
	@RequestMapping("go.calendar")
	public String doAction() {
		
		return "calendar";
	}
}
