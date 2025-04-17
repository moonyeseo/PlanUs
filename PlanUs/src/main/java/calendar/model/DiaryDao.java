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

	public void insertDiary(DiaryBean diary) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".insertDiary", diary);
		
		if(cnt == -1) {
			System.out.println("diary insert 실패");
		}
		else if(cnt > 0) {
			System.out.println("diary insert 성공");
		}
	}

	public String getRecentD_cd() {
		String d_cd = sqlSessionTemplate.selectOne(namespace + ".getRecentD_cd");
		
		return d_cd;
	}

	public DiaryBean getDiaryByDcd(String d_cd) {
		DiaryBean diary = sqlSessionTemplate.selectOne(namespace + ".getDiaryByDcd", d_cd);
		
		return diary;
	}

	public void modifyDiary(DiaryBean diary) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".modifyDiary", diary);
		
		if(cnt == -1) {
			System.out.println("diary modify 실패");
		}
		else if(cnt > 0) {
			System.out.println("diary modify 성공");
		}
		else {
			System.out.println("diary modify 레코드 못찾음");
		}
	}

	public void deleteDiary(String d_cd) {
		int cnt = -1;
		cnt = sqlSessionTemplate.delete(namespace + ".deleteDiary", d_cd);
		
		if(cnt == -1) {
			System.out.println("diary delete 실패");
		}
		else if(cnt > 0) {
			System.out.println("diary delete 성공");
		}
		else {
			System.out.println("diary delete 레코드 못찾음");
		}
	} 
}
