<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	/************* WRITE DIARY ***************/
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
		width : 90%;
		height : 230px;
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
		cursor : pointer;
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
	#diary-input-title{
	    width: 90%; /* 입력창 너비 조정 */
	    padding: 5px;
	    font-size: 17px;
	    border: 2px solid gray;
	    background: transparent;
	}
	#diary-input-title:focus {
	    border-color: #FF3B7C;
	    outline: none;
	}
	#diary_contents {
	    width: 90%; /* 입력창 너비 조정 */
	    padding: 7px;
	    font-size: 15px;
	    background: transparent;
	    border: 2px solid gray;
    	text-align: left; /* 입력값 오른쪽 정렬 */
	}
	#diary_contents:focus {
	    outline: none;
	    border-color: #FF3B7C;
	}
</style>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#diary-input-title").focus();
	});
</script>

<table id = "diary_table">
		<tr>
			<td id = "diary_title" class = "kor_font">
				<input type = "text" placeholder = "제목 입력.." class="kor_font" id = "diary-input-title">
			</td>
		</tr>
		<tr>
			<td>
				<textarea id = "diary_contents"  class="diary-input-contents kor_font" placeholder = "내용 입력.."></textarea>
			</td>
		</tr>
	
	<tr>
		<td>
   			<input class="check_button" type="submit" value="">
			<input class="delete_button" type="submit" value="">
		</td>
	</tr>
</table>