<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@include file="../common/mainMenu.jsp"%>
<html>
<head>
   <title>Planus'_'</title>
</head>
<style>
   /* 메인 컨테이너 */
   #accountbook_main {
       display: flex;
       flex-wrap: wrap;
       justify-content: center; /* 중앙 정렬 */
       align-items: flex-start; /* 위쪽 정렬 */
       gap: 30px; /* 요소 간 일정한 간격 유지 */
       margin-top: 20px;
   }
   .td_left {
       text-align:left;
	   vertical-align:middle;
   }
   .td_right {
       text-align:right;
	   vertical-align:middle;
   }
	
	
   /* TOTAL STATE와 MONEYFLOW STATE를 세로로 정렬하는 컨테이너 */
   #total_moneyflow_wrapper {
       display: flex;
       flex-direction: column; /* 세로로 정렬 */
       gap: 30px; /* 요소 간격 */
       width: 40vw; /* 두 요소를 세로로 배치 */
   }

   /* 공통 스타일 */
   #accountbook_calendar,
   #total_state,
   #moneyflow_state,
   #account_state,
   #category_state {
       background-color: #F2F2F2;
       position: relative;
   }

   /* 달력 */
   #accountbook_calendar {
       width: 40vw;
       aspect-ratio: 0.8 / 1;
       z-index:-1;
   }

   /* TOTAL STATE */
   #total_state {
       width: 40vw;
       aspect-ratio: 5 / 1;
       position: relative;
       display: flex; /* flexbox 적용 */
       justify-content: center; /* 가로 중앙 정렬 */
       align-items: center; /* 세로 중앙 정렬 */
   }

   /* MONEYFLOW STATE */
   #moneyflow_state {
       aspect-ratio: 1.02 / 1;
       text-align: left;
       position: relative;
   	   display: flex;
	   flex-direction: column;  /* 세로로 정렬 */
	   justify-content: space-between; /* 상단과 하단에 요소 배치 */
	   height: 100%; /* 자식 요소들이 제대로 배치될 수 있도록 높이를 100%로 설정 */
   }
   .moneyflow_td {
   	   padding-top:7px;
   }
   
   #state_table,
   #account_table {
   	   width: 100%;  /* 테이블이 영역을 다 채우도록 */
   }

	#input_section {
	   flex-shrink: 0; /* 입력창은 크기 조정 안 함 */
	   margin-top: 10px;
	}
	.account_table_div {
	   max-height: 400px; /* 원하는 높이로 조절 */
       overflow-y: auto; /* 세로 스크롤 추가 */
	}
   /* ACCOUNT STATE */
   #account_state {
       width: 40vw;
       aspect-ratio: 1.2 / 1;
       text-align: left;
       position: relative;
   	   display: flex;
	   flex-direction: column;  /* 세로로 정렬 */
	   justify-content: space-between; /* 상단과 하단에 요소 배치 */
	   height: 100%; /* 자식 요소들이 제대로 배치될 수 있도록 높이를 100%로 설정 */
   }

   /* CATEGORY STATE */
   #category_state {
       width: 40vw;
       aspect-ratio: 1.2 / 1;
       text-align: left;
       position: relative;
   	   display: flex;
	   flex-direction: column;  /* 세로로 정렬 */
	   justify-content: space-between; /* 상단과 하단에 요소 배치 */
	   height: 100%; /* 자식 요소들이 제대로 배치될 수 있도록 높이를 100%로 설정 */
   }

   /* 테이블 스타일 */
   #state_table,
   #account_table {
       width: 90%;
       margin-left: 10px;
       margin-top: 30px;
       overflow: auto;
   }
   
   /* 테이블 스타일 */
   #total_table {
       width: 80%;
       margin-top: 20px;
       margin-bottom:10px;
       border-collapse : collapse;
   }
   
   .total_font {
   		font-size: 1.2vw;
	    font-family: "Gowun Dodum", sans-serif;
	    font-weight: 400;
	    font-style: normal;
   }
   
   .font_blue {
   		color:#215F9A;
   }
   .font_red {
   		color:#C00000;
   }
   
   /* Progress Bar */
   .progress-bar {
       width: 100%;
       height: 10px;
       background-color: #949494;
   }

   .progress-bar .progress {
       height: 10px;
       text-align: center;
       background-color: #4F4F4F;
       transition: width 0.3s ease-in-out;
   }
   
   .input-container {
	    width: 100%; /* 입력창 너비 조정 */
	    margin-top: 20px;
	    text-align: left;
	    margin-left: 10px;
	    margin-bottom: 7px;
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
	    width: 20%; /* 입력창 너비 조정 */
	    padding: 7px;
	    font-size: 13px;
	    border: none;
	    background: transparent;
  		border-bottom: 2px solid #ccc;
    	text-align: right; /* 입력값 오른쪽 정렬 */
	}
	
	.input-field_sub:focus {
	    border-color: #ccc;
	    outline: none;
  		border-bottom: spx solid #ccc;
	}
   	#day-select {
   		width: 15%; /* 입력창 너비 조정 */
	    padding: 7px;
	    font-size: 13px;
	    border: none;
    	text-align: center; 
	    background: transparent;
  		border-bottom: 2px solid #ccc;
   	}
   	
   	#category-select {
   		width: 23%; /* 입력창 너비 조정 */
	    padding: 7px;
	    font-size: 13px;
	    border: none;
    	text-align: center; 
	    background: transparent;
  		border-bottom: 2px solid #ccc;
   	}
   	#account-select {
   		width: 23%; /* 입력창 너비 조정 */
	    padding: 7px;
	    font-size: 13px;
	    border: none;
    	text-align: center; 
	    background: transparent;
  		border-bottom: 2px solid #ccc;
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
   		margin-left:20px;
   	}
   	.moneyflow_radio {
   		width:10px;
   		height:10px;
   		accent-color:#FF3B7C;
   	}
   	
   /* 반응형 스타일 (1000px 이하) */
   @media screen and (max-width: 1000px) {
       #accountbook_main {
           flex-direction: column; /* 세로 정렬 */
           align-items: center; /* 중앙 정렬 */
       }

       #total_moneyflow_wrapper {
           flex-direction: column;
           width: 90vw;
       }

       #accountbook_calendar,
       #total_state,
       #moneyflow_state,
       #account_state,
       #category_state {
           width: 90vw; /* 모바일에서는 전체 너비 사용 */
       	   z-index:-1;
       }
       
  	  .total_font {
   		   font-size: 16px;
	       font-family: "Gowun Dodum", sans-serif;
	       font-weight: 400;
	       font-style: normal;
	       vertical-align:middle;
   }
       /* 테이블 스타일 */
       #total_table {
           width: 80%;
           margin-top: 20px;
           margin-bottom:10px;
           border-collapse : collapse;
   }
   
   
}
</style>

