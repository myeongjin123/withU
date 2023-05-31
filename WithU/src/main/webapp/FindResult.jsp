<%@page import="userdb.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/findIdPw.css">
<body>
<%
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	
	UserDAO udao = new UserDAO();
	String userid = udao.findId(name, phone);
	String userpass = udao.findPw(name, phone);
%>

<jsp:include page="/include/header.jsp"></jsp:include>
		<div class="container-find">
		<div class="row-find">
			<img alt="logotitle" src="images/logotitle.png">
			<h2 class="logotitle-find">: Journey with Animals</h2>
			<form name="findscreen" method="post">
				<div class="name">
					<label for="" class="form-title-find"><i class="ri-user-3-line"></i></label>
					<div class="result"><%=userid %></div>
				</div>
				<div class="tel">
					<label for="" class="form-title-find"><i class="ri-key-2-fill"></i></label>
					<div class="result"><%=userpass %></div>
				</div>
				<input class="log" type="button" value="로그인" onclick="history.go(-2)"/>
			</form>
		</div>
	</div>
</body>
</html>