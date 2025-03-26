<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Oswald:wght@200..700&display=swap" rel="stylesheet">
<html>
<head>
	<title>Planus'_'</title>
</head>
<style>
	html,
	body {
		width:100%;
		height:100%;
		margin: 0;
	}
	a {
  		text-decoration-line: none;
  		color:#363636;
	}
	a:hover {
		color:#FF3B7C;
	}
	a:active {
		color:#FF3B7C;
	}
	.oswald-menu {
	  font-family: "Oswald", sans-serif;
	  font-optical-sizing: auto;
	  font-weight: 500;
	  font-style: normal;
	}
	.kor_font {
	  font-family: "Gowun Dodum", sans-serif;
	  font-weight: 400;
	  font-style: normal;
      font-size:14px;
	}
	#main_menu {
	 	height : 110px;
		display : inline-block;
		width:100%;
	}
	#logo {
		display : inline-block;
		width:29%;
	 	height : 100%;
	 	text-align : center;
	}
	#menu_bar {
		display : inline-block;
		width:70%;
	 	height : 100%;
	 	z-index:0;
	}
	#menu_table {
		width:100%;
	 	height : 90%;
	 	margin-top:0;
	 	/*table-layout:fixed;*/
	}
	#logo_img {
		width:250px;
	 	height : 100px;
	}
	#user_img {
		width:30px;
	 	height : 30px;
	}
	td {
		vertical-align:middle;
		text-align:center;
	}
	.menu_list {
		font-size:25px;
	}
	.menu-trigger {
		display:none;
	}
	 .state_title {
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
	
	
	/*화면크기가 1000px보다 클 때 */
	@media screen and (min-width:1000px){
		.hamberger-li{
			display:none;
		}
	}

	/*화면크기가 1000px보다 작을 때 */
	@media screen and (max-width:1000px){
		#hamberger {
			text-align:right;
			align-self: flex-end;
		}
		#menu_bar {
			display : inline-block;
			width:30%;
		 	height : 90%;
		 	margin-right:0;
		 	float:right;
		 	z-index:7;
		 	margin:0;
		}
		#menu_table {
			width:100%;
		 	height : 100%;
		 	position :relative;	
		 	z-index:1;
		 	margin:0;
		}
		.menu_list {
			display:none;
		}
		.menu-trigger,
		.menu-trigger span {
		  display: inline-block;
		  transition: all .4s;
		  box-sizing: border-box;
		}
		
		.menu-trigger {
		  position: relative;
		  right: 0;
		  width: 30px;
		  height: 24px;
		}
		
		.menu-trigger span {
		  position: absolute;
		  right: 0;
		  width: 100%;
		  height: 4px;
		  background-color: #FF3B7C;
		  border-radius: 4px;
		  margin-left:auto;
		}
		
		.menu-trigger span:nth-of-type(1) {
		  top: 0;
		}
		
		.menu-trigger span:nth-of-type(2) {
		  top: 10px;
		}
		
		.menu-trigger span:nth-of-type(3) {
		  bottom: 0;
		}
		/* type-01 */
		/* 중앙 라인이 고정된 자리에서 투명하게 사라지며 상하라인 회전하며 엑스자 만들기 */
		.menu-trigger.active span:nth-of-type(1) {
		  -webkit-transform: translateY (10px) rotate (-45deg);
		  transform: translateY(10px) rotate(-45deg);
		}
		
		.menu-trigger.active span:nth-of-type(2) {
		  opacity: 0;
		}
		
		.menu-trigger.active span:nth-of-type(3) {
		  -webkit-transform: translateY(-10px) rotate(45deg);
		  transform: translateY(-10px) rotate(45deg);
		}
		#toggle_menu{
			display:inline-block;
			background-color:#F2F2F2;
			height:100vh;
			width:200px;	
			position : absolute;	
			right:-50%;
			z-index:0;
			
		}
		#toggle_list{
			margin-top:130px;						
		}
		.hamberger-li{
			list-style-type:none;
			margin-top:35px;
			text-align:left;	
		}
		
	}

</style>

<script type="text/javascript" src="resources/js/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
  $(document).ready(function () {
	// 달력
	date = new Date(); // 현재 날짜(로컬 기준)
	utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
	kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
	today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
		
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var day = today.getDate();
	
	$(".go_calendar").click(function(){
		location.href = "go.calendar?year=" + year + "&month=" + month + "&day=" + day;
	});
	  
    // 햄버거 버튼 클릭 이벤트 
    var burger = $('.menu-trigger');

    burger.each(function (index) {
      var $this = $(this);

      $this.on('click', function (e) {
        e.preventDefault();
        $(this).toggleClass('active');
      });
    });
    var h = 0;

    $(burger).on("click", function () {
      if (h == 0) {
          $('#toggle_menu').animate({
             right: '0',
             opacity: 1
          }, 500);
          $(this).addClass('active');
          h++;          
       } else if (h == 1) {
          $('#toggle_menu').animate({
             right: '-20%',
             opacity: 0
          }, 500);
          $(this).removeClass('active');
          h--;
       }
         $(window).scroll(function() {
          sct = $(window).scrollTop();
        if(sct>30){
          $('#toggle_menu').css({
            opacity: 0,
            right :'-20%'
          }, 500);
          $(burger).removeClass('active');
          h=0;
        } 
      });
  });
});
</script>

<body>
<div id = "main_menu">
	<div id="logo">
		<a href = "go.home">
			<img id="logo_img" src = "resources/image/logo.jpg" alt="image"/>
		</a>
	</div>

	<div id = "menu_bar">
		<table id="menu_table">
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
					<table style="float:right">
						<!--  <tr>
							  <td>
									<img id="user_img" src = "resources/image/user_img.png" alt="image"/>
							</td>
							<td>
								<a href = "" class="oswald-menu">
									seul222
								</a>
							</td>
						</tr>
						-->
						<tr>
							  <td>
								<a href = "login.users" class="oswald-menu">
									Login
								</a>
								|
							</td>
							<td>
								<a href = "join.users" class="oswald-menu">
									Join
								</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<a id = "menu_calendar" class = "menu_list oswald-menu go_calendar" href = "javascript:void(0);">
						CALENDAR
					</a>
				</td>
				<td>
					<a class = "menu_list oswald-menu" href = "go.accountbook">
						ACCOUNTBOOK
					</a>
				</td>
				<td>
					<a id = "menu_club" class = "menu_list oswald-menu" href = "go.groups">
						CLUB
					</a>
				</td>
				<td>
					<a class = "menu_list oswald-menu" href = "">
						NOTICE
					</a>
				</td>
				<td>
					<div id="hamberger">
						<a class="menu-trigger" href="#">
						  <span></span>
						  <span></span>
						  <span></span>
						</a>
					</div>
				
				</td>
			</tr>
		</table>

	</div>
	<div id="toggle_menu">
		<ul id="toggle_list">
			<li class="hamberger-li">
				<a class = "oswald-menu go_calendar"  href = "javascript:void(0);">
					CALENDAR
				</a>
			</li>
			<li class="hamberger-li">
				<a class = "oswald-menu" href = "go.accountbook">
					ACCOUNTBOOK
				</a>
			</li>
			<li class="hamberger-li">
				<a class = "oswald-menu" href = "go.groups">
					CLUB
				</a>
			</li>
			<li class="hamberger-li">
				<a class = "oswald-menu" href = "">
					NOTICE
				</a>
			</li>
		</ul>
	</div>
</div>

</body>
</html>