<body>
<div id="accountbook_main">
   <!-- 캘린더 -->
   <div id="accountbook_calendar">
      <div>
         <span class="oswald-title">
            3
         </span>
         <span>
            march
         </span>
      </div>
      <p class="kor_font"> 달력 영역 입니다.</p>
   </div>
   
   <!-- 토탈 상태와 머니플로우 상태 세로 정렬 -->
   <div id="total_moneyflow_wrapper">
      <!-- Total State -->
      <div id="total_state">
         <div class="state_title">
            <p class="oswald-title">
               TOTAL STATE !
            </p>
         </div>
         <table id="total_table">
         	<tr class="">
         		<td class="td_left total_table_td_title">
         			<p class="total_font"> <span style="font-size:10px">▶</span> Today </p>
         		</td>
         		<td class="total_table_td td_left">
         			<p class="total_font font_red"> + 700,000 원 </p>
         		</td>
         		<td class="total_table_td td_left">
         			<p class="total_font font_blue"> - 780,000 원 </p>
         		</td>
         	</tr>
         	<tr class="">
         		<td class="td_left total_table_td_title">
         			<p class="total_font"> <span style="font-size:10px">▶</span> This Month </p>
         		</td>
         		<td class="total_table_td td_left">
         			<p class="total_font font_red"> + 1,210,000 원 </p>
         		</td>
         		<td class="total_table_td td_left">
         			<p class="total_font font_blue"> - 800,000 원 </p>
         		</td>
         	</tr>
         	<tr class="">
         		<td class="td_left total_table_td_title">
         			<p class="total_font"> <span style="font-size:10px">▶</span> Budget </p>
         		</td>
         		<td class="total_table_td" colspan= "2">
         			<p class="total_font"> 1,700,000 원 </p>
         		</td>
         	</tr>
         </table>
      </div>
   
      <!-- Moneyflow State -->
      <div id="moneyflow_state">
         <div class="state_title">
            <p class="oswald-title">
               INCOME & EXPENDITURE !
            </p>
         </div>
         <table id="state_table">
            <tr>
               <td class="td_left moneyflow_td" width="33%">
                  <p class="kor_font"> ■ 월급 | 기업은행 </p>
               </td>
               <td class="td_left moneyflow_td" width="30%">
                  <p class="kor_font"> 3월 급여 </p>
               </td>
               <td class="td_right moneyflow_td">
                  <p class="kor_font font_red"> + 3,700,000 원 </p>
               </td>
            </tr>
            <tr>
               <td class="td_left moneyflow_td" width="38%">
                  <p class="kor_font"> ■ 간식 | 신한카드 </p>
               </td>
               <td class="td_left moneyflow_td" width="35%">
                  <p class="kor_font"> 오늘의 간식 </p>
               </td>
               <td class="td_right moneyflow_td">
                  <p class="kor_font font_blue"> - 24,000 원 </p>
               </td>
            </tr>
         </table>
               	      <!-- 입력창 추가 -->
	      <div class="input-container">
	      
	      	<form>
				<div class="input_div">
			        <label for="account-input" class="kor_font">■ </label>
			        <input type="text" id="account-input" class="input-field kor_font" placeholder="수입/지출 등록...">
			        <input class="check_button" type="submit" value="">
			        <input class="delete_button" type="submit" value="">
		      	</div>		      	
		      	<div class="select_div">
			        <label for="category-select" class="kor_font">Category | </label>
					<select id="category-select">
					    <option value="">카테고리 선택</option>
					</select>
					
					<script>
					    const category_sel = document.getElementById("category-select");
					    
					    for (let i = 1; i <= 31; i++) {
					        let option = document.createElement("option");
					        option.value = i;
					        option.textContent = i;
					        category_sel.appendChild(option);
					    }
					</script>
		      	</div>		      	
		      	<div class="select_div">
			        <label for="account-select" class="kor_font">Account | </label>
					<select id="account-select">
					    <option value="">계정 선택</option>
					</select>
					
					<script>
					    const account_sel = document.getElementById("account-select");
					    
					    for (let i = 1; i <= 31; i++) {
					        let option = document.createElement("option");
					        option.value = i;
					        option.textContent = i;
					        account_sel.appendChild(option);
					    }
					</script>
		      	</div>
		      	
		      	<div class="select_div">
			        <label for="money_flow_budget" class="kor_font">Price |  </label>
			        <input type="text" id="money_flow_budget" class="input-field_sub kor_font" placeholder="숫자만 입력" oninput="formatNumber(this)" />
			        <label for="money_flow_budget" class="kor_font">원 | </label>
			        <label class="kor_font">
			        	<input class="moneyflow_radio" type="radio" value="1" name="in_out" checked> 수입
			        </label>
			        <label class="kor_font">
			        	<input class="moneyflow_radio kor_font" type="radio" value="2" name="in_out"> 지출
			        </label>
					<script>
					function formatNumber(input) {
					    let value = input.value.replace(/[^0-9]/g, ""); // 숫자만 남김
					    if (value === "") {
					        input.value = ""; // 빈 값이면 그대로 유지
					        return;
					    }
					
					    // 세 자리마다 콤마 추가
					    value = new Intl.NumberFormat().format(value);
					
					    // 입력창에 반영
					    input.value = value;
					}
					</script>
		      	</div>

	      	</form>

	      </div>
      </div>

   </div>

   <!-- Account State -->
   <div id="account_state">
      <div class="state_title">
         <p class="oswald-title">
            ACCOUNT STATE !
         </p>
      </div>
      <div class="account_table_div">
	      <table id="account_table">
	      	<c:forEach var="a_list" items="${accountList}" varStatus="loop">
		         <tr>
		            <td class="td_left" width="25%">
		               <p class="kor_font"> ■ ${a_list.a_name} </p>
		            </td>
		            <td class="td_left">
		               <p class="kor_font"> 
		               		<fmt:formatNumber value="${a_list.a_state}" pattern="###,###,### 원"/>  /  
		               		<fmt:formatNumber value="${a_list.a_asset}" pattern="###,###,### 원"/> 
		               </p>
		            </td>
		         </tr>
		         <tr>
		            <td></td>
		            <td>
		               <div class="progress-bar">
		                  <div class="progress" id="a_progress_${loop.index}" style="width:0%"></div>
		                  <script>
						    // JavaScript에서 값 가져오기
						    let a_state_${loop.index} = ${a_list.a_state};
						    let a_asset_${loop.index} = ${a_list.a_asset};
						    
						    if(a_asset_${loop.index} == 0) {
						    	progressBar_${loop.index}.style.width = 0 + "%";
						    } else {
							    // 비율 계산
							    let percentage_${loop.index} = (a_state_${loop.index} / a_asset_${loop.index}) * 100;
							    
							    // width 적용
							    let progressBar_${loop.index} = document.getElementById("a_progress_${loop.index}");
							    if(progressBar_${loop.index}){
							    	progressBar_${loop.index}.style.width = percentage_${loop.index} + "%";
							    }
						    }
						
						   </script>
		               </div>
		            </td>
		         </tr>
	      	</c:forEach>
	      </table>
      </div>
      
	      <!-- 입력창 추가 -->
	      <div class="input-container">
	      
	      	<form:form id="account_form" commandName="account" action="insertaccount.accountbook" method="post">
				<div class="input_div">
			        <label for="account-input" class="kor_font">■ </label>
			        <input type="text" id="account-input" class="input-field kor_font" placeholder="계정 등록..." name="a_name">
			        <input class="check_button" type="submit" value="">
			        <input class="delete_button" type="submit" value="">
		      	</div>
		      	
		      	<div class="select_div">
			        <label for="account_budget" class="kor_font">Budget |  </label>
			        <input type="text" id="account_budget" class="input-field_sub kor_font" placeholder="숫자만 입력" oninput="formatNumber(this)"  name="a_asset"/>
			        <label for="budget-input" class="kor_font">원</label>
					<script>
					function formatNumber(input) {
					    let value = input.value.replace(/[^0-9]/g, ""); // 숫자만 남김
					    if (value === "") {
					        input.value = ""; // 빈 값이면 그대로 유지
					        return;
					    }
					
					    // 세 자리마다 콤마 추가
					    value = new Intl.NumberFormat().format(value);
					
					    // 입력창에 반영
					    input.value = value;
					}
				    // 폼 제출 전에 콤마 제거
				    document.getElementById("account_form").addEventListener("submit", function(event) {
				        var assetInput = document.getElementById("account_budget");
				        
				        // 입력값에서 콤마 제거
				        var assetValue = assetInput.value.replace(/,/g, "");
				        
				        // 콤마가 제거된 값을 input의 value에 다시 설정
				        assetInput.value = assetValue;
				    });
					</script>
		      	</div>
		      	<div class="select_div">
			        <label for="day-select" class="kor_font">RepaymentDate |  매월</label>
					<select id="day-select" name="a_repaymentdate">
					    <option value="">날짜 선택</option>
					</select>
					
					<script>
					    const select = document.getElementById("day-select");
					    
					    for (let i = 1; i <= 31; i++) {
					        let option = document.createElement("option");
					        option.value = i;
					        option.textContent = i;
					        select.appendChild(option);
					    }
					</script>
			        <label for="day-select" class="kor_font"> 일 </label>
		      	</div>
	      	</form:form>

	      </div>
   </div>

   <!-- Category State -->
   <div id="category_state">
      <div class="state_title">
         <p class="oswald-title">
            CATEGORY STATE !
         </p>
      </div>
      <table id="state_table">
         <tr>
            <td class="td_left" width="25%">
               <p class="kor_font"> ■ 식비 </p>
            </td>
            <td class="td_left">
               <p class="kor_font"> 36,000 원  /  100,000 원 </p>
            </td>
         </tr>
         <tr>
            <td></td>
            <td>
               <div class="progress-bar">
                  <div class="progress" style="width:36%"></div>
               </div>
            </td>
         </tr>
         <tr>
            <td class="td_left" width="25%">
               <p class="kor_font"> ■ 쇼핑 </p>
            </td>
            <td class="td_left">
               <p class="kor_font"> 40,000 원  /  50,000 원 </p>
            </td>
         </tr>
         <tr>
            <td></td>
            <td>
               <div class="progress-bar">
                  <div class="progress" style="width:80%"></div>
               </div>
            </td>
         </tr>
      </table>
      	      <!-- 입력창 추가 -->
	      <div class="input-container">
	      
	      	<form>
				<div class="input_div">
			        <label for="account-input" class="kor_font">■ </label>
			        <input type="text" id="account-input" class="input-field kor_font" placeholder="카테고리 등록...">
			        <input class="check_button" type="submit" value="">
			        <input class="delete_button" type="submit" value="">
		      	</div>
		      	
		      	<div  class="select_div">
			        <label for="budget-input" class="kor_font">Budget |  </label>
			        <input type="text" id="budget-input" class="input-field_sub kor_font" placeholder="숫자만 입력" oninput="formatNumber(this)" />
			        <label for="budget-input" class="kor_font">원</label>
					<script>
					function formatNumber(input) {
					    let value = input.value.replace(/[^0-9]/g, ""); // 숫자만 남김
					    if (value === "") {
					        input.value = ""; // 빈 값이면 그대로 유지
					        return;
					    }
					
					    // 세 자리마다 콤마 추가
					    value = new Intl.NumberFormat().format(value);
					
					    // 입력창에 반영
					    input.value = value;
					}
					</script>
		      	</div>
	      	</form>

	      </div>
   </div>
</div>
</body>
</html>