<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/mainMenu.jsp"%>
<style>

.input-field {
    width: 80%; /* 입력창 너비 조정 */
    height: 40px; /* 입력창 높이 고정 */
    padding: 5px;
    font-size: 16px;
    border: 2px solid #FF3B7C; /* 네모 모양을 위해 border 추가 */
    background: transparent;
    border-radius: 0; /* 네모 모양으로 변경 */
}

.login_input,
.pw_input {
	width:40%;
    margin-bottom: 15px; /* 입력 필드 사이의 간격 추가 */
}
#Login {
    background-color: #F2F2F2;
    width: 45vw;
    aspect-ratio: 1.05/1;
    margin: auto;
    margin-top: 40px;
    position: relative;
    display: flex;
    flex-direction: column; /* 세로로 배치 */
    justify-content: flex-start; /* 위에서 아래로 정렬 */
    align-items: center; /* 중앙 정렬 */
}
      
       @media screen and (max-width:1000px){
       #Login {
         background-color : #F2F2F2;
         width : 80vw;
         aspect-ratio:1.05/1;
         margin:auto;
         margin-top:40px;
         text-align:left;
         position:relative;
         display: flex;
         justify-content: flex-start;
         z-index:-1;
      }
      }
      

</style>
<html>
<head>
   <title>Login</title>
</head>
<body>
	<div id = "wrap">
		<div id = "Login">
			<div class = "state_title"> 
				<p class="oswald-title">
		            LOGIN !
		         </p>
		    
		    </div>
		    <div class="login_input">
			        <label for="login-input" class="oswald-title">ID </label>
			        <input type="text" id="login-input" class="input-field oswald-title" placeholder="ID">
			        
		    </div>
		    <div class="pw_input">
		      		<label for="pw-input" class="oswald-title">PW </label>
			        <input type="text" id="pw-input" class="input-field oswald-title" placeholder="PASSWORD">
			</div>
		</div>
	</div>
</body>
</html>