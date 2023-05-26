<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<form name="findscreen" action="FindIdProc" method="post">
		<label for="">이름</label>
		<input type="text" name="name" placeholder="이름"/>
		<label for="">전화번호</label>
		<input type="text" name="phone" placeholder="전화번호" />
		
		<input type="submit" value="찾기" onclick="id_search()">
		<input type="button" value="취소" onclick="location.href='FindIdPw.jsp'" />
	</form>
	
<script>
	function id_search() {
		var frm = document.findscreen;
		
		if (frm.name.value.length < 1) {
			alert("이름을 입력해주세요.");
			return;
		}
		
		if (frm.phone.value.length != 13) {
			alert("전화번호를 정확하게 입력해주세요.");
			return;
		}
		
		frm.method = "post";
		frm.action = "FindIdResilt.jsp";
		frm.submit();
	}
</script>
</body>
</html>