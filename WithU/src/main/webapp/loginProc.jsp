<%@page import="userdb.UserDAO"%>
<%@page import="userdb.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
	
	String id = request.getParameter("userid");
	String pass = request.getParameter("userpass");
	
	UserBean userbean = new UserBean();
	userbean.setUserid(id);
	userbean.setUserpass(pass);
	
	UserDAO udao = new UserDAO();
	boolean isLoginSuccess = udao.isRightUser(userbean);
	
%>
</body>
</html>