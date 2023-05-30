<%@page import="userdb.UserBean, userdb.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	form{
		text-align: center;
	}
	label span{
		font-weight: bold;
	}
</style>
</head>
<body>
	<form method="post" action="checkidProc.jsp">
	<label><span>아이디 : </span></label>
	<input type="text" name="checkid" />
	<button type="submit">검사하기</button>
</form>
	
</body>
</html>