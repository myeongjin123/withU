<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>게시글 삭제</h2>
		
		<form action="BoardDeleteProcCon.do" method="post">
			<table width="600" border="1">
				<tr heigth="40">
					<td width="200" align="center">패스워드</td>
					<td width="400"><input type="password" name="userpass" size="60"></td>
				</tr>
				<tr heigth="40">
					<td colspan="4" align="center">
					<input type="hidden" name="num" value="${bean.num }">
					<input type="hidden" name="pass" value="${bean.userpass }">
					
					<input type="submit" value="글삭제">
					<input type="button" onclick="location.href='BoardListCon.do'" value="전체글 보기">
					</td>
				</tr>
				
			</table>
		</form>
	</div>

</body>
</html>