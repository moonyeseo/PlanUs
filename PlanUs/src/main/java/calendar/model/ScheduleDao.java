package calendar.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

@Component
public class ScheduleDao {
	@Autowired
	  SqlSessionTemplate sqlSessionTemplate;
	
	 private String namespace = "calendar.model.Calendar";

	public List<ScheduleBean> getTodaySchedule(String c_ymd) {
		List<ScheduleBean> scheduleList = sqlSessionTemplate.selectList(namespace + ".getTodaySchedule", c_ymd);

		return scheduleList;
	}

	public void insertSchedule(ScheduleBean schedule) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".insertSchedule", schedule);
		
		if(cnt == -1) {
			System.out.println("schedule insert 실패");
		}
		else if(cnt > 0) {
			System.out.println("schedule insert 성공");
		}
	}

	public String getRecentS_cd() {
		String s_cd = sqlSessionTemplate.selectOne(namespace + ".getRecentS_cd");
		
		return s_cd;
	}
}
