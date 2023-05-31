
const startButton = document.getElementById('start-button');
startButton.addEventListener('click', startGame);

function startGame(){

//캔버스 세팅
let canvas;
let ctx;
canvas = document.createElement("canvas");
ctx = canvas.getContext("2d");
canvas.width = 400;
canvas.height = 700;
document.body.appendChild(canvas);

let backgroundImage;
let animalImage;
let bulletImage;
let targetImage;
let gameOverImage;



let gameOver = false; //true 이면 게임이 끝나고 false이면 게임이 안 끝남

let score = 0;

//우주선 좌표
let animalX = canvas.width / 2 - 32;
let animalY = canvas.height - 85;

let bulletList = []; //총알을 저장하는 리스트

function bullet(){
    this.x = 0;
    this.y = 0;
    this.init = function(){
        this.x = animalX + 20;
        this.y = animalY;
        this.alive = true; //true 살아있는 총알, false 죽은 총알

        bulletList.push(this);
    };

    this.update = function(){
        this.y -= 7; 
    };

    this.checkHit = function(){
        for(let i = 0; i < targetList.length; i++){
            if(this.y <= targetList[i].y 
            && this.x >= targetList[i].x 
            && this.x <= targetList[i].x + 40){
                //총알이 죽고 적군이 없어짐, 점수 획득
                score++;
                this.alive = false; //죽은 총알
                targetList.splice(i, 1);
            };
        };
        
    };
}

function generateRandomValue(min, max){
    let randomNum = Math.floor(Math.random()*(max-min+1))+min;
    return randomNum;
}

let targetList = [];

function target(){
    this.x = 0;
    this.y = 0;
    this.init = function(){
        this.y = 0; //최상단에서 시작
        this.x = generateRandomValue(0, canvas.width-48);
        targetList.push(this);
    };

    this.update = function(){
        this.y += 2; //적군 내려오는 속도 조절, 레벨이 될 수 있음

        if(this.y >= canvas.height - 48){
            gameOver = true;
            //console.log("gameover");
        }
    };
}


function loadImage(){
    backgroundImage = new Image();
    backgroundImage.src = "images/hong-back.jpg";

    animalImage = new Image();
    animalImage.src = "images/ham-f.png";

    bulletImage = new Image();
    bulletImage.src = "images/hong-b.png";

    targetImage = new Image();
    targetImage.src = "images/hong-a.png";

    gameOverImage = new Image();
    gameOverImage.src = "images/gameover.png";

}



let keysDown={};
function setupKeyboardListener(){
    document.addEventListener("keydown", function(event){
        //console.log("키", event.key);
        keysDown[event.key] = true;
        //console.log("키 다운 객체에 들어간 값은?", keysDown);
    });
    document.addEventListener("keyup", function(event){
        delete keysDown[event.key];
        //console.log("버튼 클릭 후", keysDown);

        if(event.key == " "){ //event.key == 32
            createbullet(); //총알 생성
        }
    });
}

function createbullet(){
    //console.log("총알 생성");
    let b = new bullet(); //총알 하나 생성
    b.init();
    //console.log("새로운 총알 리스트", strawberryList);
}

function createtarget(){
    const interval = setInterval(function(){
        let e = new target();
        e.init();
    }, 1000);
}

function update(){
    if('ArrowRight' in keysDown){ //right (39 in keysDown)
        animalX += 5;
    }
    if('ArrowLeft' in keysDown){ //left (37 in keysDown)
        animalX -= 5;
    }

    //우주선의 좌표값이 무한대로 업데이트 되는것이 아닌
    //경기장 안에서만 있게 하려면?

    if(animalX <= 0){
        animalX = 0;
    }

    if(animalX >= canvas.width - 64){
        animalX = canvas.width - 64;
    }

    //총알의 y좌표 업데이트 하는 함수 호출
    for(let i = 0; i < bulletList.length; i++){
        if(bulletList[i].alive){
            bulletList[i].update();
            bulletList[i].checkHit();
        }
    }

    for(let i = 0; i < targetList.length; i++){
        targetList[i].update();
    }
}

function render(){
    ctx.drawImage(backgroundImage, 0, 0, canvas.width, canvas.height);
    ctx.drawImage(animalImage, animalX, animalY);
    ctx.fillText(`Score:${score}`, 20, 20);
    ctx.fillStyle = "white";
    ctx.font = "16px Arial";

    for(let i = 0; i<bulletList.length; i++){
        if(bulletList[i].alive){
        ctx.drawImage(bulletImage, bulletList[i].x, bulletList[i].y);
        }
    }

    for(let i = 0; i < targetList.length; i++){
        ctx.drawImage(targetImage, targetList[i].x, targetList[i].y);
    }
}  

function main(){
    if(!gameOver){
    update(); // 좌표값을 업데이트 하고
    render(); // 그려주고
    //console.log("animation calls main function");
    requestAnimationFrame(main);
    }else{
        ctx.drawImage(gameOverImage, 0, 100, 400, 380);
        var restartBtn = document.createElement("button");
        restartBtn.textContent = "다시 시작하기";
        restartBtn.addEventListener("click", function () {
          location.reload(); // 새로고침을 통해 다시 시작
        });
        document.body.appendChild(restartBtn);
    }
}



loadImage();
setupKeyboardListener();
createtarget();
main();




}











//방향키를 누르면
//우주선의 xy좌표가 바뀌고
//다시 render 그려준다


//총알 만들기
//1. 스페이스 바를 누르면 총알 발사
//2. 총알 발사 = 총알의 값이 --; 총알의 x 값은?
//스페이스를 누른 순간의 우주선의 x좌표
//3. 발사 된 총알들은 총알 배열에 저장한다.
//4. 총알들은 x,y 좌표값이 있어야 한다.
//5. 총알 배열을 가지고 render 그려준다.


//적군 만들기
// x, y, init, update
//적군 위치가 랜덤하다
//적군은 밑으로 내려온다 = y좌표 증가
//1초마다 하나씩 적군이 나온다
//적군의 우주선이 바닥에 닿으면 게임 오버
//적군과 총알이 만나면 우주선이 사라진다  = 점수 1점 획득


//적군이 죽는다 == 총알이 적군에게 닿는다
// 닿는다 == 총알 y <= 적군 y && 총알 x >= 적군 x && 총알 x <= 적군 x + 적군 넓이
// 닿으면 죽고 적군의 우주선이 없어짐, 점수 획득