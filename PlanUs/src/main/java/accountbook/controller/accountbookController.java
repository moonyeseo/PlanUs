package accountbook.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class accountbookController {
	
	@RequestMapping("go.accountbook")
	public String doAction() {
		
		return "accountBookMain";
	}

}
