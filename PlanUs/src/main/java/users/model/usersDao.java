package users.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class usersDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "users.model.users";
	
	public void signUp(usersBean user) {
		System.out.println("DAO");
		sqlSessionTemplate.insert("users.model.users.signUp",user );
	}
	
}
