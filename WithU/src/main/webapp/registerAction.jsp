<%@page import="userdb.UserBean"%>
<%@page import="userdb.UserDAO, java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id = "user" class = "userdb.UserBean" scope ="page" />
<jsp:setProperty name = "user" property = "userid" />


<%
	//로그인된 유저는 회원가입 페이지 못 들어감
/* 	String userid = null;
	if(session.getAttribute("userid") !=null){
		userid=(String)session.getAttribute("userid");
	}
	
	//입력 안 된 부분에는 경고 팝업 후 돌려보내기
	if(user.getUserid() ==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('빈칸을 모두 채워주세용!');");
		script.println("history.go(-1)");
		script.println("</script>");
	}else{ */
		UserDAO dao = new UserDAO();
		int result = dao.idCheck(user);
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니당');");
			script.println("history.back()");
			script.println("</script>");
		}
		
/* 	} */

%>



</body>
</html>