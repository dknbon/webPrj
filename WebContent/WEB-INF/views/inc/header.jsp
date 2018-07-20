<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		String ctx = request.getContextPath();
	%>
	<header id="header">
		<div class="content-container">
			<h1>

				<img src="<%=ctx %>/images/logo.png" alt="뉴렉쳐 온라인" />
			</h1>
			<section id="head">
				<h1>헤더</h1>
				<nav id="main-menu">
					<h1>메인메뉴</h1>
					<ul>
						<li class="first"><a href="<%=ctx %>">학습가이드</a></li>
						<li><a href="<%=ctx %>">강좌선택</a></li>
						<li class="last"><a href="<%=ctx %>">AnswerIs</a></li>
					</ul>
				</nav>
				<nav id="search-form">
					<section>
						<h1>강좌검색폼</h1>
						<form>
	
							<label>과정검색</label> <input type="text" /> <input type="submit"
								value="검색" />
						</form>
					</section>
				</nav>
				<section id="red">
					<h1>회원메뉴</h1>
					<ul>
						<li><a href="<%=ctx %>">HOME</a></li>
						<li><a href="<%=ctx %>">로그인</a></li>
						<li><a href="<%=ctx %>">회원가입</a></li>
					</ul>
				</section>
	
				<nav id="yellow">
					<h1>안내</h1>
					<ul>
						<li><a href="<%=ctx %>">
								<!-- <img src="../images/txt-mypage.png"  alt="마이페이지"/> -->마이페이지
						</a></li>
						<li><a href="<%=ctx %>">
								<!-- <img src="../images/txt-customer.png"  alt="고객센터"/> -->고객센터
						</a></li>
					</ul>
				</nav>
			</section>
		</div>
	</header>