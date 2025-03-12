package groups.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GroupsDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "groups.model.Groups";
	
	public GroupsDao() {
		
	}
	
//	public void studentReqInsert(RequestBean req) {
//		sqlSessionTemplate.insert(namespace + ".studentReqInsert", req);
//	}
	
}
