package account.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myaccountDao")
public class accountDao {

	@Autowired
	  SqlSessionTemplate sqlSession;
	
	 private String namespace = "account.model.accountBean";
	 
	 //select
	 public List<accountBean> getAccountList() {
		
		 List<accountBean> a_list = new ArrayList<accountBean>();
		 
		 a_list = sqlSession.selectList("account.accountBean.getAccountList");
		 
		 return a_list;
		 
	 }
	 
	 //insert
	 public void insertAccount(accountBean account) {
		
		 int cnt = -1;
		 
		 cnt = sqlSession.insert("account.accountBean.insertAccount", account);
		 
		 System.out.println("insert cnt : " + cnt);
	 
	 }
}
