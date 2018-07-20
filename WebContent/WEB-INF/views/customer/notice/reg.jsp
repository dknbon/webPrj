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
					<form method="post" >
					<table class = "table">
						<tbody>
							<tr>
								<th>제목</th>
								<td colspan="3"><input type="text" name = "title"/></td>
							</tr>
							<tr>
							<td>
								<textarea name = "content" ></textarea>
							</td>	
							</tr>
							<tr>
								<input type="submit" value="등록">
							</tr>
						</tbody>
					</table>
					</form>
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