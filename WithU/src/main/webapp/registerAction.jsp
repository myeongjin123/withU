<%@page import="userdb.UserBean"%>
<%@page import="userdb.UserDAO,userdb.UserBean, java.io.PrintWriter"%>
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
		UserBean bean = new UserBean();
		int result = dao.idCheck(bean.getUserid());
		PrintWriter script = response.getWriter();
		if(result == 1){
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니당');");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == 0){
			script.println("<script>");
			script.println("alert('사용가능한 아이디 입니다');");
			script.println("history.back()");
			script.println("</script>");
		}else{
			script.println("<script>");
			script.println("alert('알 수 없는 오류가 발생했습니다.');");
			script.println("history.back()");
			script.println("</script>");
		}

%>



</body>
</html>