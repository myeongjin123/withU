<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cardgame</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">s
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/card-game.css">
</head>
<body>
 <div id="container" class="no-drag">
        <div class="board">
            <header class="menu">
                <nav class="menu-nav">
                    <div class="menu-nav-time">
                        <i class="ri-time-line"></i>
                        <strong id="player-time" class="player-time"></strong>
                    </div>
                    <div class="menu-nav-stage">
                        STAGE <strong id="player-stage"></strong>
                    </div>
                    <div class="menu-nav-reset">
                        <a href="../gamePage.jsp" class="reset-button" id="reset-button">
                            <i class="ri-home-3-fill"></i>
                        </a>
                    </div>
                </nav>
            </header>

            <main class="game">
                <div class="game-board">
                </div>
            </main>

            <div class="stage-clear"></div>
        </div>

        <div class="popup popup-layer">
            <div class="popup-content">
                <div class="popup-content-title">
                </div>

                <button class="closebtn" type="button">
                    닫기
                </button>
            </div>
        </div>
    </div>
    <script src="js/card-game.js"></script>
    <script src = "js/jquery-1.12.4.min.js"></script>
</body>
</html>