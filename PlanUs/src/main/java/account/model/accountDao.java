package account.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class accountDao {

	@Autowired
	  SqlSessionTemplate sqlSessionTemplate;
	
	 private String namespace = "account.model.Account";
}
