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
		<div>
			<div>
				<section>
				 <h2><span>Knowyourband</span><span>활동가능</span></h2>
				 <h5>
				 	<span>디자이너</span>
				 	<span>개인사업자</span>
				 </h5>
				</section>
				<section>
					<div>
						<div>평점</div>
					</div>
				</section>
				<section></section> <!-- 줄무늬 선 -->
				<section>
					<div>
						<div>
							<h4>자기소개</h4>
							<div>
								<p>dddddd</p>
							</div>
							<h6><a href="">자기소개 더 보기</a></h6>
						</div>
					</div>
				</section>
				<section></section> <!-- 줄무늬 선 -->
				<section>
					<h4>포트폴리오</h4>
					<div><!-- 반복 -->
						<div>
							<a href=""><img scr="https://wishket.blob.core.windows.net/thumbnail/Knowyourbrand_Upo_swamp_Traking_c307538fdc208c735f99.png"/></a>
							<div>
								<a href=""></a>
								<label>대표작품</label>
								<p>디자인>애플리케이션</p>
							</div>
						</div>
					</div>
					<h6><a href="">포트폴리오 더 보기</a></h6>
					
				</section>
				<section></section> <!-- 줄무늬 선 -->
				<section>
					<h4>보유 기술</h4>
					<table>
						<thead>
							<tr>
								<th>종류</th>
								<th>숙련도</th>
								<th>경험</th>
							</tr>
						</thead>
						<tbody>
						<!-- 반복 -->
							<tr>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</section>
			</div>
		
		</div>
	</main>

</body>
</html>