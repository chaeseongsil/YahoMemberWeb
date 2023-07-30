<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link rel="stylesheet" href="/resources/css/member/main.css">
	</head>
	<body>
		<h1>마이페이지</h1>
		<form action="/member/update.do" method="post">
			<fieldset>
				<legend>회원 상세 정보</legend>
				<ul>
					<li>
						<label for="member-id">아이디</label>
						<input type="text" id="member-id" name="member-id" value="${ member.memberId }" readonly> <!--기능을 위한 id, 쿼리스트링 생성을 위한 name -->
						<!-- member vo에 있는 멤버변수 값을 .으로 가져옴 -->
					</li>
					<li>
						<label for="member-pw">비밀번호</label>
						<input type="password" id="member-pw" name="member-pw"> <!--기능을 위한 id, 쿼리스트링 생성을 위한 name -->
					</li>
					<li>
						<label for="member-name">이름</label>
						<input type="text" id="member-name" name="member-name" value="${ member.memberName }" readonly> <!--기능을 위한 id, 쿼리스트링 생성을 위한 name -->
					</li>
					<li>
						<label for="member-age">나이</label>
						<input type="text" id="member-age" name="member-age" value="${ member.memberAge }" readonly> <!--기능을 위한 id, 쿼리스트링 생성을 위한 name -->
					</li>
					<li>
						<label for="member-gender">성별</label>
						<!-- 기존 성별 수정 코드의 오류를 막기 위해 적어주는 input태그, hidden으로 사용자에겐 보이지 않음 -->
<%-- 						${member.memberGender }가 M이면 남자
						${member.memberGender }가 F이면 여자--%>
						<input type="hidden" id="genderM" name="member-gender" value="${member.memberGender }">
<!-- 						기존 데이터 그대로 업데이트 되도록 함 -> MemberGender를 업데이트 문에 넣어버렸기 때문에.. -->
						<c:if test="${member.memberGender eq 'M'}">남자</c:if>
						<c:if test="${member.memberGender eq 'F'}">여자</c:if>
<%-- 						남 <input type="radio" id="genderM" name="member-gender" value="M" <c:if test="${member.memberGender eq 'M' }">checked</c:if>>
						여 <input type="radio" id="genderF" name="member-gender" value="F" <c:if test="${member.memberGender eq 'F' }">checked</c:if>> --%>
					</li>
					<li>
						<label for="member-email">이메일</label>
						<input type="text" id="member-email" name="member-email" value="${ member.memberEmail }"> <!--기능을 위한 id, 쿼리스트링 생성을 위한 name -->
					</li>
					<li>
						<label for="member-phone">전화번호</label>
						<input type="text" id="member-phone" name="member-phone" value="${member.memberPhone }"> <!--기능을 위한 id, 쿼리스트링 생성을 위한 name -->
					</li>
					<li>
						<label for="member-addr">주소</label>
						<input type="text" id="member-addr" name="member-addr" value="${member.memberAddress }"> <!--기능을 위한 id, 쿼리스트링 생성을 위한 name -->
					</li>
					<li>
						<label for="member-hobby">취미</label>
						<input type="text" id="member-hobby" name="member-hobby" value="${member.memberHobby }"> <!--기능을 위한 id, 쿼리스트링 생성을 위한 name -->
					</li>
					<li>
						<label for="member-hobby">가입날짜</label>
						<input type="text" id="" name="" value="${member.memberDate }" readonly> <!--기능을 위한 id, 쿼리스트링 생성을 위한 name -->
					</li>
				</ul>
			</fieldset>
			<div>
				<!-- <button>수정하기</button>
				<button>탈퇴하기</button> -->
				<button type="submit">수정하기</button>
				<a href="javascript:void(0)" onclick="checkDelete();">탈퇴하기</a>
			</div>
		</form>
		<script>
			//"/member/delete.do?memberId=${ sessionScope.memberId }
			function checkDelete(){
				const memberId = '${sessionScope.memberId}';
				if(confirm("찐탈퇴?")){
					location.href="/member/delete.do?memberId="+memberId;
				}
			}
			
		</script>
	</body>
</html>