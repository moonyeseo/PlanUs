package calendar.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

@Component
public class CalendarDao {
	@Autowired
	  SqlSessionTemplate sqlSessionTemplate;
	
	 private String namespace = "calendar.model.Calendar";
	 
	 // select 
	 public List<CalendarBean> getThisMonthCalendar(String c_ym){
		 
		 List<CalendarBean> calendarThisMonthList = sqlSessionTemplate.selectList(namespace + ".getThisMonthCalendar", c_ym);
		 
		 return calendarThisMonthList;
	 }
}
