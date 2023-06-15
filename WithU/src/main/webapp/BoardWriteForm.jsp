<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/include/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/Boardwrite.css">
	
	<div class="container">
	<div class="do-co">
		
		<form action="BoardWriteProcCon.do" method="post">
			<h1>게시글 작성</h1>
			<a class="do-home" href="BoardListCon.do"><i class="fa-solid fa-house-chimney"></i></a>
			<button class="do-reset" type="reset"><i class="fa-solid fa-arrow-rotate-right"></i></button>
			<div class="do-title">
				<span>제목</span>
				<input type="text" name="subject" size="90" required="required">
			</div>
			<div class="do-writer">
				<span>작성자</span>
				<input type="text" name="writer" size="30" required="required">
			</div>
			<div class="do-user">
				<div class="do-u">
					<div class="do-id">
						<span>아이디</span>
						<input type="text" name="userid" required="required">
					</div>
					<div class="do-pw">
						<span>비밀번호</span>
						<input type="password" name="userpass" required="required">
					</div>
				</div>
			</div>

		<div class="do-content">
			<div class="do-con">
				<div class="do-item">내용</div>
				<div><textarea rows="20" cols="100" name="content" id="text" required="required"></textarea></div>
			</div>
		</div>
		<div class="do-button">
			<input class="do-write" type="submit" value="등 록">
			<input class="do-cancel" type="button" value="취 소" onclick="javascript:history.back(-1)">
			<!-- <input class="do-reset" type="reset" value="다시쓰기"> -->
		</div>
	</form>
	</div>
	</div>
    <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>