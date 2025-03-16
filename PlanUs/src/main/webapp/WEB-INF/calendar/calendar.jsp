<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/mainMenu.jsp"%>

<style>
	#menu_calendar{
		color : #FF3B7C;
	}
	#calendar_main{
	   display: flex;
       justify-content: center; /* 중앙 정렬 */
       align-items: flex-start; /* 위쪽 정렬 */
       flex-wrap: wrap; /* 화면이 작을 때 자동 줄바*/
		
	}
	#calendar{
         width : 90vw;
         height : 900px;
         aspect-ratio:1.2/1;
         margin:20px;
	} 
	#month{
		width : 100%;
		height : 70px;
		margin : auto;
		text-align : center;
		font-size: 20px;
		background-color: white;
	}
	#number{
		font-size: 30px;
	}
	.arrow_btn{
		color : #FF3B7C;
	}
	#day{
		width : 100%;
		height : 830px;
		margin : auto;
		text-align : center;
		background-color : #F2F2F2;
	}
	#calendar_table{
		width : 100%;
		height : 100%;
		table-layout: fixed;
		border : 1px solid white;
		border-collapse: collapse;
	}
	#calendar_table td{
		text-align : left;
		vertical-align: top;
	}
	.cal_top{
		color : white;
		background-color: #363636;
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
		date = new Date(); // 현재 날짜(로컬 기준)
		utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
		kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
		today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
		
		var year = <%=request.getParameter("year")%>
		var month = <%=request.getParameter("month")%>
		var day = <%=request.getParameter("day")%>
		
		var selectDate = new Date(year, month-1, day);
		
		calendarInit(selectDate);
	})
	
	function getDate(date){
		
	}
</script>

<div id = "calendar_main">
	<table id = "calendar">
		<tr>
			<td>
				<div id = "month" class = "oswald-menu">
					<span class = "arrow_btn">◀</span>&emsp;&emsp;&emsp;
					<span id = "number">3</span> MARCH&emsp;&emsp;&emsp;
					<span class = "arrow_btn">▶</span>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div id = "day">
					<table id = "calendar_table">
						<tr class = "oswald-menu cal_top">
							<th>SUN</th>
							<th>MON</th>
							<th>TUE</th>
							<th>WED</th>
							<th>THU</th>
							<th>FRI</th>
							<th>SAT</th>
						</tr>
						<tr class = "kor_font">
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
							<td>6</td>
							<td>7</td>
						</tr>
						<tr  class = "kor_font">
							<td>8</td>
							<td>9</td>
							<td>10</td>
							<td>11</td>
							<td>12</td>
							<td>13</td>
							<td>14</td>
						</tr>
						<tr  class = "kor_font">
							<td>15</td>
							<td>16</td>
							<td>17</td>
							<td>18</td>
							<td>19</td>
							<td>20</td>
							<td>21</td>
						</tr>
						<tr  class = "kor_font">
							<td>22</td>
							<td>23</td>
							<td>24</td>
							<td>25</td>
							<td>26</td>
							<td>27</td>
							<td>28</td>
						</tr>
						<tr  class = "kor_font">
							<td>29</td>
							<td>30</td>
							<td>31</td>
							<td>32</td>
							<td>33</td>
							<td>34</td>
							<td>35</td>
						</tr>
						<tr  class = "kor_font">
							<td>36</td>
							<td>37</td>
							<td>38</td>
							<td>39</td>
							<td>40</td>
							<td>41</td>
							<td>42</td>
						</tr>
					</table>
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