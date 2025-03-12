<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/mainMenu.jsp"%>
<html>
<head>
	<title>Planus'_'</title>
</head>
<style>
	#accountbook_main {
	    display: flex;
	    justify-content: center; /* 중앙 정렬 */
	    align-items: flex-start; /* 위쪽 정렬 */
	    flex-wrap: wrap; /* 화면이 작을 때 자동 줄바*/
	}
	.state_list {
		display:contents;
		text-align:left;
	}
	#state_table {
		width:90%;
		margin-left:10px;
		margin-top:40px;
	} 
	.td_left {
		text-align:left;
	}
	.td_right {
		text-align:right;
	}
	#state_title {
		position: absolute;
  		display: inline-block;
	    width:100%;
	    top:-37px;
	 	color:#FF3B7C;
	 	margin-left:6px
	}
	.oswald-title {
	  font-family: "Oswald", sans-serif;
	  font-optical-sizing: auto;
	  font-weight: 400;
	  font-style: normal;
	  font-size:22px;
	  color:#FF3B7C;
	}
	
	.progress-bar {
	    width: 100%;
	    height: 10px;
	    background-color: #949494;
	    font-weight: 600;
	    font-size: .8rem;
	}
	.progress-bar .progress {
	    height: 10px;
	    padding: 0;
	    text-align: center;
	    background-color: #4F4F4F;
	    color: #111;
	}

	
	/*화면크기가 1000px보다 클 때 */
	@media screen and (min-width:1000px){

		#accountbook_calendar {
  			display: inline-block;
			background-color :  #F2F2F2;
			width : 40vw;
			aspect-ratio:1.2/1;
			margin:20px;
		}
		
		#account_state {
  			display: inline-block;
			background-color :  #F2F2F2;
			width : 40vw;
			aspect-ratio:1.5/1;
			margin:20px;
			text-align:left;
			position:relative;
		}
		#category_state {
			background-color : #F2F2F2;
			width : 40vw;
			aspect-ratio:1.2/1;
			margin:20px;
			text-align:left;
			position:relative;
			top:-90px;
		}
		#state_table {
			width:90%;
			margin-left:10px;
			margin-top:30px;
		} 
	
	}

	/*화면크기가 1000px보다 작을 때 */
	@media screen and (max-width:1000px){

		#accountbook_calendar {
			background-color : #F2F2F2;
			width : 90vw;
			aspect-ratio:1.2/1;
			margin:20px;
		}

		#account_state {
			background-color : #F2F2F2;
			width : 90vw;
			aspect-ratio:1.5/1;
			margin:20px;
			text-align:left;
			position:relative;
		}
		#state_table {
			width:90%;
			margin-left:10px;
			margin-top:30px;
		} 
		#category_state {
			background-color : #F2F2F2;
			width : 90vw;
			aspect-ratio:1.2/1;
			margin:20px;
			text-align:left;
			position:relative;
		}

	}
</style>
<body>
<div id="accountbook_main">
	<div id="accountbook_calendar">
		<div>
			<span class="oswald-title">
				3
			</span>
			<span>
				march
			</span>
		</div>
		<p class="kor_font"> 달력 영역 입니다.</p>
	</div>
	<div id="account_state">
		<div class="state_title">
			<p class="oswald-title">
				ACCOUNT  STATE !
			</p>
		</div>
		<table id="state_table">
			<tr>
				<td class="td_left" width="25%">
					<p  class="kor_font">  ■ 신한카드 </p>
				</td>
				<td class="td_left" >
					<p  class="kor_font"> 76,000 원  /  150,000 원 </p>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<div class="progress-bar">
						<div class="progress" style="width:51%">
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<div id="account_state">
		<div class="state_title">
			<p class="oswald-title">
				INCOME & EXPENDITURE !
			</p>
		</div>
		<table id="state_table">
			<tr>
				<td class="td_left" width="25%">
					<p  class="kor_font">  ■ 신한카드 </p>
				</td>
				<td class="td_left" >
					<p  class="kor_font"> 76,000 원  /  150,000 원 </p>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<div class="progress-bar">
						<div class="progress" style="width:51%">
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	
	<div id="category_state">
		<div class="state_title">
			<p class="oswald-title">
				CATEGORY  STATE !
			</p>
		</div>
		<table id="state_table">
			<tr>
				<td class="td_left" width="25%">
					<p  class="kor_font">  ■ 식비 </p>
				</td>
				<td class="td_left" >
					<p  class="kor_font"> 36,000 원  /  100,000 원 </p>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<div class="progress-bar">
						<div class="progress" style="width:36%">
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="td_left" width="25%">
					<p  class="kor_font">  ■ 쇼핑 </p>
				</td>
				<td class="td_left" >
					<p  class="kor_font"> 40,000 원  /  50,000 원 </p>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
					<div class="progress-bar">
						<div class="progress" style="width:80%">
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>

</div>

</body>

</html>