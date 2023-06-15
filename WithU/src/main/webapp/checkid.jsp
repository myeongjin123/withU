<%@page import="userdb.UserBean, userdb.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
form{
	text-align: center;
}
	
label{
	display: inline-block;
	width: 100px;
	height: 50px;
	line-height: 50px;
	background: #ebe7e6;
	text-align: center;
}

input{
	width: 200px;
	height: 50px;
	border: none;
	background: #fff;
	padding-left: 30px;
	border: 1px solid #ddd;
}

button{
	width: 100px;
	height: 50px;
	background: #eb5537;
	border: none;
	cursor: pointer;
	color: #fff;
	margin-left: 10px;
	margin-top: 30px;
}

button:hover{
	background: #fc5b3a;
}

h1{
	text-align: center;
	margin-top: 20px;
	margin-bottom: 40px;
	padding-top: 20px;
	font-size: 40px;
}
	
</style>
</head>
<body>
<h1>아이디 중복확인</h1>
	<form method="post" action="checkidProc.jsp">
	<label>아이디</label>
	<input type="text" name="checkid" />
	<br>
	<button type="submit">검사하기</button>
</form>
	
</body>
</html>