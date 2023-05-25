<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/Boardwrite.css">
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
	<div class="container">
	<div class="do-co">
		
		<form action="BoardUpdateProcCon.do" method="post">
		
			<h1>게시글 수정</h1>
			<a class="do-home-up" href="BoardListCon.do"><i class="fa-solid fa-house-chimney"></i></a>
			<div class="do-title">
				<span>제목</span>
				<input type="text" name="subject" size="90" value="${bean.subject}">
			</div>
			<div class="do-writer">
				<span>작성자</span>
				<input type="text" name="writer" size="30" value="${bean.writer}">
			</div>
			<div class="do-user">
				<div class="do-u">
					<div class="do-id">
						<span>아이디</span>
						<input type="text" name="userid" value="${bean.userid }">
					</div>
					<div class="do-pw">
						<span>비밀번호</span>
						<input type="password" name="userpass">
					</div>
				</div>
			</div>
		
		<div class="do-content">
			<div class="do-con">
				<div class="do-item">내용</div>
				<div><textarea rows="20" cols="100" name="content">${bean.content }</textarea></div>
			</div>
		</div>
		<div class="do-button">
			<input type="hidden" name="num" value="${bean.num}">
			<input type="hidden" name="pass" value="${bean.userpass}">
			<input class="do-write" type="submit" value="수정하기">
			
		</div>
	</form>
	</div>
	</div>
    <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>