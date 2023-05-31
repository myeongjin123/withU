<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ra_minigame</title>
    <style>
        .main{
            width: 400px;
            height: 700px;
            background: url('images/main.jpg');
            position: relative;
        }

        #start-button{
            position: absolute;
            top: 295px;
            left: 100px;
            border-radius: 5px;
            font-size: 24px;
            background-color: #3d46e9;
            color:#fff;
            z-index: 1000;
            border: 1px solid #000;
            padding: 5px 20px;
        }

        #start-button:hover{
            background-color: #008cff;
        }

        #game-over{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            display: none;
        }
    </style>
</head>
<body>
    <div class="main">
        <button id="start-button">게임 시작하기</button>
    </div>
    
    <div id="game-over">
        <button id="restart-btn">Restart</button>
    </div>

    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        $(function(){
            $('#start-button').click(function(){
                $('.main').css("display", "none");
            })
        });
    </script>
</body>
</html>