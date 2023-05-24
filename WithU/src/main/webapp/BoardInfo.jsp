
<%@page import="comment.CommentService"%>
<%@page import="comment.CommentBean"%>
<%@page import= "java.util.Date"%>
<%@page import="java.util.ArrayList, java.util.List"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 내용 보기</title>
<style>
*{box-sizing: border-box;}

.board-jeon{
	width: 800px;
	height: 600px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin: 0 auto;
}

.board-info-jeon{
	background: #fff;
	width: 780px;
	height: 130px;
	border: 1px solid #327841;
	border-radius: 5px;
	margin: 10px;
}

.board-info-jeon h2{
	margin-top: 30px;
	text-align: center;
}

.info-jeon{
	float: right;
	margin-right: 40px;
}

.board-context-jeon{
	background: #fff;
	width: 780px;
	height: 380px;
	border: 1px solid #327841;
	border-radius: 5px;
	margin: 10px;
}

.board-context-jeon p{
	padding: 10px 20px;
}

.board-button-jeon{
	float: right;
	margin: 10px 10px 0px 0px;
}

.board-button-jeon input{
	background: #fff;
	border: 1px solid #000;
	padding: 5px 10px;
	transition: all 0.3s;
}

.board-button-jeon input:hover{
	background: #327841;
	color: #fff;
}

/*-----------------------------------comment----------------------------*/

.comment{
	width: 800px;
	height: 350px;
	margin: 10px auto;
	border: 1px solid #000;

}

.coment-head{
	margin: 30px 60px;
	font-size: 24px;
	font-weight: bold;
}

.comment-info{
	width: 500px;
	height: 30px;
	margin: 0 auto;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.comment-info div input{
	border: none;
	border-bottom: 1px solid #aaa;
}

.comment-waring{
	font-size: 14px;
	color: #aaa;
	margin-left: 200px;
}

.comment-content{
	width: 600px;
	height: 100px;
	margin: 0 auto;
	margin-top: 20px;
	display: flex;
	flex-direction: row;
}

.comment-content span{
	display: inline-block;
	margin-top: 25px;
	margin-left: 40px;
}

.comment-content textarea{
	margin-left: 20px;
}

#commentok, #commentno{
	padding: 7px 15px;
	background: #eee;
	border: none;
	border-radius: 3px;
}

#commentok:hover, 
#commentno:hover{
	background: #94b7f7;
}

.comment-button{
	width: 180px;
	height: 40px;
	margin: 10px auto;
}



/*-----------------------------------comment-list----------------------------*/

.commentList{
	width: 600px;
	height: 150px;
	border: 1px solid #999;
}

.name{
	display: inline-block;
	height: 20px;
	font-weight: bold;
	padding: 10px;
}

.rdate{
	display: inline-block;
	height: 20px;
	padding-left: 20px;
}

.update {
	float: right;
	padding: 10px;
}

.update a{
	color: blue;
	text-decoration: none;
}

.content{
	padding-top: 10px;
	margin: 10px;
	border-top: 1px dashed #ccc;
}

.comment-list-container{
	width: 600px;
	margin: 0 auto;
	display: flex;
	flex-direction: row;
}

.arrow-turn-down-right{
	width: 20px;
	height: 100px;
	font-size: 40px;
	color: #000;
	margin-right: 20px;
}

</style>

</head>
<body>

<div class="board-jeon">
	<div class="board-info-jeon">
		<h2>제목: ${bean.subject}</h2>
		<div class="info-jeon">
			<span>[${bean.num}번째 게시물]</span> 
			<span>작성자 : ${bean.writer}</span> 
			<span>작성일 : ${bean.wdate}</span> 
			<span>조회수 : ${bean.readcount}</span>
		</div>
	</div>
	
	<div class="board-context-jeon">
		<p>${bean.content}</p>
	</div>
	
	<div class="board-button-jeon">
		<input type="button" value="목 록" onclick="location.href='BoardListCon.do'">
		<input type="button" value="수 정" onclick="location.href='BoardUpdateCon.do?num=${bean.num}'">
		<input type="button" value="삭 제" onclick="location.href='BoardDeleteCon.do?num=${bean.num}'">
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



</body>
</html>