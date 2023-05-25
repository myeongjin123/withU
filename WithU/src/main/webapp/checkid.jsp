<%@page import="userdb.UserBean, userdb.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="checkidProc.jsp">
	<label>아이디 : </label>
	<input type="text" name="checkid" />
	<button type="submit">검사하기</button>
</form>
	
</body>
</html>