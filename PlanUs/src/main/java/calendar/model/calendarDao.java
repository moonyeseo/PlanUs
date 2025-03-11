package calendar.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class calendarDao {
	@Autowired
	  SqlSessionTemplate sqlSessionTemplate;
	
	 private String namespace = "calendar.model.Calendar";
}
