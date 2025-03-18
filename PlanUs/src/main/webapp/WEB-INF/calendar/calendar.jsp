<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/mainMenu.jsp"%>

<style>
	#menu_calendar{
		color : #FF3B7C;
	}
	
	/************* CALENDAR ***************/
	/* 캘린더 전체 영역 */
	#calendar_main{
	   display: flex;
       justify-content: center; /* 중앙 정렬 */
       align-items: flex-start; /* 위쪽 정렬 */
       flex-wrap: wrap; /* 화면이 작을 때 자동 줄바*/
		
	}
	/* 캘린더 전체 영역 */
	#calendar{
         width : 90vw;
         height : 900px;
         aspect-ratio:1.2/1;
         margin:20px;
	} 
	/* 달 영역 */
	#month{
		width : 100%;
		height : 70px;
		margin : auto;
		text-align : center;
		font-size: 20px;
		background-color: white;
	}
	/* 달 숫자 */
	#month_number{
		font-size: 30px;
	}
	/* 이전달, 다음달 화살표 */
	.arrow_btn{
		color : #FF3B7C;
	}
	/* 요알 + 날짜 영역 */
	#day{
		width : 100%;
		height : 830px;
		margin : auto;
		background-color : #F2F2F2;
		text-align: left;
		vertical-align: top;
	}
	/* 요일 영역(테이블) */
	#calendar_table{
		width : 100%;
		height : 	100px;
		table-layout: fixed;
		border : 1px solid white;
		border-collapse: collapse;
		text-align : center;
	}
	/* 날짜 영역 */
	.dates{
		display: flex;
		flex-flow: wrap;
		width : 100%;
		height : 730px;
	}
	/* 날짜 */
	.day {
		display: flex;
		width: calc(100%/ 7);
		text-align: left;
		vertical-align: top;
		padding-left : 5px;
	}
	/* 토요일 */
	.day:nth-child(7n)>a {
		color: #215F9A;
	}
	/* 일요일 */
	 .day:nth-child(7n + 1)>a {
		color: #C00000;
	}
	/* 요일 */
	.cal_top{
		color : white;
		background-color: #363636;
	}
	/* 이전달, 지난달 선택 불가(회색)*/
	.disable {
		color: #989898;
	}
	/* 날짜에 마우스 올리면 핑크색 */
	a:hover{
		color : #FF3B7C;
	}
	.day:nth-child(7n+1) a:hover {
		color: #FF3B7C !important;
	}
	.day:nth-child(7n) a:hover {
		color: #FF3B7C !important;
	}
	/* 하얀 테두리 */
	.dates .day {
	    border: 1px solid white; /* 하얀색 테두리 */
	    box-sizing: border-box; /* 테두리 포함한 크기 유지 */
	}
	/* 요일 하양 테두리 */
	.cal_top th{
	 	border: 1px solid white; 
	}
	/* 오늘 날짜 배경색 변경 */
	.today{
	    background-color : #DEDEDE;
	}
	/* 선택된 날짜 핑크 테두리 */
	.current.selectday{
	    border: 3px solid  #FF3B7C; 
	    box-sizing: border-box; 
	}
	
	/************* TO-DO ***************/
	/* TO-DO table */
	#to-do_table td{
		text-align: left;
		padding-bottom : 10px;
	}
	
	/*화면크기가 1000px보다 클 때 */
   @media screen and (min-width:1000px){
		#calendar{
	         width : 83vw;
	         height : 700px;
	         aspect-ratio:1.2/1;
	         margin:20px;
		} 
      #to-do {
         display: inline-block;
         background-color :  #F2F2F2;
         width : 40vw;
         aspect-ratio:0.7/1;
         margin:20px;
         text-align:left;
         position:relative;
      }  
      #right-column {
	    display: flex;
	    flex-direction: column; /* 세로 배치 */
        margin:20px;
        margin-top : 3px;
	    align-items: center; /* 내부 요소 정렬 */
	    width: 40vw;
	}
       #schedule{
         display: inline-block;
         background-color :  #F2F2F2;
         width : 40vw;
         aspect-ratio:1.4/1;
         margin:20px;
         text-align:left;
         position:relative;
      }
      #diary {
         background-color : #F2F2F2;
         width : 40vw;
         aspect-ratio:1.6/1;
         margin:20px;
         text-align:left;
         position:relative;
      }
   }

   /*화면크기가 1000px보다 작을 때 */
   @media screen and (max-width:1000px){
      #to-do  {
         background-color : #F2F2F2;
         width : 90vw;
         aspect-ratio:1.5/1;
         margin:20px;
         text-align:left;
         position:relative;
      }	 
      #schedule {
         background-color : #F2F2F2;
         width : 90vw;
         aspect-ratio:1.2/1;
         margin:20px;
         text-align:left;
         position:relative;
      }
      #diary {
         background-color : #F2F2F2;
         width : 90vw;
         aspect-ratio:1.2/1;
         margin:20px;
         text-align:left;
         position:relative;
      } 
   }
