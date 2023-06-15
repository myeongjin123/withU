<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/include/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/Boarddel.css">
	<div class="do-del" align="center">
		<h2>게시글 삭제</h2>
		<form action="BoardDeleteProcCon.do" method="post">
		<a class="do-home you" href="BoardListCon.do"><i class="fa-solid fa-house-chimney"></i></a>
		
			<div class="container">
				<div class="do-cpw">
					<span>패스워드</span>
					<input type="password" name="userpass" size="60">
				</div>
				
				<div class="do-button">
					<input type="hidden" name="num" value="${bean.num }">
					<input type="hidden" name="pass" value="${bean.userpass }">
					
					<input class="do-de" type="submit" value="삭 제">
				</div>
			</div>
		</form>
	</div>
    <jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>