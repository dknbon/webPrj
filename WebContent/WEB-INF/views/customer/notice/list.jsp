<%@page import="service.CustomerService"%>
<%@page import="entity.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

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
			<!-- aside영역 -->
			
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
				<section id="main-form">	
				<h1>공지사항 검색폼</h1>
					<form method="get"> 
						<select name = "f">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="q" placeholder="검색어를 입력하세요" value="${query }"/>
						<input type="submit" value= "검색"/>			
					</form>
	
				</section>

				<section id="notice-table">
					<h1>공지사항표</h1>
					<table class="table">
						<thead>
							<tr>
								<td class="id">번호</td>
								<td class="title">제목</td>
								<td class="writerid">작성자</td>
								<td class="regdate">작성일</td>
								<td class="hit">조회수</td>
							</tr>
						</thead>

						<tbody>
						<c:forEach var="n" items="${list }">
							<tr>
								<td class="id">${n.id }</td>
								<td class="title"><a href="detail?id=${n.id}">${n.title}</a></td>
								<td class="writerid">${n.writerId}</td>
						 		<td class="regdate">${n.regDate}</td>
								<td class="hit">${n.hit}</td>
							</tr>							
						</c:forEach>

						</tbody>
					</table>
				</section>
				<div>
					<a href="reg">글쓰기</a>
				</div>

				<section>
					<h1>페이지 인덱스</h1>
					<div>1 / 1 pages</div>
				</section>

				<section>
					<h1>페이지</h1>
					<div>이전</div>
					<ul>
					<c:set var="page" value="1"></c:set>
						<c:if test="${not empty param.p}">
						<c:set var="page" value="${param.p }" />
						</c:if>
						<c:set var="startNum" value="${(page-1)/5*5+1 }"></c:set>
						<c:set var="lastNum" value="${(count+9)/10 }"></c:set>
						<c:set var="lastNum" value="${lastNum-(lastNum%1)}"></c:set>
						<c:set var="lastNum" value="${fn:replace(lastNum, '.0', '')}"></c:set>
						
						<c:if test="${lastNum <= startNum+4}">
								<c:set var="lastNum" value="${lastNum }"/>
						</c:if>
						
						
						<c:forEach var = "i" begin="${startNum }" end="${lastNum }">
						<li><a href="?p=${i }&f=${param.f}&q=${param.q}">${i }</a></li>
						</c:forEach>
						<%-- 
						<c:set var="tags" values="자바, JSP, EL"/>
						<c:forTokens items="${tags }" delims=",">${tags }</c:forTokens>
						 --%>
					</ul>
					<div><a href="?p=${i }&f=${param.f}&q=${param.q}">${i }</a>다음</div>
				</section>
			</section>
			</main>
		</div>
	</div>

	<!--footer 영역 -->
	<jsp:include page="../../inc/footer.jsp"/>

</body>
</html>