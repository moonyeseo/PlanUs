<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/mainMenu.jsp"%>

<!--

	[ CSS 수정해야하는 사항 25.04.03]
	
- DB에서 데이터 가져올 때 글자수를 가져와서 글자수가 10 이상이면 폰트 크기 줄이기.
- 화면을 줄이면 왕관, 돋보기img의 자리가 없어서 밑으로 내려옴. => 화면을 줄이면 글자 크기를 줄이고 동시에 img 파일도 크기를 줄여야 할 듯.
- 현재 ~을 클릭했는지 알 수 있도록 배경이나 글자색을 줄 것.
- MyClub에서 <li>태그안에 글이 너무 길어지면 div영역이 이상해짐.
- '소개', '일정', '게시판', '투표', '더치페이', '관리'는 'clubCommon'공통(include) 
각 'clubIntroduce', 'clubSchedule', 'clubBoard', 'clubVote', 'clubDutch_Pay', 'clubManagement'로

 -->
 
 
<style>
#menu_club {
	color: #FF3B7C;
}

/* 전체 레이아웃 컨테이너 */
.container {
	margin: 0 auto;
	width: 90vw;
	display: flex;
	/*	height: 100vh;  화면 전체 높이 */
	margin-top: 60px;
}

/* 왼쪽 사이드바 (MY CLUB, SEARCH CLUB) */
.left-sidebar {
	width: 300px;
	background-color: white;
	padding: 0px 20px 0px 20px;
	margin-top: -30px;
	border-right: 2px solid white;
	z-index: 8;
}

.myclub, .searchclub {
	overflow: auto;
	height: 230px;
}

/* 왼쪽 사이드바 (MY CLUB, SEARCH CLUB) 제목*/
.left-sidebar h3 {
	font-size: 22px;
	color: #ff4081;
	margin-bottom: -15px;
	margin-left: 15px;
	position: relative;
	z-index: 10; /* 제목을 배경보다 위로 오게 설정 */
	display: inline-block; /* 배경이 텍스트 크기만큼만 차지하도록 설정 */
}

.club-list {
	list-style: none;
	font-size: 18px;
}

.club-list li {
	padding: 0px 0px 0px 5px;
	margin-top: 13px;
	border-radius: 5px;
	cursor: pointer;
	z-index: 8;
}

.club-list li:hover, .club-list li.active {
	color: #FF4081;
}

.search-box {
	/* position: fixed; */
	width: 70%;
	margin: 0 auto;
	height: 25px;
	padding: 5px;
	background: #F2F2F2;
	border: 2px solid #ff4081;
	border-radius: 2px;
	margin-top: 20px;
}

.search-box input {
	width: 75%;
	height: 100%;
	background: #F2F2F2;
	border: none;
	outline: none;
	float: left;
}

.search-box button {
	/* position: fixed; */
	border: none;
	cursor: pointer;
	float: right;
}

/* 메인 컨텐츠 */
.main-content {
	display: flex;
	flex-grow: 1;
	margin-top: 9px;
}

/* 네비게이션 사이드바 (소개, 일정, 게시판 등) */
.nav-sidebar {
	width: 160px;
	height: 500px;
	color: white;
	z-index: 8;
	background-color: #333;
	text-align: left;
}

.nav-sidebar a {
	cursor: pointer;
	color: white;
	background-color: #333;
	text-align: left;
	line-height: 3.5;
}

/* 네비게이션 버튼 영역 */
.mcb-div {
	width: 160px;
	height: 60px;
	/* height: 45px; */
	
}

.mcb-div:hover, .mcb-div:active {
	background-color: #ff4081;
	cursor: pointer;
	pointer-events: auto;
}

/* div 안의 모든 요소도 배경색과 커서를 동일하게 적용 */
.mcb-div:hover *, .mcb-div:active * {
	background-color: inherit;
	cursor: pointer;
}

.main-content-a {
	font-size: 18px;
	line-height: 2.5;
	pointer-events: auto;
	margin-left: 10px;
}

/* 메인 컨텐츠 영역 */
.content {
	height: 500px;
	flex-grow: 1;
	padding: 20px 40px -20px 20px;
	background-color: #F2F2F2;
	border-left: 2px solid #ccc;
	color: #333;
}

.content h1 {
	text-align: center;
	font-size: 22px;
	margin-bottom: 50px; /* 제목과 본문 사이 */
}

