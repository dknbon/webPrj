<%@page import="service.RootService"%>
<%@page import="entity.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int pageNo = 1;
	String field = "title";
	String query = "";
	 
	String pageNo_ = request.getParameter("p");
	String field_ = request.getParameter("f");
	String query_ = request.getParameter("q");
	
	if (pageNo_ != null && !pageNo_.equals(""))
		pageNo = Integer.parseInt(pageNo_);
	if (field_ != null && !field_.equals(""))
		field = field_;
	if (query_ != null && !query_.equals(""))
		query = query_;
	RootService service = new RootService(); 
	
	//List<Notice> list = service.getNoticeList(pageNo);
	
	List<Notice> list = service.getNoticeList(field, query, pageNo);
	int count = service.getNoticeCount(field, query); 
		
		

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My</title>
<link type="text/css" href="../css/style.css" rel="stylesheet" />
</head>
<body>
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container">
			<h1><img src="../images/logo.png" alt="뉴렉쳐 온라인"/></h1>
			<section id="head">
				<h1>헤더</h1>
				<nav id="main-menu">
					<h1>메인메뉴</h1>
					<ul>
						<li class="first"><a href="">학습가이드</a></li>
						<li><a href="">강좌선택</a></li>
						<li class="last"><a href="">AnswerIs</a></li>
					</ul>
				</nav>
				<nav id="search-form">
					<section>
						<h1>강좌검색폼</h1>
						<form>

							<label>과정검색</label> <input type="text" /> 
							<input type="submit" value="검색" />
						</form>
					</section>
				</nav>
				<section id="red">
					<h1>회원메뉴</h1>
					<ul>
						<li><a href="">HOME</a></li>
						<li><a href="">로그인</a></li>
						<li><a href="">회원가입</a></li>
					</ul>
				</section>

				<nav id="yellow">
					<h1>안내</h1>
					<ul>
						<li><a href=""><!-- <img src="../images/txt-mypage.png"  alt="마이페이지"/> -->마이페이지</a></li>
						<li><a href=""><!-- <img src="../images/txt-customer.png"  alt="고객센터"/> -->고객센터</a></li>
					</ul>
				</nav>
			</section>
		</div>
	</header>

	<div id="visual"></div>
	<!--body 영역 -->
	<div id="body">
		<div class="content-container">
			<aside id="aside">
				<h1>고객센터</h1>
				<section>
					<h1>고객센터메뉴</h1>
					<ul>
						<li>공지사항</li>
						<li>자주하는 질문</li>
						<li>수강문의</li>
						<li>이벤트</li>
					</ul>
				</section>
				<section>
					<h1>협력업체</h1>
					<ul>
						<li>노트펍스</li>
						<li>나무랩연구소</li>
						<li>한빛미디어</li>
						<li>에이콘아카데미</li>
						<li>쌍용교육센터</li>
					</ul>
				</section>
			</aside>

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
				<h1>공지사항 검색폼</h1>
					<form method="get"> 
						<select name = "f">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" name="q" placeholder="검색어를 입력하세요" value="<%=query%>"/>
						<input type="submit" value= "검색"/>			
					</form>
	
				</section>

				<section>
					<h1>공지사항표</h1>
					<table border="1">
						<thead>
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>내용</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>조회수</td>
							</tr>
						</thead>

						<tbody>


							<%
								for (Notice n : list) {
							%>

							<tr>
								<td><%=n.getId()%></td>
								<td><%=n.getTitle()%></td>
								<td><%=n.getContent()%></td>
								<td><%=n.getWriterId()%></td>
								<td><%=n.getRegDate()%></td>
								<td><%=n.getHit()%></td>
							</tr>
							<%
								}
							%>

						</tbody>
					</table>
				</section>

				<section>
					<h1>페이지 인덱스</h1>
					<div>1 / 1 pages</div>
				</section>

				<section>
					<h1>페이지</h1>
					<div>이전</div>.
					<ul>
						<%for(int i=1; i<=5;i++) {%>
						<li><a href="?p=<%=i %>&f=<%=field %>&q=<%=query %>"><%=i %></a></li>
						<%} %>
						
					</ul>
					<div>다음</div>
				</section>
			</section>
			</main>
		</div>
	</div>

	<!--footer 영역 -->
	<footer id="footer">
		<h1>footer</h1>
	</footer>

</body>
</html>