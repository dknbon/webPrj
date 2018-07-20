<%@page import="service.CustomerService"%>
<%@page import="entity.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My</title>
<link type="text/css" href="/sfsd/css/style.css" rel="stylesheet" />
</head>
<body>
	<!-- header 영역 -->
	<jsp:include page="../../inc/header.jsp"/>
	<div id="visual"></div>
	<!--body 영역 -->
	<div id="body">
		<div class="content-container">
			<jsp:include page="../inc/aside.jsp"/>

			<!--main 영역 -->
			<main id="main">
			<section>
				<h1>공지사항</h1>
				<section>
					<h1>경로</h1>
					<ul>
						<li>home</li>
						<li>고객센터</li>
						<li>공지사항</li>
					</ul>
				</section>
				
				<section>
					<h1>공지사항</h1>
					<table class = "table">
						<tbody>
							<tr>
								<th>제목</th>
								<td colspan="3">${n.title}</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td colspan="3"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${n.regDate}"/> </td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3">${n.content}</td>
							</tr>							
							
							<tr>
								<th>작성자</th>
								<td>${n.writerId }</td>
								<th>조회수</th>
								<td><fmt:formatNumber pattern="###,###" value="321323124234"/>${n.hit }</td>
							</tr>
						</tbody>
					</table>
				</section>
				
				<div>
					<a href="list">목록</a>
				</div>
				
				
				
			</main>
		</div>
	</div>

	<!--footer 영역 -->
	<jsp:include page="../../inc/footer.jsp"/>

</body>
</html>