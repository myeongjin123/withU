<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglibprefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<%
String id = (String) session.getAttribute("sId");
%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="./css/header.css">

<!-- <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js" integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
 -->
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/script.js"></script>
</head>
<body>
	<header>
		<div class="container-k">
			<div class="row-k">
				<a href="index.jsp"> <img src="images/withuLogo3.png" alt="logo">
				</a>

				<ul class="gnb-k">
					<li><a href="#">Go Game</a></li>
					<li><a href="BoardList.jsp">게시판</a></li>
					<li><a href="character.jsp">캐릭터 소개</a></li>
					<li><a href="developer.jsp">개발자 소개</a></li>
				</ul>

				<%
				if (id == null) {
				%>
				<div class="member">

					<a class="log">Login <i
						class="fa-solid fa-arrow-right-to-bracket"></i></a>

					<div class="log-bg">
						<div class="log-content">
							<div class="log-form">
								<div>
									<p class="log-title">With You</p>
									<p class="log-title-a">Journey with Animals</p>
								</div>

								<div class="log-main">
									<button type="button" id="button">X</button>
									<h1>LOGIN</h1>

									<form action="loginProc.jsp" method="post">
										<div class="userid">
											<input type="text" name="id" placeholder="아이디">
										</div>
										<div class="pw">
											<input type="password" name="password" placeholder="비밀번호">
										</div>
										<div class="submit">
											<input type="submit" name="submit" value="로그인">
										</div>
									</form>

									<div class="log-register">

										<a href="#">ID/PW 찾기</a> <a href="#">회원 가입</a>
									</div>

									<p class="log-explain">또는 소설 계정으로 로그인</p>

									<div class="log-sns">
										<div class="kakao">
											<a href="javascript:kakaoLogin()" id="kakao-login-btn">
												<img src="<c:urlvalue="../images/kakao_login_large_wide.png"/ >" />
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<a href="register.jsp">Join <i class="fa-solid fa-user-plus"></i></a>

				</div>
				<%
				} else {
				%>
				
					<div class="welcome">
						<p>
							<span>"<%=id%>"
							</span>님 반갑습니다.
						</p>
					</div>
					<div class="logout">
						<button onclick="location.href='logout.jsp'">
							로그아웃 <i class="fa-solid fa-arrow-right-from-bracket"></i>
						</button>
					</div>
				
				<%
				}
				%>


			</div>
		</div>
	</header>