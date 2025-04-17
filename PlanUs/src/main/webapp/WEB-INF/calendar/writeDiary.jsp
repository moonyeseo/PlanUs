<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	/************* WRITE DIARY ***************/
	#diary_table td{
		text-align: left;
	}
	#diary_title{
		font-size : 20px;
	}
	#diary_underline{
		margin-top : 7px;
		margin-bottom : 7px;
		width : 90%;
		margin-left : 0;
		border : 0px;
		border-top : 3px solid #FF3B7C;
	}
	#diary_table tr:nth-child(2){
		height : 230px;
	}
	#diary_table tr:nth-child(3){
		padding-top : 20px;
		float : right;
		padding-right : 10px;
	}
	#diary_contents{
		width : 90%;
		height : 230px;
		resize : none;
	}
	
	/*************  수정, 삭제 버튼 ***************/
 	.diary_btn_div{
	    position: absolute;
	    bottom: 20; /* 부모 요소의 가장 아래쪽에 위치 */
	    right: 20;
	} 
	.btn{
		border : none;
		background-color : #FF3B7C;
		color : white;
		margin-left : 7px;
		width : 80px;
		height : 35px;
		font-size : 17px;
		cursor : pointer;
	}
	
	/************* 입력창 ***************/
	.input-container {
	    position: absolute;
	    bottom: 0; /* 부모 요소의 가장 아래쪽에 위치 */
	    left: 0;
	    width: 100%; /* 입력창 너비 조정 */
	    margin-top: 20px;
	    text-align: left;
	    margin-bottom: 7px;
	    margin-left : 3.5px;
	}
   	.check_img, .delete_img {
		width:25px;
	 	height:25px;
   	}
   	.check_button {
   		background:url(resources/image/check.png); 
		width:25px;
	 	height:25px;
	 	border:none;
		vertical-align:middle;
		cursor:pointer;
	    background-repeat: no-repeat;
		background-position:0px 0px;
		background-size: 100% 100%;
   	}
   	.delete_button {
   		background:url(resources/image/delete.png); 
		width:25px;
	 	height:25px;
	 	border:none;
		vertical-align:middle;
		cursor:pointer;
	    background-repeat: no-repeat;
		background-position:0px 0px;
		background-size: 100% 100%;
   	}
   	.input_div {
   		margin-bottom:7px;
   	}
   	.select_div {
   		width : 100%;
   		margin-left:50px;
   		margin-top : 7px;
   	}
	#diary-input-title{
	    width: 90%; /* 입력창 너비 조정 */
	    padding: 5px;
	    font-size: 17px;
	    border: 2px solid gray;
	    background: transparent;
	}
	#diary-input-title:focus {
	    border-color: #FF3B7C;
	    outline: none;
	}
	#diary_contents {
	    width: 90%; /* 입력창 너비 조정 */
	    padding: 7px;
	    font-size: 15px;
	    background: transparent;
	    border: 2px solid gray;
    	text-align: left; /* 입력값 오른쪽 정렬 */
	}
	#diary_contents:focus {
	    outline: none;
	    border-color: #FF3B7C;
	}
