
<%@page import="comment.CommentService"%>
<%@page import="comment.CommentBean"%>
<%@page import= "java.util.Date"%>
<%@page import="java.util.ArrayList, java.util.List"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/include/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/BoardInfo.css">
<div class="container">
	<div class="do-co">
		
		<h1>게시판</h1>
		<a class="do-home" href="BoardListCon.do"><i class="fa-solid fa-house-chimney"></i></a>
		<div class="do-subject">
			<div class="do-title">
				<h2>${bean.subject}</h2>
			</div>
			<div class="do-info">
				<div class="do-left-info">
					<span>NO.${bean.num} / </span> 
					<span>작성자 : ${bean.writer}</span> 
				</div>
				<div class="do-right-info">
					<span>작성일 : ${bean.wdate.split(" ")[0]}</span> 
					<span>조회수 : ${bean.readcount}</span>
				</div>
			</div>
		</div>
<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
		<div class="do-context" id="textarea">
			<pre>${ bean.content }</pre>
		</div>
		
		<div class="do-button">
			<input class="do-update" type="button" value="수 정" onclick="location.href='BoardUpdateCon.do?num=${bean.num}'">
			<input class="do-del" type="button" value="삭 제" onclick="location.href='BoardDeleteCon.do?num=${bean.num}';">
		</div>
	
	</div>
</div>


<script>
	function displaySet(exe,num,name,content,cmd){
		obj = document.frm;
		obj.num.value=num;
		obj.exe.value=exe;
		obj.name.value=name;
		while(content.indexOf("<br>") != -1){
			content = content.replace("<br>","\n");
		}
		obj.content.value=content;
		obj.cmd.value=cmd;
	}
</script>

<div class="full-comment">
	<div class="comment">
	<form action="comment.do" method="post" name="frm">
		<input type="hidden" name="num" value="1">
		<input type="hidden" name="exe" value="1">
		<input type="hidden" name="page" value="${page}">
		<input type="hidden" name="ref" value="${bean.num}">
		
		<p class="coment-head">댓글</p>
		<div class="comment-info">
			<div>
				<span>이름</span>
				<input type="text" name="name">
			</div>
			<div>
				<span>비밀번호</span>
				<input type="password" name="password">
			</div>
		</div>
		<p class="comment-waring">* 비밀번호는 수정과 삭제에 필요하니 잊어버리지 않도록 주의하세요.</p>
		
		<div class="comment-content">
			<div>
				<span>내용</span>
			</div>
			<div>
				<textarea cols="60" rows="5" name="content"></textarea>
			</div>
		</div>
		
		<div class="comment-button">
			<input type="submit" value="댓글작성" name="cmd" id="commentok">
			<input type="reset" value="다시쓰기" id="commentno"> 
		</div>
		
	</form>
	</div>


<%
  List <CommentBean> commentList = (List<CommentBean>) request.getAttribute("commentList");
  if (commentList != null && !commentList.isEmpty()) {
    for (CommentBean bean : commentList) {
%>
	<div class="comment-list-container">
	<i class="arrow-turn-down-right">⤷</i>
      <div class="commentList">
        <span class="name"><%= bean.getName() %></span>
        <span class="rdate"><%= bean.getRdate() %></span>
   		
        <span class="update">
          <a href="javascript:displaySet(2, '<%= bean.getNum() %>','<%= bean.getName() %>','<%= bean.getContent() %>', '수정')">수정</a> &nbsp;
          <a href="javascript:displaySet(3, '<%= bean.getNum() %>','<%= bean.getName() %>','<%= bean.getContent() %>', '삭제')">삭제</a>
        </span>
        <div class="content">
          <%= bean.getContent() %>
        </div>
      </div>
    </div> 
       <br>
<%
    }
  }
%>
</div>
    <jsp:include page="/include/footer.jsp"></jsp:include>


</body>
</html>