</style>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 날짜 정보 가져오기
		date = new Date(); // 현재 날짜(로컬 기준) 가져오기
		utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
		kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
		today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
		todayDate = today.getDate();
		
		var year = <%=request.getParameter("year")%>
		var month = <%=request.getParameter("month")%>
		var day = <%=request.getParameter("day")%>
		
		var selectDate = new Date(year, month-1, day);
		
		calendarInit(selectDate);
	});
	
	function getDate(date){
		
		if(date != todayDate){
			day = $(date).text();
		}
		else{
			day = todayDate;
		}
		
		location.href = "go.calendar?year=" + year + "&month=" + month + "&day=" + day; 
	}
	
	function calendarInit(selectDate) {

		var thisMonth = new Date(today.getFullYear(), today.getMonth(), today
				.getDate());
		
		if(selectDate.getYear() != -1){
			thisMonth = selectDate;
		}
		
		// 달력에서 표기하는 날짜 객체
		var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
		var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
		var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

		// 캘린더 렌더링
		renderCalender(thisMonth);

		function renderCalender(thisMonth) {

			// 렌더링을 위한 데이터 정리
			currentYear = thisMonth.getFullYear();
			currentMonth = thisMonth.getMonth();
			currentDate = thisMonth.getDate();

			// 이전 달의 마지막 날 날짜와 요일 구하기
			var startDay = new Date(currentYear, currentMonth, 0);
			var prevDate = startDay.getDate();
			var prevDay = startDay.getDay();

			// 이번 달의 마지막날 날짜와 요일 구하기
			var endDay = new Date(currentYear, currentMonth + 1, 0);
			var nextDate = endDay.getDate();
			var nextDay = endDay.getDay();
			
			// 현재 월 표기
			$('#month_number').text( (currentMonth + 1));
			
			switch(currentMonth){
			case 0 : 
				$('#month_eng').text("JANUARY");
				break;
			case 1 : 
				$('#month_eng').text("FEBURARY");
				break;
			case 2 : 
				$('#month_eng').text("MARCH");
				break;
			case 3 : 
				$('#month_eng').text("APRIL");
				break;
			case 4 : 
				$('#month_eng').text("MAY");
				break;
			case 5 : 
				$('#month_eng').text("JUNE");
				break;
			case 6 : 
				$('#month_eng').text("JULY");
				break;
			case 7 : 
				$('#month_eng').text("AUGUST");
				break;
			case 8 : 
				$('#month_eng').text("SEPTEMBER");
				break;
			case 9 : 
				$('#month_eng').text("OCTOBER");
				break;
			case 10 : 
				$('#month_eng').text("NOVEMBER");
				break;
			case 11 : 
				$('#month_eng').text("DECEMBER");
				break;
			}
					
			year = currentYear;
			month = currentMonth+1;
			
			calendar = document.querySelector('.dates')
			calendar.innerHTML = '';
			
			// 지난달
			for (var i = prevDate - prevDay; i <= prevDate; i++) {
				calendar.innerHTML = calendar.innerHTML
						+ '<div class="kor_font day prev disable">' + i + '</div>'
			}
			// 이번달
			for (var i = 1; i <= nextDate; i++) {
				calendar.innerHTML = calendar.innerHTML
						+ '<div class="kor_font day current" onclick = "getDate(this)"><a href="javascript:void(0);" onClick = "getDate(this)">'
						+ i + '</a></div>'
			}
			// 다음달
			for (var i = 1; i < (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
				calendar.innerHTML = calendar.innerHTML
						+ '<div class="kor_font day next disable">' + i + '</div>'
			}

			// 오늘 날짜 표기
			var currentMonthDate = document
						.querySelectorAll('.dates .current');
			
			if (today.getMonth() == currentMonth) {
				todayDate = today.getDate();

				currentMonthDate[today.getDate() - 1].classList.add('today');
				
				if(todayDate != thisMonth.getDate()){
					todayDate = thisMonth.getDate();
				}
				
				currentMonthDate[todayDate - 1].classList.add('selectday');
			}
			else{
				
				currentMonthDate[thisMonth.getDate() - 1].classList.add('selectday');
			}
			
		}
		$('.go-prev').click(function() {
 			location.href = "go.calendar?year=" + currentYear + "&month=" + currentMonth + "&day=" + 1;
		});

		$('.go-next').click(function() {
 			location.href = "go.calendar?year="  + currentYear + "&month=" + (currentMonth+2) + "&day=" + 1;
		});
	}
</script>

<div id = "calendar_main">
	<table id = "calendar">
		<tr>
			<td>
				<div id = "month" class = "oswald-menu">
					<a href="javascript:;" class="go-prev arrow_btn">◀</a>&emsp;&emsp;&emsp;
					<span id = "month_number"></span> <span id = "month_eng"></span>&emsp;&emsp;&emsp;
					<a href="javascript:;" class="go-next arrow_btn">▶</a>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div id = "day">
					<table id = "calendar_table">
						<tr class = "oswald-menu cal_top">
							<th >SUN</th>
							<th>MON</th>
							<th>TUE</th>
							<th>WED</th>
							<th>THU</th>
							<th>FRI</th>
							<th>SAT</th>
						</tr>
					</table>
					<div class = "dates"></div>
				</div>
			</td>
		</tr>
	</table>
	
	<div id = "to-do">
		<div class = "state_title"> 
			<p class="oswald-title">
	            TO-DO !
	         </p>
	         
	         <table id = "to-do_table">
	         		<tr>	
	         			<td>
	         				<input type = "radio" id = "to-do_radio"/>
	         				<span class="kor_font"> 우형예슬예서희원 모임 정산하기!(3,9000원)</span>
	         			</td>
	         		</tr>
	         		<tr>	
	         			<td>
	         				<input type = "radio" id = "to-do_radio"/>
	         				<span class="kor_font"> 간식구매하기</span>
	         			</td>
	         		</tr>
	         </table>
		</div>
	</div>
	
	<div id = "right-column">
		<div id = "schedule">
			<div class = "state_title"> 
				<p class="oswald-title">
		            SCHEDULE !
		         </p>
		        </div>
		</div>
		
		<div id = "diary">
			<div class = "state_title"> 
				<p class="oswald-title">
		            DIARY !
		         </p>
			</div>
		</div>
	</div>
</div>