package calendar.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

@Component
public class RepeatDao {
	@Autowired
	  SqlSessionTemplate sqlSessionTemplate;
	
	 private String namespace = "calendar.model.Calendar";

	public void insertRepeat(RepeatBean repeat) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".insertRepeat", repeat);
		
		if(cnt == -1) {
			System.out.println("repeat insert 실패");
		}
		else if(cnt > 0) {
			System.out.println("repeat insert 성공");
		}
	}

	public String getRecentR_cd() {
		String r_cd = sqlSessionTemplate.selectOne(namespace + ".getRecentR_cd");
		
		return r_cd;
	}
}
