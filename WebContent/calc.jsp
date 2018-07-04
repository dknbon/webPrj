<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
        <form action=calc method="post">
    <div>
        <label>x : </label>
        <input type="text" name="x" />
    </div>
    <div>
        <label>y : </label>
        <input type="text" name="y" />
    </div>
        <div>
    	sum : <%out.print(3+4);%>
   		</div>
    <div>            
        <input type="submit" value="덧셈" />
    </div>
</form>
    </div> 
</body>
</html>