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
	#month_table{
		width : 100%;
		height : 70px;
		margin : auto;
		text-align : center;
		font-size: 20px;
		table-layout: fixed;
	}
	#month_table td:nth-child(1){
		text-align : right;
	}
	#month_table td:nth-child(3){
		text-align : left;
	}
	/* 달 숫자 */
	#month_number{
		font-size: 30px;
	}
	/* 이전달, 다음달 화살표 */
	.arrow_btn{
		color : #FF3B7C;
	}
	/* 요일 + 날짜 영역 */
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
		flex-direction: column; 
		width: calc(100%/ 7);
		height : calc(100%/ 6);
		text-align: left;
		vertical-align: top;
		padding-left : 5px;
	}
	.day a{
		width: 100%;
		height : 15px;
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
    	cursor: pointer;
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
	.current{
    	cursor: pointer;
	}
	.schedule_items{
		width : 100%;
		margin-top : 5px;
	}
	
	/************* TO-DO, SCHEDULE ***************/
	/* table */
	#to-do_table,
	#to-do_table_input,
	#schedule_table,
	#schedule_table_input,
	#diary_table {
   	   width: 100%;  /* 테이블이 영역을 다 채우도록 */
		padding-left : 20px;
   }
	#input_section {
	   flex-shrink: 0; /* 입력창은 크기 조정 안 함 */
	   margin-top: 10px;
	}
	.to-do_table_div{
		margin-top : 30px;
		max-height: 700px; /* 원하는 높이로 조절 */
	    overflow-y: auto; /* 세로 스크롤 추가 */
	    text-align: left;
	}
	.diary_table_div{
		margin-top : 30px;
		max-height: 500px; /* 원하는 높이로 조절 */
	    text-align: left;
	}
	.schedule_table_div{
		margin-top : 30px;
		/*  aspect-ratio:1.2/1; */
		max-height: 160px; /* 원하는 높이로 조절 */ 
	    overflow-y: auto; /* 세로 스크롤 추가 */
	    text-align: left;
	}
	#to-do_table td,
	#to-do_table_input td,
	#schedule_table td,
	#schedule_table_input td{
		text-align: left;
		padding-bottom : 10px;
	}
	#to-do_table td:nth-child(1),
	#to-do_table_input td:nth-child(1),
	#schedule_table td:nth-child(1),
	#schedule_table_input td:nth-child(1){
		width : 20px;
	}
	#to-do{
		position: relative; /* 부모 요소 */
    	height: 100%;
	}
	.select_radio{
		width:10px;
   		height:10px;
   		accent-color:#FF3B7C;
	}
	#schedule_color{
	  width: 60px;
	  height: 25px;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  background-color: transparent;
	  border: none;
	  cursor : pointer;
	}
	#schedule_color::-webkit-color-swatch{
	  	border: none;
	}
	
	/*TO-DO checkbox*/
	.to-do_checkbox{
	 	appearance: none; /* 기본(네이티브) 모양을 제거 */
	    box-sizing: border-box;
	    border : 1px solid #FF3B7C;
		width : 15px;
		height : 15px;
    	cursor: pointer;
    	background-color: transparent;
	}
	.to-do_checkbox:checked{
	    border-color: #FF3B7C;
	    background-color: #FF3B7C;
	}
	.checkbox_yes{
		color : gray; 
		text-decoration : line-through;
	}
	
	/*요일 반복 checkbox*/
	.select_checkbox{
	 	appearance: none; /* 기본(네이티브) 모양을 제거 */
	    box-sizing: border-box;
	    border : 1px solid #363636;
		width : 10px;
		height : 10px;
    	cursor: pointer;
    	background-color: transparent;
	}
	.select_checkbox:checked{
	    border-color: #363636;
	    background-color: #363636;
	}

	/************* DIARY ***************/
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
		width : 100%;
		height : 230px;
		border : none;
		background-color : transparent;
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
	#memo_input{
		width: 50%; /* 입력창 너비 조정 */
	    padding: 5px;
	    font-size: 10px;
	    border: none;
	    background: transparent;
  		border-bottom: 2px solid #363636;
	}
	.input-field {
	    width: 78%; /* 입력창 너비 조정 */
	    padding: 5px;
	    font-size: 16px;
	    border: none;
	    background: transparent;
  		border-bottom: 2px solid #FF3B7C;
	}
	.input-field:focus {
	    border-color: #FF3B7C;
	    outline: none;
  		border-bottom: spx solid #FF3B7C;
	}
	.input-field_sub {
	    width: 60%; /* 입력창 너비 조정 */
	    padding: 7px;
	    font-size: 13px;
	    border: none;
	    background: transparent;
  		border-bottom: 2px solid #ccc;
    	text-align: left; /* 입력값 오른쪽 정렬 */
	}
	.input-field_sub:focus {
	    border-color: #ccc;
	    outline: none;
  		border-bottom: spx solid #ccc;
	}
   	#todo_date-select,
   	#schedule_date-select,
   	#schedule_group-select{
   		width: 15%; /* 입력창 너비 조정 */
	    padding: 7px;
	    font-size: 13px;
	    border: none;
    	text-align: center; 
	    background: transparent;
  		border-bottom: 2px solid #ccc;
  		cursor : pointer;
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
   	#todo_date_selected,
   	#schedule_date_selected{
   		font-size : 12px;
   		color : gray;
		font-family: "Gowun Dodum", sans-serif;
		font-weight: 400;
		font-style: normal;
   	}
	.calendar_font{
	  word-break: keep-all;      /* 단어 중간에 끊지 않음 */
	  white-space: normal;
	  font-family: "Gowun Dodum", sans-serif;
	  font-weight: 400;
	  font-style: normal;
      font-size:12px;
  	  line-height: 1.2;
  	  margin-top : 5px;
      pointer-events: none;
	  width: 100%;
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
      #diary_table{;
         width : 40vw;
         aspect-ratio:1.6/1;
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
      #schedule_table{
      	margin-top : 30px;
		padding-left : 20px;	
      }
      .diary_table_div{
         width : 90vw;
         aspect-ratio:1.0/1;
      }
      #diary_table{
         width : 90vw;
         aspect-ratio:1.2/1;
      } 
      #diary_table tr:nth-child(2){
      	height: 60%;
      }
	.schedule_table_div{
		margin-top : 30px;
		max-height: 300px; /* 원하는 높이로 조절 */
	    overflow-y: auto; /* 세로 스크롤 추가 */
	    text-align: left;
	}
	.to-do_table_div{
		margin-top : 30px;
		max-height: 300px; /* 원하는 높이로 조절 */
	    overflow-y: auto; /* 세로 스크롤 추가 */
	    text-align: left;
	}
   }
