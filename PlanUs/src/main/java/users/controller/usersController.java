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
		System.out.println(user.getU_ID()+user.getU_PWD()+user.getB_NAME() +"�ι���");
		try {
		    uDao.signUp(user);
		    System.out.println("DB ���� �Ϸ�");
		} catch (Exception e) {
		    e.printStackTrace(); // ���� �޽��� ���
		}
		System.out.println("������");
		mav.setViewName("login");
		
		
        return mav;
    }*/
	
	@RequestMapping(value="insertUser.users", method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("join2") usersBean user) {
	    ModelAndView mav = new ModelAndView();
	    System.out.println(user.getU_ID()+user.getU_PWD()+user.getB_NAME() +"�ι���");
	    try {
	        uDao.signUp(user);
	        System.out.println("DB ���� �Ϸ�");
	        mav.setViewName("login");
	    } catch (Exception e) {
	        e.printStackTrace(); // ���� �޽��� ���
	        System.err.println("ȸ������ �� ���� �߻�: " + e.getMessage());
	        mav.addObject("errorMessage", "ȸ������ �� ������ �߻��߽��ϴ�.");
	        mav.setViewName("joinDetail"); // ���� �߻� �� ȸ������ �������� �ٽ� �̵�
	    }
	    System.out.println("������");
	    return mav;
	}

}
