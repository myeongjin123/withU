<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/Boarddel.css">
</head>
<body>
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

</body>
</html>