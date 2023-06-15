<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>

<jsp:include page="/include/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/register.css">

    <div class="container">
        <h1 class="reg-title">회원가입</h1>
        <hr>
        <form action="registerProc.jsp" name="register" class ="register"  method = "post">
            <div class="block">
                <label for="username">이름</label>
                <input class="input" type="text" name="username" id="username" >
            </div>
            <div class="block">
                <label for="userid">아이디</label>
                <input class="input" type="text" name="userid" id="userid"  >
                <button type="button" onclick="checkid()" class="top-btn">중복검사</button>
            </div>
            <div class="block">
                <label for="userpass">비밀번호</label>
                <input class="input" type="password" name="userpass" id="userpass" >
            </div>
            <div class="block">
                <label for="reuserpass">비밀번호 확인</label>
                <input class="input" type="password" name="reuserpass" id="reuserpass" >
            </div>
            <div class="block">
                <label for="email">이메일</label>
                <input class="input" type="email" name="useremail" id="useremail" >
            </div>
            <div class="block">
                <label for="tel">전화번호</label>
                <input class="input" type="tel" name="tel" id="tel" placeholder ="'-'까지 입력해주세요. 예시) 010-0000-0000" >
            </div>
            <div class="block">
                <label for="postcode">우편번호</label>
                <input class="input" type="number" name="postcode" id="postcode" readonly >
                <button type="button" onclick="sPostcode();" class="top-btn">찾기</button>
            </div>
            <div class="block">
                <label for="addr">주소</label>
                <input class="input" type="text" name="address" id="address" readonly />
            </div>
                <div class="block">
                <label for="detailaddr">상세주소</label>
            <input class="input" type="text" name="detailaddr" id="detailaddr"  />
            </div>
            <div class="block">
                <label for="birth">생일</label>
                <input class="input" type="number" name="birth" id="birth" placeholder = "생년월일 숫자 8자리를 입력해주세요. " >
            </div>
            <div class="ok">
            <button type="reset" class="under-btn">초기화</button>
            <button type ="button" onClick ="registerJS();" class="under-btn"> 회원가입 </button>
            </div>
        </form>
    </div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src ="js/script.js"></script>
	</body>
	</html>