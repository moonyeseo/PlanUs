<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/mainMenu.jsp"%>

<style>
/* 전체 레이아웃 컨테이너 */
.container {
	display: flex;
/*	height: 100vh;  화면 전체 높이 */
	margin-top: 20px;
}

/* 왼쪽 사이드바 (MY CLUB, SEARCH CLUB) */
.left-sidebar {
	width: 30%;
	background-color: white;
	padding: 0px 20px 0px 20px;
	margin-top: -30px;
	border-right: 2px solid white;
	z-index: 8;
}

.myclub, .searchclub {
	overflow: auto;
	height: 40%;
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

.search-box input {
	width:60%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-top: -10px;
}

.search-box button {
	background-color: #ff4081;
	border: none;
	color: white;
	cursor: pointer;
	border-radius: 5px;
}

/* 메인 컨텐츠 */
.main-content {
	display: flex;
	flex-grow: 1;
}

/* 네비게이션 사이드바 (소개, 일정, 게시판 등) */
.nav-sidebar {
	width: 25vh;
	height: 84vh; 
	color: white;
	z-index: 8;
	background-color: #333;
}

.nav-sidebar ul {
	list-style: none;
}

.nav-sidebar ul li {
	padding: 5px;
	cursor: pointer;
	transition: 0.3s;
}

.nav-sidebar ul li:hover, .nav-sidebar ul li.active {
	background-color: #ff4081;
}

/* 메인 컨텐츠 영역 */
.content {
	height: 84vh;
	flex-grow: 1;
	padding: 20px 40px -20px 20px;
	background-color: #F2F2F2;
	border-left: 2px solid #ccc;
}

.content h1 {
	text-align: center;
	font-size: 22px;
	color: #333;
	margin-bottom: 50px;	/* 제목과 본문 사이 */
}

.content p {
	text-align: center;
	font-size: 14px;
	color: #666;
	margin-bottom: -15px; /* 글자간격 */
}
</style>

<body>
	<!-- 전체 레이아웃을 감싸는 컨테이너 -->
	<div class="container">
		<!-- 왼쪽 사이드바 (MY CLUB, SEARCH CLUB) -->
		<div class="left-sidebar oswald-menu">

			<h3>MY CLUB!</h3>
			<div class="myclub" style="background: #F2F2F2;">
				<ul class="club-list kor_font">
					<li>우형예술예서회원</li>
					<li>마포구 맛따라</li>
					<li>근엄한 취준생 모임</li>
					<li>근엄한 취준생 모임</li>
					<li>근엄한 취준생 모임</li>
					<li>근엄한 취준생 모임</li>
					<li>근엄한 취준생 모임</li>
					<li>근엄한 취준생 모임</li>
					<li>근엄한 취준생 모임</li>
				</ul>
			</div>

			<h3>SEARCH CLUB!</h3>
			<div class="searchclub" style="background: #F2F2F2;">
				<div class="search-box" style="text-align:center;"><br>
					<input type="text" placeholder="검색"/>
					<button>🔍</button>
					<ul class="club-list kor_font">
						<li>우형예술예서회원</li>
						<li>마포구 맛따라</li>
						<li>근엄한 취준생 모임</li>
						<li>근엄한 취준생 모임</li>
					</ul>
				</div>
			</div>

		</div>

		<!-- 메인 컨텐츠 -->
		<div class="main-content kor_font">
			<!-- 네비게이션 사이드바 (소개, 일정, 게시판 등) -->
			<div class="nav-sidebar ">
				<ul>
					<li class="active">소개</li>
					<li>일정</li>
					<li>게시판</li>
					<li>투표</li>
					<li>더치페이</li>
					<li>관리</li>
				</ul>
			</div>

			<!-- 실제 컨텐츠가 표시되는 영역 -->
			<div class="content">
				<h1>우형예술예서회원</h1>
				<p>★우형예술예서회원★</p>
				<p>안녕하세요~ 모임지기 슬이입니다! ㅎㅎ</p>
				<br>
				<p>저희 모임은 웹페이지 제작! 앱 개발! 디자인까지~ ALL IN ONE!</p>
				<br>
				<p>가입 버튼을 눌러 참여해주세요! (자기소개 ‘필수’입니다!)</p>
				<p>- 리더 SEUL222</p>
			</div>

		</div>
	</div>
</body>