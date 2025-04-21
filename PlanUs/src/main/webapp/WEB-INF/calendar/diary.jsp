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
	
	function showDeleteModal(d_cd){
		$("#diary_delete_modal").css("display", "flex");
		
		$("#diary_deleteModal_delete").click(function(){
			deleteDiary(d_cd);
		});
		
		$("#diary_deleteModal_cancel").click(function(){
			$("#diary_delete_modal").css("display", "none");
		});
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

<div class = "modal delete_modal" id = "diary_delete_modal">
	<table>
		<tr>
			<td>
				<h2 class = "modal_font">삭제 하시겠습니까?</h2>
				<p class = "kor_font">※복구 불가능※</p>
			</td>
		</tr>
		<tr>
			<td>
				<input type = "button" value = "DELETE" class = "oswald-menu btn deleteModal_delete" id = "diary_deleteModal_delete"/>
				<input type = "button" value = "CANCEL"  class = "oswald-menu btn deleteModal_cancel"  id = "diary_deleteModal_cancel"/>
			</td>
		</tr>
	</table>
</div>
 
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
					<input type = "button" value = "DELETE"  class = "oswald-menu btn" onClick = "showDeleteModal('${diary.d_cd}')"/>
         	</c:if>
		</td>
	</tr>
</table>