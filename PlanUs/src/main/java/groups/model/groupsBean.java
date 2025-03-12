package groups.model;

import org.hibernate.validator.constraints.NotEmpty;

public class groupsBean {

	private String G_CD;
	private String U_CD;	//유저코드
	
	@NotEmpty(message="그룹명을 작성해주세요.")
	private String G_NAME;
	
	private String G_INTRO;	//그룹소개
	
	@NotEmpty(message="그룹 공개여부를 선택하세요.")
	private String G_PUB;	//그룹 공개여부
	
	private String G_TAG;	//그룹소개태그
	
}
