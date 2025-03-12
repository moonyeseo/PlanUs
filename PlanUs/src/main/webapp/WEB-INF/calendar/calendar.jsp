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
         height : 700px;
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
		height : 630px;
		margin : auto;
		text-align : center;
		background-color : #F2F2F2;
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
					<span class = "kor_font">happy 달력 영역</span>
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