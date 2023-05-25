$(function(){
    $(".hero>div").mouseenter(function(){
        $(this).find(".character").stop().fadeIn();
    });
    $(".hero>div").mouseleave(function(){
        $(this).find(".character").stop().fadeOut();
    })
})

$(function(){
   setInterval(mySlide,4000);

});

function mySlide(){
    $('.do-slide').animate({
        'left': '-300px'
    },3000, function(){
        //슬라이드인 안에 있는 첫번째 이미지를 복제해서(clone) 슬라이드인의 뒤에 붙여라(appendTo)
        $('.do-slide img:first-child')
        .clone().appendTo('.do-slide');
        $('.do-slide img:first-child').remove();
        $('.do-slide').css('left',0);
    });
    }
    
    //로그인
    $(function(){
    $('.log').click(function(){
        $('.log-bg').fadeIn();
    })
    $('#button').click(function(){
        $('.log-bg').fadeOut();
    })
})//jquery

$(document).ready(function() {
    $(".tab_title li").click(function() {
      var idx = $(this).index();
      $(".tab_title li").removeClass("on");
      $(".tab_title li").eq(idx).addClass("on");
      $(".tab_cont > div").hide();
      $(".tab_cont > div").eq(idx).show();
    })
  });

// function fadeInOut(){
//     $('.do-slide img:eq(0)')
//     .fadeOut(300)
//     .next()
//     .fadeIn(300)
//     .end()
//     .appendTo('.do-slide'); 
// }

function sPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var address = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    address = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    address = data.jibunAddress;
                }
                var extraRoadAddr = ""; //참고항목 
                //도로명에 동,로,가가 있는 경우 추가
                if(data.bname !== '' &&/[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
            }
            //건물명, 공동주택 추가
            if(data.bname !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== ''?','+data.buildingName : data.buildingName);
            }
                //표시할 참고항목이 있을 경우
                if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = address;
                document.getElementById("address").value += extraRoadAddr;
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("detailaddr").focus();
            }
        }).open();

}

function registerJS(){
	//변수정의
	
	const username = document.getElementById("username");
	const userid = document.getElementById("userid");
	const userpass = document.getElementById("userpass");
	const reuserpass = document.getElementById("reuserpass");
	const useremail = document.getElementById("useremail");
	const tel = document.getElementById("tel");
	const postcode = document.getElementById("postcode");
	const address = document.getElementById("address");
	const detailaddr = document.getElementById("detailaddr");
	const birth = document.getElementById("birth");

	//아이디확인
	if(username.value ==""){
		alert("이름을 입력하세요.");
		username.focus();
		return false;
	}
	else if(userid.value==""){
		alert("아이디를 입력하세요.");
		userpass.focus();
		return false;
	}
	else if(userpass.value==""){
		alert("비밀번호를 입력하세요.");
		userpass.focus();
		return false;
	}
	else if(userpass.value != reuserpass.value){
		alert("비밀번호가 다릅니다. 비밀번호를 다시 확인하세요.");
		userpass.focus();
		return false;
	}
	else if(useremail.value==""){
		alert("이메일을 입력하세요.");
		useremail.focus();
		return false;
	}
	else if(tel.value==""){
		alert("전화번호를 입력하세요.");
		tel.focus();
		return false;
	}
	else if(postcode.value==""){
		alert("우편번호를 입력하세요.");
		postcode.focus();
		return false;
	}
	else if(address.value==""){
		alert("주소를 입력하세요.");
		detailaddr.focus();
		return false;
	}
	else if(detailaddr.value==""){
		alert("상세주소를 입력하세요.");
		detailaddr.focus();
		return false;
	}
	else if(birth.value==""){
		alert("생년월일을 입력하세요.");
		birth.focus();
		return false;
	}
	else if(birth.value.length <8 || birth.value.length >8){
		alert("생년월일을 8글자로 입력하세요.");
		birth.focus();
		return false;
	}
	//이상이 없을 경우
	document.register.submit();
	
}        


