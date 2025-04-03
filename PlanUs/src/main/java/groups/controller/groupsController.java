package groups.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import groups.model.groupsDao;

@Controller
public class groupsController {

	private final String Command1 = "/go.groups";					//to clubIntroduce.jsp
	private final String scheduleCommand = "/schedule.groups";		//to clubSchedule.jsp
	private final String boardCommand = "/board.groups";			//to clubBoard.jsp
	private final String voteCommand = "/vote.groups";				//to clubVote.jsp
	private final String dutchPayCommand = "/dutchPay.groups";		//to clubDutch_Pay.jsp
	private final String managementCommand = "/management.groups";	//to clubManagement.jsp
	
//	final String gotoPage = "redirect:/home.student";  // 홈 페이지로 리디렉션
//	final String checkOutPage = "redirect:/login.in";  // 로그인 페이지로 리디렉션
//	final String failPage = "/home.student";  // 실패 시 홈 페이지

	@Autowired
	groupsDao gDao;
	
	@RequestMapping(value = Command1, method = RequestMethod.GET)
	public String doAction() {
		return "clubIntroduce";
	}
	@RequestMapping(value = scheduleCommand, method = RequestMethod.GET)
	public String schedule() {
		return "clubSchedule";
	}
	@RequestMapping(value = boardCommand, method = RequestMethod.GET)
	public String board() {
		return "clubBoard";
	}
	@RequestMapping(value = voteCommand, method = RequestMethod.GET)
	public String vote() {
		return "clubVote";
	}
	@RequestMapping(value = dutchPayCommand, method = RequestMethod.GET)
	public String dutchPay() {
		return "clubDutch_Pay";
	}
	@RequestMapping(value = managementCommand, method = RequestMethod.GET)
	public String management() {
		return "clubManagement";
	}
	
	@RequestMapping(value = Command1, method = RequestMethod.POST)
	public ModelAndView start(
			@RequestParam(value = "U_CD", required = false) String U_CD,
			@RequestParam(value = "U_ID", required = false) String U_ID,
			@RequestParam(value = "U_NAME", required = false) String U_NAME,
			@RequestParam(value = "U_PHONE", required = false) String U_PHONE,
			@RequestParam(value = "U_ACN", required = false) String U_ACN,
			@RequestParam(value = "B_NAME", required = false) String B_NAME,
			@RequestParam(value = "U_BIRTH", required = false) String U_BIRTH,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws IOException, ParseException {

		System.out.println("DB(USERS) U_CD : " + U_CD);
		System.out.println("DB(USERS) U_ID : " + U_ID);
		System.out.println("DB(USERS) U_NAME : " + U_NAME);
		System.out.println("DB(USERS) U_PHONE : " + U_PHONE);
		System.out.println("DB(USERS) U_ACN : " + U_ACN);
		System.out.println("DB(USERS) B_NAME : " + B_NAME);
		System.out.println("DB(USERS) U_BIRTH : " + U_BIRTH);

		ModelAndView mav = new ModelAndView();

		PrintWriter out = response.getWriter();

		mav.setViewName("clubIntroduce");
		return mav;
	}

}
