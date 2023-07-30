<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>야호 멤버 웹</title>
		<style>
			legend {
				font-family : "";
			}
			input[type=text], input[type=password]{
				width : 200px;
				height : 30px;
				border-radius : 15px;
				border : 1px solid #ccc;
				margin-top : 15px;
				outline : none;
			}
			input[type=submit], input[type=reset]{
				margin-top : 20px;
				width : 100px;
				height : 30px;
				border-radius : 15px;
				border : 1px solid black;
				font-weight : bold;
				background-color : white;
				color : black;
			}
			input[type=submit]:hover, input[type=reset]:hover , a:hover{
				transition-duration : 1s;
				background-color : black;
				color : white;
			}
			a {
				padding : 5px 20px;
				text-decoration : none;
				color : black;
				border : 1px solid black;
				border-radius : 15px;
				font-size : 0.9em;
				font-weight : bold;
			}
		</style>
	</head>
	<body>
		<h1>야호 멤버 웹!</h1>
		<h2>로그인 페이지</h2>
		<c:if test="${ sessionScope.memberId ne null }">
			<!-- ne는 not equal -->
							╭◜◝ ͡ ◜◝╮ ╭◜◝ ͡ ◜ ◝ ╮. ҉   <br>
				( •‿•。 )≋( •‿•。 )≋ ♡ ) <br>
				╰◟◞ ͜ ◟◞╭◜◝ ͡ ◜◝╮ ͜ ◟◞╯☆ ҉   <br>
				. ҉ ≋ ҉ ( •‿•。 )≋ ♡  <br>
				. ♡ ╰ ◟◞ ͜ ◟◞ ╯ . ҉    <br>
							.　 ∧ ∧ <br>
				　( - з -) ＜ 어서와요....<br>
				┏━〇〇━━━━━┓<br>
				┃ 	${sessionScope.memberId }님 　　┃ <br>
				┃  환영합니다~~　┃<br>
				┗┳┳━━━━┳┳┛<br>
				　┗┛　         **  　   ┗┛<br>
							
											
			  <br><br>
			<a href="/member/logout.do">로그아웃</a>
			<a href="/member/myInfo.do?member-id=${ memberId }">마이페이지</a> <!-- 결과페이지로 가게하기 -->
		<!-- 	폼태그에서는 input태그값을 쿼리스트링으로 가져옴
			a태그에서는 직접 써줘야됨 -->		
		</c:if>
		<c:if test="${ memberId eq null }">
		<!-- sessionScope는 생략 가능(requestScope와 중복되면 써줘야함) -->
			<fieldset>
				<legend>로그인</legend>
				<form action="/member/login.do" method="post">
					<input type="text" name="member-id"><br>
					<input type="password" name="member-pw"><br>
					<div>
						<input type="submit" value="로그인">
						<input type="reset" value="취소">
						<a href="/member/enroll.jsp">회원가입</a>
					</div> 
				</form>
			</fieldset>
		</c:if>
	</body>
</html>