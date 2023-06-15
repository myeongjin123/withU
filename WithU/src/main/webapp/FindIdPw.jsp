<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/include/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/findIdPw.css">

	<div class="container-find">
		<div class="row-find">
			<img alt="logotitle" src="images/logotitle.png">
			<h2 class="logotitle-find">: Journey with Animals</h2>
			<form name="findscreen" method="post">
				<div class="name">
					<label for="" class="form-title-find"><i class="ri-user-3-line"></i></label>
					<input class="from-txt-find" type="text" name="name" placeholder="이름"/>
				</div>
				<div class="tel">
					<label for="" class="form-title-find"><i class="ri-smartphone-line"></i></label>
					<input class="from-txt-find" type="text" name="phone" placeholder="전화번호 '-포함'" />
				</div>
				<input type="submit" class="search-find" value="아이디 / 비밀번호 찾기" onclick="id_search()">
			</form>
		</div>
	</div>
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
		frm.action = "FindResult.jsp";
		frm.submit();
	}
</script>
</body>
</html>