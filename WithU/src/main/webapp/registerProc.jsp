<%@page import="userdb.UserBean"%>
<%@page import="userdb.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class = "userdb.UserBean">
	<jsp:setProperty name ="bean" property ="*" />
</jsp:useBean>

<!DOCTYPE html>
<html>
<body>

<%
	//데이터베이스 객체 생성
	UserDAO dao = new UserDAO();
	dao.insert(bean);
	
	//회원가입 완료시 index로 이동
	response.sendRedirect("index.jsp");
%>

오라클 완료
</body>
</html>