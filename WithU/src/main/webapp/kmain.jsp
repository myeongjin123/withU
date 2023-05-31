<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="css/main.css">


<%
String id = (String) session.getAttribute("sId");
// String kid = (String) session.getAttribute("kid");
String kid = (String) session.getAttribute("kid");
%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
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
				<a href="index.jsp"> <img src="images/withuLogo.png" alt="logo">
				</a>

				<ul class="gnb-k">
					<li><a href="#">Go Game</a></li>
					<li><a href="BoardList.jsp">게시판</a></li>
					<li><a href="character.jsp">캐릭터 소개</a></li>
					<li><a href="developer.jsp">개발자 소개</a></li>
				</ul>
				
				<div class="welcome">
					<p>
						<span>Kakao User
						</span>님 반갑습니다.
					</p>
				</div>
				<div class="logout">
					<button onclick="kakaoLogout()" id="kakaoLogout">
						Logout <i class="fa-solid fa-arrow-right-from-bracket"></i>
					</button>
				</div>

			</div>
		</div>
	</header>


        <div class="banner-k">
            <video src="images/-82659.mp4" autoplay loop muted></video>
            <div class="textbox-k">
                <h1>Let's Start Game!!!</h1>
                <p>Once upon a time, in a vast galaxy, animals embarked on a cosmic quest for new planet. <br />
                With courage and curiosity, they soared through the infinite expanse, guided by the twinkling stars. <br />
                Together, they explored distant planets, each uniquely suited for their needs. <br />
                The lion found a majestic savannah, the dolphin a shimmering ocean, and the eagle a boundless sky. <br />
                United by their shared journey, the animals discovered that in the vastness of the universe, there's a place for every creature to call home. <br />
                And so, they lived happily ever after among the stars.</p>
            </div>
        </div>
        
        <div class="hero">
            <div class="char1">
                <img class="character" src="./images/test-img.png" alt="test-img">
            </div>
            <div class="char2">
                <img class="character" src="./images/test-img.png" alt="test-img">
            </div>
            <div class="char3">
                <img class="character" src="./images/test-img.png" alt="test-img">
            </div>
            <div class="char4">
                <img class="character" src="./images/test-img.png" alt="test-img">
            </div>
            <div class="char5">
                <img class="character" src="./images/test-img.png" alt="test-img">
            </div>
            <div class="char6">
                <img class="character" src="./images/test-img.png" alt="test-img">
            </div>
        </div>
            <!-- 도연 개발자 소개 + 풋터 -->
    <div class="do-pr">
        <div class="container-k">
            <div class="do-ppr">
                <div class="do-img">
                    <div class="do-slide">
                        <img src="images/강우성.jpg" alt="강우성">
                        <img src="images/김도연.jpg" alt="김도연">
                        <img src="images/전여경.jpg" alt="전여경">
                        <img src="images/차명진.jpg" alt="차명진">
                        <img src="images/최누리.jpg" alt="최누리">
                        <img src="images/홍정원.jpg" alt="홍정원">
                    </div>
                </div>
            
                <div class="do-content">
                    <h1>Who We Are</h1>
                    <div class="do-item">
                        <p>우리 XXTX는 같은 곳을 바라보고 서로가 서로를 발전시키기 위해 앞으로 나아가는 팀입니다.</p>
                    </div>
                    <div class="do-box">
                        <a href="#">View more<span><i class="fa-solid fa-share"></i></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/include/footer.jsp"></jsp:include>







