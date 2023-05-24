<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 쓰기</title>
<style>
	.board-write-jeon{
		border: 1px solid #000;
		width: 800px;
		height: 600px;
		border-radius: 5px;
		margin: 0 auto;
	}
	
	.board-write-jeon h2{
		text-align: center;
		background: #00913e;
		padding: 20px 0px;
		margin: 0;
	}
	
	.board-write-info-jeon{
		border-bottom: 1px solid #000;
		width: 800px;
		height: 150px;
	}
	
	.board-write-info-jeon div span{
		display: inline-block;
		width: 80px;
		height: 30px;
		text-align: center;
		padding-top: 5px;
	}
	
	.board-write-content-jeon{
		width: 780px;
		height: 320px;
		margin-top: 5px;
		padding: 0 10px;
	}
	
	.board-write-button-jeon{
		float: right;
		margin: 10px 10px 0px 0px;
	}
	
	.board-write-button-jeon input{
		background: #fff;
		border: 1px solid #000;
		padding: 5px 10px;
		transition: all 0.3s;
	}
	
	.board-write-button-jeon input:hover{
		background: #327841;
		color: #fff;
	}
	
	.board-write-content-jeon textarea{
		border: none;
		padding: 20px;
	}
</style>
</head>
<body>
	<div class="board-write-jeon">
		<h2>게시판 글쓰기</h2>
		<form action="BoardWriteProcCon.do" method="post">
		<div class="board-write-info-jeon">
			<div>
				<span>제목</span>
				<input type="text" name="subject" size="90">
			</div>
			<div>
				<span>작성자</span>
				<input type="text" name="writer" size="30">
			</div>
			<div>
				<span>아이디</span>
				<input type="text" name="userid" size="30">
			</div>
			<div>
				<span>비밀번호</span>
				<input type="password" name="userpass" size="30">
			</div>
		</div>
		<div class="board-write-content-jeon"><div>내용:</div> 
			<textarea rows="17" cols="100" name="content"></textarea>
		</div>
		<div class="board-write-button-jeon">
			<input type="button" value="목 록" onclick="location.href='BoardListCon.do'">
			<input type="submit" value="글쓰기">
			<input type="reset" value="다시쓰기">
		</div>
	</form>
	</div>
</body>
</html>