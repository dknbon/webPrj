<%@page import="service.RootService"%>
<%@page import="entity.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	RootService service = new RootService();
	List<Notice> list = service.getNoticeList();

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
         <h1>
			뉴렉쳐 온라인
         </h1>
         <section>
            <h1>헤더</h1>
            <nav id="main-menu">
               <h1>메인메뉴</h1>
               <ul>
                  <li class="first"><a href="">학습가이드</a></li>
                  <li><a href="">강좌선택</a></li>
                  <li class="last"><a href="">AnswerIs</a></li>
               </ul>
            </nav>

            <section>
               <h1>강좌검색폼</h1>
               <form>
                  <fieldset>
                     <legend>검색필드</legend>
                     <label>과정검색</label> <input type="text" /> <input type="button"
                        value="검색" />
                  </fieldset>
               </form>
            </section>

            <section class="red">
               <h1>회원메뉴</h1>
               <ul>
                  <li>HOME</li>
                  <li>로그인</li>
                  <li>회원가입</li>
               </ul>
            </section>

            <section class="red">
               <h1>안내</h1>
               <ul>
                  <li>마이페이지</li>
                  <li>고객센터</li>
               </ul>
            </section>
         </section>
      </div>
   </header>

   <div id="visual"></div>
   <!--body 영역 -->
   <div id="body">
      <div class="content-container clearfix">
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
               <h1>공지사항표</h1>
               <table border="1">
                  <thead>
                     <tr>
                        <td>번호</td>
                        <td>제목</td>
                        <td>작성자</td>
                        <td>작성일</td>
                        <td>조회수</td>
                     </tr>
                  </thead>
   
                  <tbody>
                  
                 
                  <% for(Notice n : list){ %>
                	 
                     <tr>
                        <td><%=n.getId() %></td>
                        <td><%=n.getTitle() %></td>
                        <td><%=n.getContent() %></td>
                        <td><%=n.getWriterId() %></td>
                        <td><%=n.getRegDate() %></td>
                        <td><%=n.getHit() %></td>
                     </tr>
                <%  } %>

                  </tbody>
               </table>
            </section>
   
            <section>
               <h1>페이지 인덱스</h1>
               <div>1 / 1 pages</div>
            </section>
   
            <section>
               <h1>페이저</h1>
               <div>이전</div>
               <ul>
                  <li>1</li>
                  <li>2</li>
                  <li>3</li>
                  <li>4</li>
                  <li>5</li>
               </ul> 
               <div>다음</div>
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