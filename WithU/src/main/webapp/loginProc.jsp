<%@page import="userdb.UserDAO"%>
<%@page import="userdb.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
	
	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	// 파라미터 가져와서 저장
	// 로그인 처리시 필요한 아이디, 패스워드 필요
	
	UserBean userbean = new UserBean();
	userbean.setUserid(id);
	userbean.setUserpass(pass);
	// UserBean 객체에 아이디 패스워드 저장
	
	UserDAO udao = new UserDAO();
	boolean isLoginSuccess = udao.isRightUser(userbean);
	// UserDAO 객체의 isRightUser() 메소드 호출 후 로그인 판별
	// 파라미터 : MemberDTO 객체
	// 리턴타입 : boolean
	
	if (isLoginSuccess) {
		session.setAttribute("sId", id);
		// 로그인에 성공할 경우 세션에 sId 라는 이름으로 id값을 저장
		response.sendRedirect("index.jsp");
		// 세션에 아이디 저장 후 메인 페이지로 가기
	} else {
%>
	<script>
		alert("아이디 또는 비밀번호를 잘못입력했습니다.");
		history.go(-1);
		// 로그인 실패시 알림창 띄우고 이전 페이지로 이동
	</script>
<%
	}
%>
</body>
</html>