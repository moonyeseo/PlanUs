<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/mainMenu.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<style>

.input-field {
     /* 입력창 너비 조정 */
     /* 입력창 높이 고정 */
    padding: 5px;
    font-size: 16px;
    border: 2px solid #FF3B7C; /* 네모 모양을 위해 border 추가 */
    z-index:1;
    border-radius: 0; /* 네모 모양으로 변경 */
    width: 200px;
}
.input-group {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
.login_input,.pw_input {
			display: flex;
            align-items: center;
            margin-bottom: 30px; 
}
.login_input{
margin-top:50px;
}
.login_btn{
       text-align:center
       
   }
   .btn{
      border : none;
      background-color : #FF3B7C;
      color : white;
      margin-left : 7px;
      width : 80px;
      height : 35px;
      font-size : 17px;
      cursor:pointer;
   }
   .check_btn{
       text-align:center
       
   }
   .btn{
      border : none;
      background-color : #FF3B7C;
      color : white;
      margin-left : 7px;
      width : 80px;
      height : 35px;
      font-size : 17px;
      cursor:pointer;
   }
.login_input label {
            width: 50px; /* 동일한 너비 설정 */
            text-align: left;
            margin-right: 10px; /* ← 여기서 조절 가능 */
        }
.pw_input label {
            width: 50px; /* 동일한 너비 설정 */
            text-align: left;
            margin-right: 10px; /* ← 여기서 조절 가능 */
        }
        
.auth-links {
            display: flex;
            justify-content: center;
            gap: 10px; /* 로그인과 회원가입 사이 간격 */
            margin-top: 10px;
        }
.state_title {
	z-index:0;
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
    <div id="wrap">
        <div id="Login">
            <div class="state_title">
                <p class="oswald-title">LOGIN !</p>
            </div>
            <form:form id="join_form" commandName="join" action="joinDetail.users" method="post">
             	<div class="login_input">
                
                    <label for="login-input" class="oswald-title">ID</label>
                    <input type="text" id="login-input" class="input-field kor_font" placeholder="ID" name="u_ID" >
                	<!-- <div class = "check_btn">
            
            		<input type = "button" value = "중복 체크"  class = "oswald-menu btn kor_font" onClick="location.href='joinDetail.users'"/>
         			</div>-->
            	</div>
            	<div class="pw_input">
               
                    <label for="pw-input" class="oswald-title">PW</label>
                    <input type="password" id="pw-input" class="input-field kor_font" placeholder="PASSWORD" name="u_PWD">
               
            	</div>
            	<div class = "login_btn">
            
            		<input type = "submit" value = "NEXT"  class = "oswald-menu btn"/>
         		</div>
         
            </form:form>
            
        </div>
    </div>
</body>
</html>