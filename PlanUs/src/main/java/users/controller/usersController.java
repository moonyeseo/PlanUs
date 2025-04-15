package users.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import users.model.usersBean;
import users.model.usersDao;


import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.validation.Valid;
@Controller
public class usersController {


	@Autowired
	usersDao uDao;
	
	@RequestMapping("login.users")
    public String login(Model model){
        
        return "login";
    }
	@RequestMapping("join.users")
    public String join(Model model){
        
        return "join";
    }
	@RequestMapping(value="joinDetail.users", method=RequestMethod.POST)
	public ModelAndView doAction(String u_ID, String u_PWD) {
		ModelAndView mav = new ModelAndView();
		//System.out.println(user.getU_ID()+user.getU_PWD());
		//mav.addObject("u_ID",user.getU_ID());
		//mav.addObject("u_PWD",user.getU_PWD());
		System.out.println(u_ID+" "+u_PWD);
		mav.addObject("u_ID",u_ID);
		mav.addObject("u_PWD",u_PWD);
		mav.setViewName("joinDetail");
		
		
        return mav;
    }
	/*@RequestMapping(value="insertUser.users", method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("join2") usersBean user) {
		ModelAndView mav = new ModelAndView();
		System.out.println(user.getU_ID()+user.getU_PWD()+user.getB_NAME() +"두번쨰");
		try {
		    uDao.signUp(user);
		    System.out.println("DB 저장 완료");
		} catch (Exception e) {
		    e.printStackTrace(); // 오류 메시지 출력
		}
		System.out.println("세번쨰");
		mav.setViewName("login");
		
		
        return mav;
    }*/
	
	@RequestMapping(value="insertUser.users", method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("join2") usersBean user) {
	    ModelAndView mav = new ModelAndView();
	    System.out.println(user.getU_ID()+user.getU_PWD()+user.getB_NAME() +"두번쨰");
	    try {
	        uDao.signUp(user);
	        System.out.println("DB 저장 완료");
	        mav.setViewName("login");
	    } catch (Exception e) {
	        e.printStackTrace(); // 오류 메시지 출력
	        System.err.println("회원가입 중 오류 발생: " + e.getMessage());
	        mav.addObject("errorMessage", "회원가입 중 오류가 발생했습니다.");
	        mav.setViewName("joinDetail"); // 오류 발생 시 회원가입 페이지로 다시 이동
	    }
	    System.out.println("세번쨰");
	    return mav;
	}

}