</style>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
/****************** CALENDAR ******************/
	$(document).ready(function(){
		// 날짜 정보 가져오기
		date = new Date(); // 현재 날짜(로컬 기준) 가져오기
		utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
		kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
		today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
		todayDate = today.getDate();
		
		var year = <%=request.getParameter("year")%>;
		var month = <%=request.getParameter("month")%>;
		var day = <%=request.getParameter("day")%>;
		
		var selectDate = new Date(year, month-1, day);
		
		calendarInit(selectDate);
		
		calendarSchedule();
	});
	
	function calendarSchedule(){
 		var regex = /^[0-9]*$/;
		
		var day = 0;
		var s_name = "";
		var s_color = "";
		
		var day_arr = new Array(31);
		for(var i = 0; i < day_arr.length; i++){
			day_arr[i] = 0;
		}
		
		$(".calendar_schedule").each(function(index, item){
			if(regex.test($(this).val())){
				day = $(this).val();
			}
			else if($(this).val().substr(0, 1) == "#"){
				s_color = $(this).val();
			}
			else{
				s_name = $(this).val();
			}
			
			if(day != 0 && s_name != "" && s_color != ""){
				if(day_arr[day - 1] == 3){
					$("#" + day + "_schedule_items").append("<div class = 'calendar_font'>...</div>");
				}
				else if(day_arr[day - 1] < 3){
					$("#" + day + "_schedule_items").append("<div class = 'calendar_font'> <span style = 'color : " + s_color +"'>" +  s_name + "</span></div>");
					
				}
				
				day_arr[day - 1]++;
				day = 0;
				s_name = "";
				s_color = "";
			}
		});
	}
	
	function getDate(date){
		
		if(date != todayDate){
			day = date;
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

		renderCalender(thisMonth);

		function renderCalender(thisMonth) {

			currentYear = thisMonth.getFullYear();
			currentMonth = thisMonth.getMonth();
			currentDate = thisMonth.getDate();

			// last Month's last day and last date (이전 달의 마지막 날 날짜와 요일 구하기)
			var startDay = new Date(currentYear, currentMonth, 0);
			var prevDate = startDay.getDate();
			var prevDay = startDay.getDay();

			// this Month's last day and last date(이번 달의 마지막날 날짜와 요일 구하기)
			var endDay = new Date(currentYear, currentMonth + 1, 0);
			var nextDate = endDay.getDate();
			var nextDay = endDay.getDay();
			
			// current Month
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
			
			// last Month
			for (var i = prevDate - prevDay; i <= prevDate; i++) {
				calendar.innerHTML = calendar.innerHTML
						+ '<div class="kor_font day prev disable">' + i + '</div>'
			}
			// this Month
			for (var i = 1; i <= nextDate; i++) {
				calendar.innerHTML = calendar.innerHTML
						+ '<div id = "' + i + '" class="kor_font day current" onclick = "getDate(' + i  + ')"><a href="javascript:void(0);" onClick = "getDate(' + i  + ')" id = "a_' + i + '">'
						+ i + '</a><div class = "schedule_items" id="' + i + '_schedule_items"></div>'
			}
			// next Month
			for (var i = 1; i < (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
				calendar.innerHTML = calendar.innerHTML
						+ '<div class="kor_font day next disable">' + i + '</div>'
			}
			
			// today
			var currentMonthDate = document
						.querySelectorAll('.dates .current');
			
			if(today.getFullYear() == currentYear){
				if (today.getMonth() == currentMonth) {
					todayDate = today.getDate();
					currentMonthDate[today.getDate() - 1].classList.add('today');
					
				}
			}
			
			if (today.getMonth() == currentMonth) {
				todayDate = today.getDate();
				
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
	

/****************** TODO ******************/
	function todo_Click(todo){
 		var t_cd = todo.getAttribute("id");
		var t_name = todo.text;
		var t_ok_yn = $("#" + t_cd + "_t_ok_yn").val();
		var r_type = $("#" + t_cd + "_r_type").val();
		var r_detail = $("#" + t_cd + "_r_detail").val();
		var r_detail_split = r_detail.split(",");
		
		$("#todo_date_selected").html("");
		$("input[name=todo_day]").prop("checked", false);
		
		$("#to-do_input").val(t_name);
		$("#to-do_input").focus();
		
		if(t_ok_yn == "Y"){
			$("#to-do_checkbox_input").prop("checked", true);
		}
		else{
			$("#to-do_checkbox_input").prop("checked", false);
		}
		
		if(r_type == "1"){
			for(var i  = 0; i < r_detail_split.length; i++){
				if($("#todo_date_selected").text().indexOf("일") == -1){
					$("#todo_date_selected").html(" <a href = 'javascript:void(0);' onClick = 'deleteTodoDate(this)' class = 'delete_date' >" + r_detail_split[i] + "일</a>");
				}
				else{
					$("#todo_date_selected").html($("#todo_date_selected").html() + "<a href =  'javascript:void(0);' onClick = 'deleteTodoDate(this)' class = 'delete_date'> , " + r_detail_split[i] + "일</a>");
				}
			}
		}
		else if(r_type == "0"){
			for(var i  = 0; i < r_detail_split.length; i++){
				$("input[name=todo_day][value=" + r_detail_split[i] +"]").prop("checked", true);
			}
		}
		
	}
	
	function selectTodoDate(todo_date){
		if($("#todo_date_selected").text().indexOf("일") == -1){
			$("#todo_date_selected").html(" <a href = 'javascript:void(0);' onClick = 'deleteTodoDate(this)' class = 'delete_date'>" + todo_date.value + "일</a>");
		}
		else{
			$("#todo_date_selected").html($("#todo_date_selected").html() + "<a href =  'javascript:void(0);' onClick = 'deleteTodoDate(this)' class = 'delete_date'> , " + todo_date.value + "일</a>");
		}
	}
	
	function deleteTodoDate(todo_date){
		$(todo_date).remove();
	}
	

	/****************** SCHEDULE ******************/
		function schedule_Click(schedule){
	 		var s_cd = schedule.getAttribute("id");
	 		var g_name = $("#" + s_cd + "_g_name").text();
			var s_name = $("#" + s_cd + "_s_name").text();
			var s_color = $("#" + s_cd + "_s_color").val();
			var s_memo = $("#" + s_cd + "_s_memo").val();
			var r_type = $("#" + s_cd + "_r_type").val();
			var r_detail = $("#" + s_cd + "_r_detail").val();
			var r_detail_split = r_detail.split(",");
			
			$("#schedule_date_selected").html("");
			$("input[name=schedule_day]").prop("checked", false);
			
			$("#schedule_input").val(s_name);
			$("#schedule_color").val(s_color);
			$("#schedule_input").focus();
			
			$("#schedule_memo_input").val(s_memo);
			
			if(r_type == "1"){
				for(var i  = 0; i < r_detail_split.length; i++){
					if($("#schedule_date_selected").text().indexOf("일") == -1){
						$("#schedule_date_selected").html(" <a href = 'javascript:void(0);' onClick = 'deleteScheduleDate(this)' class = 'delete_date' >" + r_detail_split[i] + "일</a>");
					}
					else{
						$("#schedule_date_selected").html($("#schedule_date_selected").html() + "<a href =  'javascript:void(0);' onClick = 'deleteScheduleDate(this)' class = 'delete_date'> , " + r_detail_split[i] + "일</a>");
					}
				}
			}
			else if(r_type == "0"){
				for(var i  = 0; i < r_detail_split.length; i++){
					$("input[name=schedule_day][value=" + r_detail_split[i] +"]").prop("checked", true);
				}
			}
		}
		
		function selectScheduleDate(schedule_date){
			if($("#schedule_date_selected").text().indexOf("일") == -1){
				$("#schedule_date_selected").html(" <a href = 'javascript:void(0);' onClick = 'deleteScheduleDate(this)' class = 'delete_date'>" + schedule_date.value + "일</a>");
			}
			else{
				$("#schedule_date_selected").html($("#schedule_date_selected").html() + "<a href =  'javascript:void(0);' onClick = 'deleteScheduleDate(this)' class = 'delete_date'> , " + schedule_date.value + "일</a>");
			}
		}
		
		function deleteScheduleDate(schedule_date){
			$(schedule_date).remove();
		}
</script>

<div id = "calendar_main">
	<table id = "calendar">
		<tr>
			<td>
				<div id = "month">
					<table id = "month_table"  class = "oswald-menu">
						<tr>
							<td><a href="javascript:;" class="go-prev arrow_btn ">◀</a></td>
							<td><span id = "month_number"></span> <span id = "month_eng"></span></td>
							<td><a href="javascript:;" class="go-next arrow_btn">▶</a></td>
						</tr>
						
							<c:if test="${fn:length(calendarList) > 0}">
		         				<c:forEach var = "calendar" items = "${calendarList}" varStatus = "status">
								<tr>
		         					<td> <input type = "hidden" id = "${calendar.c_cd }_c_ymd" class = "calendar_schedule c_ymd" value = "${calendar.c_ymd}"> </td>
		         					<td> <input type = "hidden" id = "${calendar.s_cd}" class = "calendar_schedule s_name" value = "${calendar.s_name }"> </td>
		         					<td> <input type = "hidden" id = "${calendar.s_cd}_s_color" class = "calendar_schedule s_color" value = "${calendar.s_color }"> </td>
		         				</tr>
		         				</c:forEach>
	         				</c:if>	
						
					</table>
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
	     </div>
         <div class = "to-do_table_div ">
	         <table id = "to-do_table">
	         		<c:if test="${fn:length(todoList) eq 0}">
	         			<tr>
	         				<td></td>
	         				<td><label class="kor_font" style = "color : gray"> 오늘의 할 일을 등록해주세요 :)</label>	</td>
	         			</tr>
	         		</c:if>
	         		<c:if test="${fn:length(todoList) > 0}">
	         				<c:forEach var = "todo" items = "${todoList}" varStatus = "status">
	         					<tr>
			         			<td>
			         				<c:choose>
			         					<c:when test = "${todo.t_ok_yn eq 'Y' }">
			         						<input type = "checkbox" class = "to-do_checkbox" checked/> 
			         					</c:when>
			         					<c:otherwise>
			         						<input type = "checkbox" class = "to-do_checkbox"/> 
			         					</c:otherwise>
			         				</c:choose>
			         			</td>
			         			<td>
			         				<c:choose>
			         					<c:when test = "${todo.t_ok_yn eq 'Y' }">
			         						<label class="kor_font"  id = "${todo.t_cd }"> <a href = "javascript:void(0);" onClick = "todo_Click(this)" class = "checkbox_yes" id = "${todo.t_cd }">${todo.t_name }</a></label>
			         					</c:when>
			         					<c:otherwise>
			         						<label class="kor_font"  id = "${todo.t_cd }"> <a href = "javascript:void(0);" onClick = "todo_Click(this)"  id = "${todo.t_cd }">${todo.t_name }</a></label>	
			         					</c:otherwise>
			         				</c:choose>
			         				
			         				<input type = "hidden" id = "${todo.t_cd }_t_ok_yn" value = "${todo.t_ok_yn }">
			         				<input type = "hidden" id = "${todo.t_cd }_r_type" value = "${todo.r_type }">
			         				<input type = "hidden" id = "${todo.t_cd }_r_detail" value = "${todo.r_detail }">
			         			</td>
			         			</tr>
	         			</c:forEach>
	         		</c:if>
	         </table>
         </div>
         
          <!-- 입력창 추가 -->
         <div class = "input-container">
         	<form>
         		<div class = "input_div">
         			<table id = "to-do_table_input">
	         			<tr>
	         				<td>
         						<input type = "checkbox" class = "to-do_checkbox" id = "to-do_checkbox_input"/>
	         				</td>
	         				<td>
			         			<input type = "text" id = "to-do_input" class = "input-field kor_font" placeholder = "ToDo 입력..">
			         			<input class="check_button" type="submit" value = "">
						        <input class="delete_button" type="reset" value = "">
	         				</td>
	         			</tr>
			        </table>
         		</div>
         		
         		<div class = "select_div kor_font">
         			 <label for="to-do_input" class="kor_font">Day |  </label>
         			<input type = "checkbox" class = "select_checkbox"  name = "todo_day" value = "일"/> 일
         			<input type = "checkbox" class = "select_checkbox"  name = "todo_day" value = "월"/> 월
         			<input type = "checkbox" class = "select_checkbox"  name = "todo_day" value = "화"/> 화 
         			<input type = "checkbox" class = "select_checkbox"  name = "todo_day" value = "수"/> 수
         			<input type = "checkbox" class = "select_checkbox"  name = "todo_day" value = "목"/> 목
         			<input type = "checkbox" class = "select_checkbox"  name = "todo_day" value = "금"/> 금
         			<input type = "checkbox" class = "select_checkbox"  name = "todo_day" value = "토"/> 토
         		</div>
         		
         		<div class = "select_div kor_font">
			        <label for="todo_date-select" class="kor_font">Date |  </label>
			        <select id="todo_date-select" name="todo_date-select" onchange = "selectTodoDate(this)">
					    <option value="">날짜 선택</option>
					</select>
					
					<script>
					    const select = document.getElementById("todo_date-select");
					    
					    for (let i = 1; i <= 31; i++) {
					        let option = document.createElement("option");
					        option.value = i;
					        option.textContent = i;
					        select.appendChild(option);
					    }
					</script>
			        <label for="todo_date-select" class="kor_font"> 일 </label>
			        
			        <label id = "todo_date_selected">&nbsp;</label>
         		</div>
         	</form>
         </div>
	</div>
	
	<div id = "right-column">
		<div id = "schedule">
			<div class = "state_title"> 
				<p class="oswald-title">
		            SCHEDULE !
		         </p>
		    </div>
		    
	         <div class = "schedule_table_div">
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
	         </div>
         
          <!-- 입력창 추가 -->
         <div class = "input-container">
         	<form>
         		<div class = "input_div">
         			<table id = "schedule_table_input">
	         			<tr>
	         				<td>
		         				<p class="kor_font"> ■ </p>
		         			</td>
	         				<td>
			         			<input type = "text" id = "schedule_input" class = "input-field kor_font" placeholder = "일정 등록..">
			         			<input class="check_button" type="submit" value="">
						        <input class="delete_button" type="submit" value="">
	         				</td>
	         			</tr>
			        </table>
         		</div>
         		
         		<div class = "select_div kor_font">
         			 <label for="schedule_group-select" class="kor_font">Color |  </label>
         			 <input type = "color" id = "schedule_color"/>
         		</div>
         		
         		<div class = "select_div kor_font">
         			 <label for="schedule_group-select" class="kor_font">Group |  </label>
         			 <select id="schedule_group-select" name="schedule_group-select">
					    <option value="">모임 선택</option>
					</select>
         		</div>
         		
         		<div class = "select_div kor_font">
         			 <label for="schedule_input" class="kor_font">Memo |  </label>
			        <input type="text" id="schedule_memo_input" class="input-field_sub kor_font" placeholder="메모 입력.."/>
         		</div>
         		
         		<div class = "select_div kor_font">
         			 <label for="to-do_input" class="kor_font">Day |  </label>
         			<input type = "checkbox" class = "select_checkbox"  name = "schedule_day" value = "일"/> 일
         			<input type = "checkbox" class = "select_checkbox"  name = "schedule_day" value = "월"/> 월
         			<input type = "checkbox" class = "select_checkbox"  name = "schedule_day" value = "화"/> 화 
         			<input type = "checkbox" class = "select_checkbox"  name = "schedule_day" value = "수"/> 수
         			<input type = "checkbox" class = "select_checkbox"  name = "schedule_day" value = "목"/> 목
         			<input type = "checkbox" class = "select_checkbox"  name = "schedule_day" value = "금"/> 금
         			<input type = "checkbox" class = "select_checkbox"  name = "schedule_day" value = "토"/> 토
         		</div>
         		
         		<div class = "select_div kor_font">
			        <label for="schedule_date-select" class="kor_font">Date |  </label>
			        <select id="schedule_date-select" name="schedule_date-select"  onchange = "selectScheduleDate(this)">
					    <option value="">날짜 선택</option>
					</select>
					
					<script>
					    const select2 = document.getElementById("schedule_date-select");
					    
					    for (let i = 1; i <= 31; i++) {
					        let option = document.createElement("option");
					        option.value = i;
					        option.textContent = i;
					        select2.appendChild(option);
					    }
					</script>
			        <label for="schedule_date-select" class="kor_font"> 일 </label>
			        
			        <label id = "schedule_date_selected">&nbsp;</label>
         		</div>
         	</form>
         </div>
		</div>
		
		<div id = "diary">
			<div class = "state_title"> 
				<p class="oswald-title">
		            DIARY !
		         </p>
			</div>
			
			<div class = "diary_table_div">
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
								<textarea readonly id = "diary_contents"  class = "kor_font">
									${diary.d_detail}
								</textarea>
							</td>
						</tr>
					</c:if>
					
					<tr>
						<td>
							<c:if test="${empty diary}">
				         			<input type = "button" value = "WRITE" class = "oswald-menu btn"/>
				         	</c:if>
				         	<c:if test="${not empty diary}">
				         			<input type = "button" value = "MODIFY" class = "oswald-menu btn"/>
									<input type = "button" value = "DELETE"  class = "oswald-menu btn"/>
				         	</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>