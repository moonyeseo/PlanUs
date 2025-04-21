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

	public void insertCalendarDiary(DiaryBean diary) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".insertCalendarDiary", diary);
		
		if(cnt == -1) {
			System.out.println("calendar diary insert 실패");
		}
		else if(cnt > 0) {
			System.out.println("calendar diary insert 성공");
		}
		
	}

	public void deleteCalendarDiary(String d_cd) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".deleteCalendarDiary", d_cd);
		
		if(cnt == -1) {
			System.out.println("calendar diary delete 실패");
		}
		else if(cnt > 0) {
			System.out.println("calendar diary delete 성공");
		}
		else {
			System.out.println("calendar diary delete 레코드 못찾음");
		}
	}

	public void insertCalendarSchedule(CalendarBean calendar) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".insertCalendarSchedule", calendar);
		
		if(cnt == -1) {
			System.out.println("calendar schedule insert 실패");
		}
		else if(cnt > 0) {
			System.out.println("calendar schedule insert 성공");
		}
		
	}
}
