<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/mainMenu.jsp"%>
<style>

.input-field {
     /* 입력창 너비 조정 */
     /* 입력창 높이 고정 */
    padding: 5px;
    position: relative;
    font-size: 16px;
    border: 2px solid #FF3B7C; /* 네모 모양을 위해 border 추가 */
    z-index:1;
    border-radius: 0; /* 네모 모양으로 변경 */
    width: 200px;
   
}
.input-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
.name_input,.nick_input,.birth_input,.account_input,.phone_input,.custom-dropdown {
			display: flex;
            align-items: center;
            margin-bottom: 20px; 
}
.name_input{
margin-top:50px;
}
.bank_input{
display: flex;

            align-items: center;
            
}
.nick_input label {
            width: 80px; /* 동일한 너비 설정 */
            text-align: left;
            margin-right: 45px; /* ← 여기서 조절 가능 */
        }
.name_input label {
            width: 80px; /* 동일한 너비 설정 */
            text-align: left;
            margin-right: 45px; /* ← 여기서 조절 가능 */
        }
        
.birth_input label {
            width: 80px; /* 동일한 너비 설정 */
            text-align: left;
            margin-right: 45px; /* ← 여기서 조절 가능 */
        }
.bank_input label {
            width: 80px; /* 동일한 너비 설정 */
            text-align: left;
            margin-right: 45px; /* ← 여기서 조절 가능 */
            padding-right: 30px;
        }
.account_input label {
            width: 80px; /* 동일한 너비 설정 */
            text-align: left;
            margin-right: 45px; /* ← 여기서 조절 가능 */
        }
.phone_input label {
            width: 80px; /* 동일한 너비 설정 */
            text-align: left;
            margin-right: 45px; /* ← 여기서 조절 가능 */
        }  
.bank_input label {
            width: 80px; /* 동일한 너비 설정 */
            text-align: left;
            margin-right: 15px; /* ← 여기서 조절 가능 */
        }      
.state_title {
	z-index:0;
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

.dropdown-toggle {
            position: absolute;
            right: 10px;
            width: 20px;
            height: 20px;
            background-color: transparent;
            border: none;
            cursor: pointer;
            padding-right: 30px;
            
            z-index:2;
        }

        .dropdown-toggle::after {
            content: '\25BC'; /* 유니코드 역삼각형 */
            font-size: 16px;
            color: #FF3B7C;
           
        }

        /* 드롭다운 전체 박스 */
        .custom-dropdown {
            position: relative;
            
        }

        /* 옵션 목록 */
               .dropdown-menu {
            position: absolute;
            top: 100%; /* 상단 위치 수정 - 부모 요소 바로 아래에 위치하도록 */
            left: 125px; /* 라벨 너비(80px) + 마진(45px) 만큼 설정 */
            width: 200px; /* input-field와 같은 너비로 설정 */
            background-color: white;
            border: 1px solid #FF3B7C;
            display: none; /* 기본적으로 숨김 */
            list-style: none;
            padding: 0;
            margin: 0;
            border-radius: 5px;
            max-height: 150px;
            overflow-y: auto;
            z-index:3;
              
        }

        /* 개별 옵션 스타일 */
        .dropdown-menu li {
            padding: 10px;
            cursor: pointer;
        }

        /* 옵션에 마우스 오버 효과 */
        .dropdown-menu li:hover {
            background-color: #FF3B7C;
            color: white;
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
            <form:form id="join2_form" commandName="join2" action="insertUser.users" method="post">
             <input type="hidden" name="u_ID" value="${u_ID}" />
             <input type="hidden" name="u_PWD" value="${u_PWD}" />
             <div class="name_input">
                
                    <label for="login-input" class="oswald-title">NAME</label>
                    <input type="text" id="name-input" class="input-field kor_font" placeholder="NAME" name="u_NAME">
                
            </div>
            <div class="nick_input">
                
                    <label for="nick-input" class="oswald-title">NICKNAME</label>
                    <input type="text" id="nick-input" class="input-field kor_font" placeholder="NICKNAME" name="u_NICK">
                
            </div>
            <div class="birth_input">
                
                    <label for="pw-input" class="oswald-title">BIRTH</label>
                    <input type="date" id="pw-input"max="2025-12-31" min="1900-01-01" value="" class="input-field kor_font" name="u_BIRTH">
                
            </div>
            <div class="phone_input">
                
                    <label for="phone-input" class="oswald-title">PHONE</label>
                    <input type="text" id="phone-input" class="input-field kor_font" placeholder="-없이 입력" name="u_PHONE">
                
            </div>
            <div class="custom-dropdown">
			    <div class="bank_input" >
			        <label for="bank-input" class="oswald-title">BANK</label>            
			        <input type="text" id="bank-input" class="input-field kor_font" readOnly name="b_NAME"> <!-- readOnly로 수정하여 사용자가 직접 입력하지 않도록 설정 -->
			        <button type="button" class="dropdown-toggle" onclick="toggleDropdown(event)"></button>
			    </div>
			    <ul class="dropdown-menu">
			        <li onclick="selectOption('국민은행')">국민은행</li>
			        <li onclick="selectOption('우리은행')">우리은행</li>
			        <li onclick="selectOption('하나은행')">하나은행</li>
			        <li onclick="selectOption('기업은행')">기업은행</li>
			    </ul>
			
            </div>
            <div class="account_input">
                
                    <label for="pw-input" class="oswald-title">ACCOUNT</label>
                    <input type="text" id="account-input" class="input-field kor_font" placeholder="-없이 입력" name="u_ACN">
                
            </div>     
            	<div class = "login_btn">            
            	<input type = "submit" value = "JOIN"  class = "oswald-menu btn"/>
         		</div>                     
            </form:form>
              
        </div>
    </div>
    <script>
        function toggleDropdown(event) {
            event.stopPropagation(); // 이벤트 버블링 방지
            const menu = document.querySelector(".dropdown-menu");
            menu.style.display = (menu.style.display === "block") ? "none" : "block";
        }

        function selectOption(value) {
            document.getElementById("bank-input").value = value;
            document.querySelector(".dropdown-menu").style.display = "none"; // 선택 후 드롭다운 닫기
        }

        document.addEventListener("click", function(event) {
            const dropdown = document.querySelector(".custom-dropdown");
            if (!dropdown.contains(event.target)) {
                document.querySelector(".dropdown-menu").style.display = "none";
            }
        });
        </script>

</body>
</html>