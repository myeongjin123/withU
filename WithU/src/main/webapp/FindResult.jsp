<%@page import="userdb.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	
	UserDAO udao = new UserDAO();
	String userid = udao.findId(name, phone);
	String userpass = udao.findPw(name, phone);
%>

<p>회워님의 아이디는 <%=userid %></p>
<p>회원님의 비밀번호는 <%=userpass %></p>
</body>
</html>