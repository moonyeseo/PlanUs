<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table id = "schedule_table">
 <c:if test="${fn:length(scheduleList) eq 0}">
			<tr>
				<td></td>
				<td><label class="kor_font" style = "color : gray"> 오늘의 일정을 등록해주세요 :)</label>	</td>
			</tr>
		</c:if>
		<c:if test="${fn:length(scheduleList) > 0}">
				<c:forEach var = "schedule" items = "${scheduleList}" varStatus = "status">
					<tr>
   			<td  class="td_left" width="25%">
   				<p class="kor_font"> ■ </p>
   			</td>
   			<td>
   				<p class="kor_font"> 
    				 <a href = "javascript:void(0);" onClick = "schedule_Click(this)" id = "${schedule.s_cd }">
    					<c:if test = "${not empty schedule.g_cd }">
    						<span id = "${schedule.s_cd }_g_name" style = "color:${schedule.s_color }">${schedule.g_name }&nbsp;|</span>
    					</c:if>
    						<span id = "${schedule.s_cd }_s_name"  style = "color:${schedule.s_color }">${schedule.s_name }</span>
   					</a>
   				</p>
   				
   				<input type = "hidden" id = "${schedule.s_cd }_s_color" value = "${schedule.s_color }">
   				<input type = "hidden" id = "${schedule.s_cd }_s_memo" value = "${schedule.s_memo }">
   				<input type = "hidden" id = "${schedule.s_cd }_r_type" value = "${schedule.r_type }">
   				<input type = "hidden" id = "${schedule.s_cd  }_r_detail" value = "${schedule.r_detail }">
   			</td>
  			</tr>
			</c:forEach>
		</c:if>
</table>