</style>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#diary-input-title").focus();
		
		$("#diary-input-title").click(function(){
			$("#d_title_valid").text("");
		})
		$("#diary-input-title").keydown(function(){
			$("#d_title_valid").text("");
		})
		
		$("#diary_contents").click(function(){
			 $("#d_detail_valid").text("");
		})
		$("#diary_contents").keydown(function(){
			 $("#d_detail_valid").text("");
		})
		
		$("#diary_form").on('submit', function(e){
			 e.preventDefault(); // 기본 submit 막기
			 
			 if($("#diary-input-title").val() == ""){
				 $("#d_title_valid").text("제목 입력해주세요ㅠ^ㅠ");
				 $("#diary-input-title").focus();
				 
				 return;
			 }
			 
			 if($("#diary_contents").val() == ""){
				 $("#d_detail_valid").text("내용 입력해주세요ㅠ^ㅠ");
				 $("#diary_contents").focus();
				 
				 return;
			 }
			 
			 $.ajax({
				 url : 'insertDiary.calendar',
				 method : 'POST',
				 data :{
					 d_title : $("#diary-input-title").val(),
					 d_detail : $("#diary_contents").val(),
					 year : $("#diary_year").val(),
					 month : $("#diary_month").val(),
					 day : $("#diary_day").val()
				 },
				 success : function(response){
					 if(response == 'Y'){
						 diary();
					 }
				 },
				 error: function(jqXHR, textStatus, errorThrown) {
					  alert("에러 발생!\n상태: " + textStatus + "\n에러: " + errorThrown + "\n서버 응답: " + jqXHR.responseText);
					}
			 });
		});
	});
	
	function modifyDiary(d_cd){
		 if($("#diary-input-title").val() == ""){
			 $("#d_title_valid").text("제목 입력해주세요ㅠ^ㅠ");
			 $("#diary-input-title").focus();
			 
			 return;
		 }
		 
		 if($("#diary_contents").val() == ""){
			 $("#d_detail_valid").text("내용 입력해주세요ㅠ^ㅠ");
			 $("#diary_contents").focus();
			 
			 return;
		 }
		
		 $.ajax({
			 url : 'modifyDiary.calendar',
			 method : 'POST',
			 data :{
				 d_cd : d_cd,
				 d_title : $("#diary-input-title").val(),
				 d_detail : $("#diary_contents").val(),
				 year : $("#diary_year").val(),
				 month : $("#diary_month").val(),
				 day : $("#diary_day").val()
			 },
			 success : function(response){
				 if(response == 'Y'){
					 diary();
				 }
			 },
			 error: function(jqXHR, textStatus, errorThrown) {
				  alert("에러 발생!\n상태: " + textStatus + "\n에러: " + errorThrown + "\n서버 응답: " + jqXHR.responseText);
				}
		 });
	}
	
 	function diary(){
		var year = <%=request.getParameter("year")%>;
		var month = <%=request.getParameter("month")%>;
		var day = <%=request.getParameter("day")%>;
		
		$(".diary_table_div").empty();
		$(".diary_table_div").load("diary.calendar?year=" + year + "&month=" + month + "&day=" + day);
	} 
</script>

<%-- <form:form id="diary_form" commandName="diary" action="insertDiary.calendar" method="post">
	<input type = "hidden" value = "${year }" name = "year" id = "year">
	<input type = "hidden" value = "${month }" name = "month" id = "month">
	<input type = "hidden" value = "${day }" name = "day" id = "">

	<table id = "diary_table"> 
			<tr>
				<td id = "diary_title" class = "kor_font">
					<input type = "text" placeholder = "제목 입력.." class="kor_font" id = "diary-input-title" name = "d_title">
				</td>
			</tr>
			<tr>
				<td>
					<textarea id = "diary_contents"  class="diary-input-contents kor_font" placeholder = "내용 입력.." name = "d_detail"></textarea>
				</td>
			</tr>
		
		<tr>
			<td>
	   			<input class="check_button" type="submit" value="">
				<input class="delete_button" type="button" value="" onClick = "diary()">
			</td>
		</tr>
	</table>
</form:form> --%>

<form id="diary_form" >
	<input type = "hidden" value = "${year }" id = "diary_year">
	<input type = "hidden" value = "${month }" id = "diary_month">
	<input type = "hidden" value = "${day }"  id = "diary_day">

	<c:if test = "${empty diary }">
		<table id = "diary_table"> 
				<tr>
					<td id = "diary_title" class = "kor_font">
						<input type = "text" placeholder = "제목 입력.." class="kor_font" id = "diary-input-title" >
						<br><span id = "d_title_valid" class = "vaild_font"></span>
					</td>
				</tr>
				<tr>
					<td>
						<textarea id = "diary_contents"  class="diary-input-contents kor_font" placeholder = "내용 입력.."></textarea>
						<br><span id = "d_detail_valid"  class = "vaild_font"></span>
					</td>
				</tr>
			
			<tr>
				<td>
		   			<input class="check_button" type="submit" value="">
					<input class="delete_button" type="button" value="" onClick = "diary()">
				</td>
			</tr>
		</table>
	</c:if>
	
	<c:if test = "${not empty diary }">
		<table id = "diary_table"> 
				<tr>
					<td id = "diary_title" class = "kor_font">
						<input type = "text" class="kor_font" id = "diary-input-title" value = "${diary.d_title }">
						<br><span id = "d_title_valid" class = "vaild_font"></span>
					</td>
				</tr>
				<tr>
					<td>
						<textarea id = "diary_contents"  class="diary-input-contents kor_font" >${diary.d_detail }</textarea>
						<br><span id = "d_detail_valid"  class = "vaild_font"></span>
					</td>
				</tr>
			
			<tr>
				<td>
		   			<input class="check_button" type="button" value="" onClick = "modifyDiary('${diary.d_cd }')">
					<input class="delete_button" type="button" value="" onClick = "diary()">
				</td>
			</tr>
		</table>
	</c:if>
</form>