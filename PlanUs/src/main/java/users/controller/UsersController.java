package users.controller;

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

import groups.model.GroupsDao;
import users.model.UsersDao;

@Controller
public class UsersController {

	private final String Command = "/1.users";
	
	final String getPage = "usersHome";  // UsersPage.

	@Autowired
	UsersDao uDao;

	@RequestMapping(value = Command, method = RequestMethod.POST)
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

		mav.setViewName(getPage);
		return mav;
	}

}
