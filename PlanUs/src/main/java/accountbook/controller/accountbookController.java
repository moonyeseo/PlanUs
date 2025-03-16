package accountbook.controller;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import account.model.accountBean;
import account.model.accountDao;

@Controller
public class accountbookController {
	
	@Autowired
	accountDao accountDao;
	
	@RequestMapping(value="go.accountbook", method=RequestMethod.GET)
	public ModelAndView doAction() {
		
		ModelAndView mav = new ModelAndView();
		
		List<accountBean> a_list = accountDao.getAccountList();
		
		mav.addObject("accountList", a_list);

		 System.out.println(a_list.get(0).getA_name());
		 System.out.println(a_list.get(0).getA_state());
		 
		mav.setViewName("accountBookMain");
		
		return mav;
	}
	

	
	@RequestMapping(value="insertaccount.accountbook", method=RequestMethod.POST)
	public ModelAndView doAction(@ModelAttribute("account") @Valid accountBean account, BindingResult result) {
		
		ModelAndView mav = new ModelAndView();
		

		 System.out.println("strat---------");
		 System.out.println(account.getA_name());
		 System.out.println(account.getA_cd());
		 System.out.println(account.getU_cd());
		 System.out.println(account.getA_state());
		 System.out.println(account.getA_asset());
		 System.out.println(account.getA_repaymentdate());
		 System.out.println("end-----------");
		
		if(result.hasErrors()) {
			System.out.println("ERROR!!!!!!!!");
			for (ObjectError error : result.getAllErrors()) {
			    System.out.println(error.getDefaultMessage());
			}
			mav.setViewName("accountBookMain");
		} else {
			accountDao.insertAccount(account);
			mav.setViewName("redirect:go.accountbook");
		}
		
		return mav;
	}

}
