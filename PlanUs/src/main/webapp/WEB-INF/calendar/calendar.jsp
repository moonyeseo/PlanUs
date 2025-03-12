<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/mainMenu.jsp"%>

<style>
	#menu_calendar{
		color : #FF3B7C;
	}
	#out_table{
		width : 90%;
		margin : auto;
		text-align : center;
	}
	#in_table{
		width : 100%;
		margin : auto;
	}
	#calendar{
		width : 90%;
		height : 650px;
		background-color : pink;
		margin : auto;
	}
</style>

<div>
	<table id = "out_table" border = "1 black">
		<tr>
			<td>
				<table id = "calendar">
					
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<table  id = "in_table" border = "1 gray">
				
				</table>
			</td>
		</tr>
	</table>
</div>