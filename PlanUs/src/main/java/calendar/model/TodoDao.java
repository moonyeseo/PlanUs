package calendar.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

@Component
public class TodoDao {
	@Autowired
	  SqlSessionTemplate sqlSessionTemplate;
	
	 private String namespace = "calendar.model.Calendar";

	public List<TodoBean> getTodayTodo(String c_ymd) {
		 
		 List<TodoBean> todoList = sqlSessionTemplate.selectList(namespace + ".getTodayTodo", c_ymd);
		 
		 TodoBean todoTemp = null;
		 for(int i = 0; i < todoList.size(); i++) {
			 if(todoList.get(i).getT_ok_yn().equals("Y")) {
				 todoTemp = todoList.get(i);
				 
				 todoList.remove(i);
				 todoList.add(todoTemp);
			 }
		 }
		 
		return todoList;
	}
	 
}
