<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!--    header 영역 -->
	<div>
		<h1>뉴렉처 온라인</h1>

		<h2>헤더</h2>

		<h3>메인메뉴</h3>
		<ul>
			<li>학습가이드</li>
			<li>강좌선택</li>
			<li>AnswerIs</li>
		</ul>

		<h3>강좌검색폼</h3>
		<form>
			<fieldset>
				<legend>검색필드</legend>
				<label>과정검색</label> 
				<input type="text" /> 
				<input type="button" value="검색" />
			</fieldset>
		</form>

		<h3>회원메뉴</h3>
		<ul>
			<li>HOME</li>
			<li>로그인</li>
			<li>회원가입</li>
		</ul>

		<h3>안내</h3>
		<ul>
			<li>마이페이지</li>
			<li>고객센터</li>
		</ul>
	</div>
	<!--body 영역 -->
	<div>
		<!--aside 영역 -->
		<div>
			<h2>고객센터</h2>

			<h3>고객센터메뉴</h3>

			<ul>
				<li>공지사항</li>
				<li>자주하는 질문</li>
				<li>수강문의</li>
				<li>이벤트</li>
			</ul>

			<h3>협력업체</h3>

			<ul>
				<li>노트펍스</li>
				<li>나무랩연구소</li>
				<li>한빛미디어</li>
				<li>에이콘아카데미</li>
				<li>쌍용교육센터</li>
			</ul>
		</div>
		<!--main 영역 -->
		
		<main>
			<h2>회원가입</h2>
			
			<div>
			<h3>회원가입폼</h3>
			
			<form action="join" method="post">
				<table border="1">
					<tr>
						<th>사진</th><!-- 제목열 -->
						<td><input type="file"/></td>
					</tr>
					<tr>
						<th>아이디</th><!-- 제목열 -->
						<td><input type="text" required ="required" placeholder= "영문과 숫자 6~20자 이내"/><input type="button" /></td>
					</tr>
					<tr>
						<th>비밀번호</th><!-- 제목열 -->
						<td><input type="password" required ="required" placeholder="입력"/></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th><!-- 제목열 -->
						<td><input type="password" required ="required" placeholder="입력"/></td>
					</tr>
					<tr>
						<th>이름</th><!-- 제목열 -->
						<td></td>
					</tr>
					<tr>
						<th>나이</th><!-- 제목열 -->
						<td><input type="number" min="2" max="200"/></td>
					</tr>
					<tr>
						<th>성별</th><!-- 제목열 -->
						<td>
						<select>
							<option>선택</option>
							<option selected = "selected">남성</option>
							<option>여성</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>생년월일</th><!-- 제목열 -->
						<td>
							<input type="date"/>	
							<input type="radio" name ="solar"/><label>양력</label>
							<input type="radio"name ="solar"/><label>음력</label>
						</td>
					</tr>
					<tr>
						<th>핸드폰번호</th><!-- 제목열 -->
						<td><input type = "text" required = "required" placeholder="예)010-1234-1234" pattern="^01[016789]-\d{3,4}-\d{4}$"/></td>
					</tr>
					<tr>
						<th>이메일</th><!-- 제목열 -->
						<td></td>
					</tr>
					<tr>
						<th>다음 계산 결과는?</th><!-- 제목열 -->
						<td></td>
					</tr>
				
					<tr>
						<td colspan="2"><input type="submit" value="확인"/></td>
					</tr>
				
				</table>
			</form>
			</div>
		
		</main>

	</div>
	<!--footer 영역 -->
	<div></div>
	
</body>
</html>