<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function writeDiary(d_cd){
		var year = <%=request.getParameter("year")%>;
		var month = <%=request.getParameter("month")%>;
		var day = <%=request.getParameter("day")%>;
		
		$(".diary_table_div").empty();
		$(".diary_table_div").load("writeDiaryForm.calendar?year=" + year + "&month=" + month + "&day=" + day + "&d_cd=" + d_cd);
	}
	
	function deleteDiary(d_cd){
		var year = <%=request.getParameter("year")%>;
		var month = <%=request.getParameter("month")%>;
		var day = <%=request.getParameter("day")%>;
		
		 $.ajax({
			 url : 'deleteDiary.calendar',
			 method : 'POST',
			 data :{
				 d_cd : d_cd
			 },
			 success : function(response){
				 if(response == 'Y'){
					 $(".diary_table_div").empty();
					 $(".diary_table_div").load("diary.calendar?year=" + year + "&month=" + month + "&day=" + day);
					}
			 },
			 error: function(jqXHR, textStatus, errorThrown) {
				  alert("에러 발생!\n상태: " + textStatus + "\n에러: " + errorThrown + "\n서버 응답: " + jqXHR.responseText);
				}
		 });
	}
</script>

<table id = "diary_table">
        <c:if test="${empty diary}">
      			<tr style = "padding-top : 0px">
      				<td><label class="kor_font" style = "color : gray; padding-left : 30px;"> 오늘의 일기를 등록해주세요 :)</label>	</td>
      			</tr>
      			<tr><td></td></tr>
      		</c:if>
      		
       <c:if test="${not empty diary}">
		<tr>
			<td id = "diary_title" class = "kor_font">
				${diary.d_title }
				<hr id = "diary_underline">
			</td>
		</tr>
		<tr>
			<td>
				<textarea readonly id = "diary_contents"  class = "kor_font">${diary.d_detail}</textarea>
			</td>
		</tr>
	</c:if>
	
	<tr>
		<td>
			<c:if test="${empty diary}">
         			<input type = "button" value = "WRITE" class = "oswald-menu btn" onClick = "writeDiary('X')"/>
         	</c:if>
         	<c:if test="${not empty diary}">
         			<input type = "button" value = "MODIFY" class = "oswald-menu btn" onClick = "writeDiary('${diary.d_cd}')"/>
					<input type = "button" value = "DELETE"  class = "oswald-menu btn" onClick = "deleteDiary('${diary.d_cd}')"/>
         	</c:if>
		</td>
	</tr>
</table>