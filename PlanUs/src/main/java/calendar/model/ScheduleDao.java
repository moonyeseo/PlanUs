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
}
