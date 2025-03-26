package calendar.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DiaryDao {
	@Autowired
	  SqlSessionTemplate sqlSessionTemplate;
	
	 private String namespace = "calendar.model.Calendar";

	public DiaryBean getTodaDiary(String c_ymd) {
		DiaryBean diary = sqlSessionTemplate.selectOne(namespace + ".getTodaDiary", c_ymd);
		
		return diary;
	} 
}
