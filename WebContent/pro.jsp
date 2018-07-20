<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="com.answeris.web.Partner"%>
<%@page import="com.answeris.web.RootService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	
	
<%
	int pageNo = 1;
	int i = 1;
	String field = "";
	String query = "";

	/*페이징 관련*/
	String pageNo_ = request.getParameter("p");
	if (pageNo_ != null && !pageNo_.equals(""))
		pageNo = Integer.parseInt(pageNo_);

	/*검색 관련*/

	String field_ = request.getParameter("f");
	String query_ = request.getParameter("q");

	if (field_ != null && !field_.equals(""))
		field = field_;
	if (query_ != null && !query_.equals(""))
		query = query_;

	/*-------------------------------------------*/
	RootService service = new RootService();
	List<Partner> list = service.getNoticeList(field, query, pageNo);
	int pnum = service.getNoticeCount(field, query);
	int prjnum = service.getPrjno(query);
	int portFolionum = service.getPortfoliono(query);
	Map<String, String> map = service.getEval(query);
	
	
	for(Partner p : list){
		p.setSkills(service.getSkilles(p.getId()));
	}

	 
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" href="css/style1.css" rel="stylesheet" />
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">

<title>Insert here</title>
</head>
<body>
	<main>
	<div class="page">
		<div id = "page-body">
			<div class="card bg-light mb-3" >
				<div class="card-body">
					<div class="card-body-head" style="float: left;">
						<h4 class="card-title">파트너스 목록</h4>
						<p class="card-text"><%=pnum%>명의 파트너스가 있습니다.
						</p>
					</div>

					<div id="card-body-search">
						<h1>공지사항 검색폼</h1>
						<form method="get">
							<select name="f">
								<option value="">전체 직군</option>
								<!--  -->
								<option value="개발자">개발자</option>
								<option value="디자이너">디자이너</option>
							</select> <input type="text" name="q" value="<%=query%>" /> <input
								type="submit" class="btn btn-primary" value="검색" />
						</form>
					</div>
				</div>



			</div>

			<%
				for (Partner p : list) {
			%>
			<div class="card bg-light mb-3" >
				<div class="card-body">
					<div class="card-img">
						<a href="pro1.jsp"> <img class="card-img1" alt="파트너스 프로필 이미지"
							src="<%=p.getPro_img()%>">
						</a>
					</div>

					<div class="card-body-h">
						<h4 class="card-title">
							<a id="card-id" href=""><%=p.getId()%> </a> <span
								class="badge badge-success" id="badge-suc"><a href="pro1.jsp"> 활동가능</a></span>
						</h4>
						<div id="main-menu-head">
							<nav id="main-menu">
							<ul>
								<li><a href="pro1.jsp"><%=p.getType()%></a></li>
								<li><a href="pro1.jsp"><%=p.getManager()%></a></li>
							</ul>
							</nav>
						</div>

						<p id="card-text">
							<a href="pro1.jsp"><%=p.getIntro()%></a>
						</p>
						<div>
							<span class="badge badge-secondary">Mysql </span> <span
								class="badge badge-secondary">Java </span> <span
								class="badge badge-secondary">PHP </span>
						</div>
					</div>
				</div>
				
				
				
				<section class="partners-add-info">
				<div>
					<ul id="partners-eval">
						<li><%=map.get("avg") %> / 평가 : <%=map.get("count") %>개</li>
						<li>계약한 프로젝트 : <%=prjnum %>건</li>
						<li>포트폴리오 : <%=portFolionum %>개</li>
					</ul>
				</div>
				</section>
				
				
				
				
			</div>
			<%
				}
			%>



			<div>
				<nav aria-label="Page navigation example"
					style="padding-left: 400px;">
				<ul class="pagination">
					<li class="page-item">
					<a class="page-link" href="#" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span>
						<span class="sr-only">Previous</span>
					</a></li>


					<%
						for (int j = 0; j <= pnum / 10; j++) {
					%>
					<li class="page-item"><a class="page-link"
						href="?p=<%=i%>&f=<%=field%>&q=<%=query%>"><%=i%></a></li>
					<%
						i = i + 1;
						}
					%>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>
	</main>

</body>
</html>