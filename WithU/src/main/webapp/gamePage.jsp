<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page = "/include/header.jsp" />
<link rel = "stylesheet" href = "css/gamepage.css">

<div class = "container">
	<ul class ="game-ul">
		<li class = "game-li">
			<div class = "card-game">
			<a href = "tosun-cardgame/card-game.jsp">
				<img src ="images/card-game-startpage.png" id = "game-img">
				</a>
			</div>
		</li>
		<li class = "game-li">
		<div class = "shooting-game">
				<img src="images/gogame-back.jpg" >
				<div class = "shooting-game-button">
				<a href = "character.jsp"><img src = "images/start_button.png"></a>
				</div>
			</div>
		</li>
	</ul>
</div>
<jsp:include page = "/include/footer.jsp" />