.content p {
	text-align: center;
	font-size: 14px;
	margin-bottom: -15px; /* 글자간격 */
}

li {
	list-style-type: none;
	margin-top: 35px;
	text-align: left;
}

.user_img_position {
	position: relative;
	top: 3px;
	left: -10px;
	width: 20px;
	height: 20px;
}

.crown_img_position {
	position: relative;
	top: 5px;
	left: -2px;
	z-index: 0;
}

.search_img_position{
	position: relative;
	top: -2px;
	left: 5px;
}

.introduce_img_div {
	display: flex;
	justify-content: center; /* 가로 가운데 정렬 */
	align-items: center; /* 필요하면 세로 가운데 정렬 */
	margin-top: 30px;
}
</style>

<body>
	<!-- 전체 레이아웃을 감싸는 컨테이너 -->
	<div class="container">
		<!-- 왼쪽 사이드바 (MY CLUB, SEARCH CLUB) -->
		<div class="left-sidebar kor_font">

			<h3 class="oswald-title">MY CLUB!</h3>
			<div class="myclub" style="background: #F2F2F2;">
				<ul class="club-list kor_font">
					<li>
						<a href="#"><img class="user_img_position" src="resources/image/user_img.png" />우형예슬예서희원우형예슬예서희원</a>
					</li>
					<li>
						<a href="#"><img class="user_img_position" src="resources/image/user_img.png" />우형예슬예서희원</a> 
						<img class="crown_img_position" src="resources/image/crown.png" />
					</li>
					<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />마포구 맛따라</a></li>
					<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />근엄한 취준생 모임</a></li>
					<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />과메기 먹방 모임</a></li>
					<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />굽네피치세트 모임</a></li>
					<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />연신내 먹방</a></li>
					<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />신촌 먹방</a></li>
				</ul>
			</div>

			<h3 class="oswald-title">SEARCH CLUB!</h3>
			<div class="searchclub" style="background: #F2F2F2;">

				<div class="search-box" style="text-align: center;">
					<input type="text" /><button><img class="search_img_position" src='resources/image/search.png'/></button>
				</div>
				
				<!-- <button>🔍</button> -->
				
				<ul class="club-list kor_font">
					<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />우형예슬예서희원우형예슬예서희원</a></li>
					<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />우형예슬예서희원</a>
							<img class="crown_img_position" src="resources/image/crown.png" /></li>
					<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />마포구 맛따라</a></li>
					<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />근엄한 취준생 모임</a></li>
							<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />과메기 먹방 모임</a></li>
							<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />굽네피치세트 모임</a></li>
							<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />연신내 먹방</a></li>
							<li><a href="#"><img class="user_img_position"
							src="resources/image/user_img.png" />신촌 먹방</a></li>
				</ul>

			</div>

		</div>

		<!-- 메인 컨텐츠 -->
		<div class="main-content kor_font">
		
			<div class="nav-sidebar">
			
				<div id = "menu_introduce" class="mcb-div" onclick="window.location.href='go.groups';">
					<a id = "menu_introduce" href="go.groups" class="main-content-a">소개</a>
				</div>
				
				<div style="height:10px; background-color:#333;"></div>
				
				<div id = "menu_schedule" class="mcb-div" onclick="window.location.href='schedule.groups';">
					<a id = "menu_schedule" href="schedule.groups" class="main-content-a">일정</a>
				</div>
				
				<div style="height:10px; background-color:#333;"></div>
				
				<div id = "menu_board" class="mcb-div" onclick="window.location.href='board.groups';">
					<a id = "menu_board" href="board.groups" class="main-content-a">게시판</a>
				</div>
				
				<div style="height:10px; background-color:#333;"></div>
				
				<div id = "menu_vote" class="mcb-div" onclick="window.location.href='vote.groups';">
					<a id = "menu_vote" href="vote.groups" class="main-content-a">투표</a>
				</div>
				
				<div style="height:10px; background-color:#333;"></div>
				
				<div id = "menu_dutch_pay" class="mcb-div" onclick="window.location.href='dutchPay.groups';">
					<a id = "menu_dutch_pay" href="dutchPay.groups" class="main-content-a">더치페이</a>
				</div>
				
				<br><br><br><br><br>
				
				<div id = "menu_management" class="mcb-div" onclick="window.location.href='management.groups';">
					<a id = "menu_management" href="management.groups" class="main-content-a">관리</a>
				</div>
			</div>
