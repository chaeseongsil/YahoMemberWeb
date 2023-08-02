<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 목록 조회</title>
		<style>
			table {
				width : 800px;
				border : 1px solid #ccc;
				border-collapse : collapse;
			}
			th {
				padding : 5px 5px;
				border : 1px solid #ccc;
			}
			tr:first-of-type {
				border-bottom-style : double;
			}
			tr, td{
				padding : 5px 5px;
				border : 1px solid #ccc;
			}
		</style>
	</head>
	<body>
		<h1>공지사항 목록</h1>
		<table>
			<colgroup>
				<col width="10%">
				<col width="55%">
				<col width="10%">
				<col width="15%">
				<col width="10%">
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.nList }" var="notice">
					<tr>
						<!-- '.'뒤에는 vo클래스의 필드명을 적어줌 -->
						<td>${notice.noticeNo }</td>
						<td><a href="/notice/detail.do?noticeNo=${notice.noticeNo }"> ${notice.noticeSubject }</a></td>
						<td>${notice.noticeWriter }</td>
						<td>${notice.noticeDate }</td>
						<td>${notice.viewCount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>