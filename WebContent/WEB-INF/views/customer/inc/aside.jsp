<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String ctx = request.getContextPath(); %>
		<aside id="aside">
				<h1>고객센터</h1>
				<section id="aside-customer-menu">
					<h1>고객센터메뉴</h1>
					<ul>
						<li><a href="">공지사항</a></li>
						<li><a href="">자주하는 질문</a></li>
						<li><a href="">수강문의</a></li>
						<li><a href="">이벤트</a></li>
					</ul>
				</section>
				<section id="company">
					<h1>협력업체</h1>
					<ul>
						<li><a href=""><img src="<%=ctx %>/images/notepubs.png" alt="노트펍스"/></a></li>
						<li><a href=""><img src="<%=ctx %>/images/namoolab.png" alt="나무랩연구소"/></a></li>
						<li><a href=""><img src="<%=ctx %>/images/hanbit.png" alt="한빛미디어"/></a></li>
						<li><a href=""><img src="<%=ctx %>/images/acorn.png" alt="에이콘아카데미"/></a></li>
						<li><a href=""><img src="<%=ctx %>/images/sist.png" alt="쌍용교육센터"/></a></li>
					</ul>
				</section>
			</aside>