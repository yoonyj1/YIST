<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>





    <!-- script  
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/simplebar/simplebar.min.js"></script>
	<script src="https://unpkg.com/hotkeys-js/dist/hotkeys.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/mono.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/custom.js"></script>    

    <link href="${pageContext.request.contextPath}/resources/admin/plugins/prism/prism.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/prism/prism.js"></script

	<script src="${pageContext.request.contextPath}/resources/admin/js/chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/map.js"></script>
>

	<link href="${pageContext.request.contextPath}/resources/admin/plugins/DataTables/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" />
	-->
    
    
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/plugins/material/css/materialdesignicons.min.css">
	
	
    
    <!-- MONO CSS -->
    <link id="main-css-href" rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/style.css" />

    <!--FontAwesome-->
    <script src="https://kit.fontawesome.com/9824677df6.js" crossorigin="anonymous"></script>
    
    <!-- FAVICON -->
    <link href="${pageContext.request.contextPath}/resources/admin/images/favicon.png" rel="shortcut icon" />

    <style>
        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        @font-face {
            font-family: 'LINESeedKR-Rg';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Rg.woff2') format('woff2');
            font-weight: 400;
            font-style: normal;
        }

        @font-face {
            font-family: 'LINESeedKR-Th';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Th.woff2') format('woff2');
            font-weight: 100;
            font-style: normal;
        }

        * {
            font-family: 'LINESeedKR-Rg';
        }
        
        body{
            background: white;
        }
        
        .enroll-area button {
            font-family: 'LINESeedKR-Bd';
            font-weight: 700;
        }

        button.btn-outline-primary:hover{
          background-color: #93cf82;
          border-color: #99da87;
          color:white;
        }

        button.btn-outline-primary{
          border-color: #99da87;
          color: #99da87;
        }


        table#memberInsert-table{
          line-height: 2em;
          width: 100%;
          margin-top: 50px;

        }

        table#memberInsert-table>th{
            vertical-align: middle;
            text-align: center;
            color: black;
        }

        .redMark{
            color: red;
            font-size: 1em;
            font-weight: 700;
            display: inline-block;
            margin-right: 5px;
        }

        .align-center{
            text-align: center;
        }

        .enroll-area{
            width: 1600px;
            height: auto;
            margin: 50px auto;
        }

        .enroll-area button.btn[aria-expanded="true"]{
            background-color: #99da87;
        }

        .btn-center{
          width: 100%;
          margin: 40px auto;
          text-align: center;
        }

        div.btn-center>button:first-child{
          background-color: #99da87;
          border-color: #99da87;
        }

        div.btn-center>button:first-child:hover{
          background-color: #8eca7d;
          border-color: #8eca7d;
        }

        button{
          font-family: 'LINESeedKR-Bd';
          font-weight: 700;
        }

        .modal-body button.btn.btn-outline-primary{
            color: #99da87;
        }
        

        .modal-body button.btn.btn-outline-primary:hover{
            color: white;
        }


        div.membership-area div.accordion div.card{
          float:none;
          text-align: left;
          min-height: auto;
          padding-bottom: 0;
        }

        div.membership-area div.accordion button.btn-link.collapsed{
            background-color: rgba(0, 0, 0, 0.03);
        }

        div.card-header{
            background-color: transparent;
        }


    </style>

</head>
<body>

	<jsp:include page="header.jsp"/>



    <div class="enroll-area">
	
        <div class="membership-area" style="width:80%; margin:50px auto;">
            <div class="accordion" id="accordionOne">
                <div class="card border-0">
                    <div class="card-header" id="headingOne">
                        <h2 class="mb-0">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne"
                                aria-expanded="true" aria-controls="collapseOne">
                                YIST 회원가입 약관
                            </button>
                        </h2>
                    </div>
                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionOne">
                        <div class="card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
                            wolf moon
                            officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                            Brunch 3 wolf
                            moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            Nihil anim
                            keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
                            excepteur
                            butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt
                            you probably
                            haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
                <div style="text-align: right; margin-top: 10px; padding-right: 20px;">
                    <input type="radio" name="agreeOne" id="member-agree-essential">
                    <label for="member-agree-essential" style="font-family: 'LINESeedKR-Bd';">회원가입 약관에 동의합니다(필수)</label>
                </div>
        
        
                <div class="card border-0">
                    <div class="card-header" id="headingTwo">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                개인정보취급방침
                            </button>
                        </h2>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionOne">
                        <div class="card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3
                            wolf moon
                            officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                            Brunch 3 wolf
                            moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                            Nihil anim
                            keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
                            excepteur
                            butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt
                            you probably
                            haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
                <div style="text-align: right; margin-top: 10px;  padding-right: 20px;">
                    <input type="radio" name="agreeTwo" id="member-agree-essential">
                    <label for="member-agree-essential" style="font-family: 'LINESeedKR-Bd';">개인정보취급방침에 동의합니다(필수)</label>
                </div>


                <form action="enroll.me" method="post">
                	<input type="hidden" name="sort" value="${ sort }">
                    <table class="table-bordered" id="memberInsert-table">
                        <tr>
                            <th>
                                <div class="align-center">
                                    <span class="redMark">*</span>
                                    아이디
                                </div>
                            </th>
                            <td>
                                <div class="input-group"  style="width:50%; padding:5px 10px; display: flex; flex-wrap: nowrap;">
                                    <input id="id" type="text" class="form-control" name="" placeholder="사용할 아이디를 입력하세요" style="width:40%; float:left;">                        
                                    <button id="idCheck-btn" type="button" class="mb-1 btn btn-outline-primary" style="margin: 5px;">ID 중복확인</button>
                                </div>
                                <div id="id-resultBox" class="text-daborder-danger small mt-1" style="margin-left: 10px; padding-left:10px; width: 100%; text-align:left;">
                                    아이디는 필수 입력 사항입니다.
                                </div>
                            </td>
                        </tr>
						
                        <tr>
                            <th>
                                <div class="align-center">
                                    <span class="redMark">*</span>
                                    비밀번호
                                </div>
                            </th>
                            <td id="pwd-td">
                                <div class="input-group"  style="width:40%; padding: 10px 10px 0px 10px ;">
                                    <input type="password" class="form-control" name="" placeholder="사용할 비밀번호를 입력하세요" id="pwd" style="width:100%; ">                                                           
                                </div>
                                <div id="pwd-resultBox-en" class="text-daborder-danger small mt-1" style="margin-left: 5px; padding-left:10px; width: 12%; float:left;">
                                    <span class="mdi mdi-check"></span>
                                    알파벳 대, 소문자
                                </div>
                                <div id="pwd-resultBox-num" class="text-daborder-danger small mt-1" style="margin-left: 5px; padding-left:10px; width: 5%; float:left;">
                                    <span class="mdi mdi-check"></span>
                                    숫자
                                </div>
                                <div id="pwd-resultBox-spe" class="text-daborder-danger small mt-1" style="margin-left: 5px; padding-left:10px; width: 7%; float:left;">
                                    <span class="mdi mdi-check"></span>
                                    특수문자
                                </div>
                                <div id="pwd-resultBox-len" class="text-daborder-danger small mt-1" style="margin-left: 5px; padding-left:10px; width: 15%; float:left;">
                                    <span class="mdi mdi-check"></span>
                                    8글자 이상 15글자 이하
                                </div>
                                <div id="pwd-resultBox-etc" class="text-daborder-danger small mt-1" style="margin-left: 5px; padding-left:10px; width: 15%; float:left;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="align-center">
                                    <span class="redMark">*</span>
                                    비밀번호 확인
                                </div>
                            </th>
                            <td>
                                <div class="input-group"  style="width:40%; padding: 10px;">
                                    <input type="password" class="form-control" placeholder="사용할 비밀번호와 동일한 비밀번호를 입력하세요" id="pwdCheck" style="width:100%;">                        
                                    <div id="pwdCheck-resultBox" class="text-daborder-danger small mt-1" style="margin-left: 10px; padding-left:10px; width: 100%; text-align:left">
                                        입력한 비밀번호와 동일한 비밀번호를 입력하세요.
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <script>

                        	//플래그
                            let idFlag = false; //id중복검사
                            let pwdFlag = false; //비밀번호유효성검사
                            let agreeFlag = false; //개인정보동의
                            let verifiedFlag = false; //이메일인증

							//유효성
                            const reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;
                            const num = /[0-9]/g;
                            const engSmall = /[a-z]/g;
                            const engLarge = /[A-Z]/g;
                            const spe = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
                            const hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
                            
                            
                            //입력값
                            const idResult = $("#id-resultBox");
        

                            function idCheck(){

	                            const id = $("#id").val();
                                
                                if(id.length <= 1){
                                    idResult.css("color","red");
                                    idResult.text("아이디를 한글자 이상 입력해주세요");
                                }else{
                                    idResult.text("아이디는 필수 입력 사항입니다.");
                                }

                                if(hangulcheck.test(id)){
                                    idResult.css("color","red");
                                    idResult.text("아이디에 한글을 사용할 수 없습니다.")
                                }
                                


                            }


                            function chkPW(){
        
                                let pw = $("#pwd").val();
                                let pwCheck = $("#pwdCheck").val();
        

                                
                                if(!reg.test(pw)){
                                    $("#pwd-td text-daborder-danger span").removeClass("mdi-check-all");
                                    $("#pwd-td text-daborder-danger span").addClass("mdi-check").css("color","lightgreen");

                                    $("#pwd-td text-daborder-danger").css("color","#8a909d");

                                    if(pw.length<8 || pw.length>15){

                                        $("#pwd-resultBox-len span").css("color","red");
                                        $("#pwd-resultBox-len").css("color","red");

                                        

                                    }else{
                                        $("#pwd-resultBox-len span").css("color","#8a909d");
                                        $("#pwd-resultBox-len").css("color","#8a909d");
                                    }
                                    
                                    if(!num.test(pw)){

                                        $("#pwd-resultBox-num").css("color","red");
                                        $("#pwd-resultBox-num span").css("color","red");

                                    }else{
                                        
                                        $("#pwd-resultBox-num").css("color","#8a909d");
                                        $("#pwd-resultBox-num span").css("color","#8a909d");
                                    }
                                    
                                    if(!engSmall.test(pw) || !engLarge.test(pw)){

                                        $("#pwd-resultBox-en").css("color","red");
                                        $("#pwd-resultBox-en span").css("color","red");

                                    }else{

                                        $("#pwd-resultBox-en").css("color","#8a909d");
                                        $("#pwd-resultBox-en span").css("color","#8a909d");
                                    }
                                    
                                    if(!spe.test(pw)){

                                        $("#pwd-resultBox-spe").css("color","red");
                                        $("#pwd-resultBox-spe span").css("color","red");

                                    }else{

                                        $("#pwd-resultBox-spe").css("color","#8a909d");
                                        $("#pwd-resultBox-spe span").css("color","#8a909d");
                                    }
                                   
        
                                }else{

                                    $("#pwd-td .text-daborder-danger span").removeClass("mdi-check");
                                    $("#pwd-td .text-daborder-danger span").addClass("mdi-check-all").css("color","lightgreen");

                                    $("#pwd-td .text-daborder-danger").css("color","lightgreen");
                                    
		
                                    

                                }

        
                            }
        
                            function pwdEqualCheck(){
 

                                var pw = $("#pwd").val();
                                var pwCheck = $("#pwdCheck").val();
                                
                                if(pwCheck.length >= 8 && reg.test(pw)){
                                        if(pw===pwCheck){
                                            $("#pwdCheck-resultBox").css("color","lightgreen");
                                            $("#pwdCheck-resultBox").text("비밀번호가 일치합니다");
                                            pwdFlag = true;                                            
                                        }else{
                                            $("#pwdCheck-resultBox").css("color","red");
                                            $("#pwdCheck-resultBox").text("비밀번호가 일치하지않습니다");
                                        }
                                }else{
                                    $("#pwdCheck-resultBox").css("color","#8a909d");
                                    $("#pwdCheck-resultBox").text("입력한 비밀번호와 동일한 비밀번호를 입력하세요.")
                                }
        
                            }
                            
                            function agreeCheck(){
                            	let $agreeOne = $("input[name=agreeOne]").is(":checked");
                            	let $agreeTwo = $("input[name=agreeTwo]").is(":checked");
                            	
                            	//필수 정보 동의 검사
                            	if($agreeOne && $agreeTwo){

                            		agreeFlag = true;
                            		console.log("agreeFlag : "+ agreeFlag );
                            	}else{

                            		agreeFlag = false;
                            		console.log("agreeFlag : "+ agreeFlag );

                            	}
                            	
                            }

                            function submitForm(){

                                agreeCheck();
                                
                                
                                if(idFlag && pwdFlag && agreeFlag && verifiedFlag){
                                    
                                    if(confirm("정말 가입하시겠습니까?")){
                                        
                                        return true;

                                    }else{

                                        return false;

                                    };
                                    
                                    
                                }else{
                                    
                                    alert("submitForm 결과: false");
                                    return false;
                                }
                            }
        
                            
                            
                            $(function(){
                            	

                            	
								//ID 중복 검사                                
                                $("#idCheck-btn").click(function() {
                                	
                                    const $id = $("#id").val();
                                    
    								$.ajax({
    									url:'AjaxIdCheck.me'
    									,type:'post'
    									,async: true
    									,data:{checkId:$id}
    									,success:(result)=>{
    										if(result == "NNNNY"){
    											idFlag = true;
    		                                    idResult.css("color","lightgreen");
    		                                    idResult.text("사용할 수 있는 아이디입니다. 멋진 아이디네요!");
    										}else{
    											idFlag = false;
    		                                    idResult.css("color","red");
    		                                    idResult.text("동일한 아이디가 존재합니다. 다른 아이디를 입력해주세요");
    		                                    $id.focus();
    										}
    									},error:()=>{
    										console.log('ajax 통신 실패!');
    									}
    								})	
    							})				

                            	
                            	//비밀번호 유효성 검사
                                $("#pwd").keyup(function(){

                                    if($("#pwd").val().length > 5){
                                        chkPW();
                                    }else{
                                        $("#pwd-td .text-daborder-danger span").removeClass("mdi-check-all");
                                        $("#pwd-td .text-daborder-danger span").addClass("mdi-check")
                                        $("#pwd-td .text-daborder-danger span").css("color","#8a909d");
                                        $("#pwd-td .text-daborder-danger").css("color","#8a909d");
                                    }
                                })

                                $("#pwdCheck").keyup(function(){
                                    pwdEqualCheck();
                                })

                                $("#id").keyup(function(){
                                    
                                    if($("#id").val().length > 3){
                                        idCheck();
                                    }else{
                                        idResult.css("color","#8a909d");
                                        idResult.text("아이디는 필수 입력 사항입니다.");
                                    }
                                })       









                            })


        
                        </script>


                        <tr>
                            <th>
                                <div class="align-center">
                                    <span class="redMark">*</span>
                                    이름
                                </div>
                            </th>
                            <td>
                                <div class="input-group" style="width:40%; padding: 10px;">
                                    <input type="text" name="name" class="form-control" placeholder="이름을 입력하세요"  style="width:100%;" >                        
                                </div>
                            </td>
                        </tr> 
            
            
                        <tr>
                            <th>
                                <div class="align-center" >
                                    <span class="redMark">*</span>
                                    이메일
                                </div>
                            </th>
                            <td>
                                <div class="input-group"  style="width:50%; padding:5px 10px; display: flex; flex-wrap: nowrap;">
                                    <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요"  style="width:40%;" >                        
                                    <button type="button" id="verificationBtn" class="mb-1 btn btn-outline-primary" data-toggle="modal" data-target="#verificationModal" style="margin: 5px;">본인인증</button>
                                    



                                    <!-- 모달 -->
                                    <div class="modal fade" id="verificationModal" tabindex="-1" role="dialog" aria-labelledby="verificationModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">

                                        <div class="modal-content">

                                            <div class="modal-header">
                                                <h3 class="modal-title" id="verificationModalLabel">본인 인증</h3>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true" style="font-size: 0.725em;">닫기</span>
                                                </button>
                                            </div>

                                            <div class="modal-body" style="text-align: center; color: black;">

                                                    <div style="width: 80%; padding: 10px; margin: 0 auto;">
                                                        <input type="email" name="userEmail" value="" readonly class="form-control" style="width:60%; float:left;">
                                                        <button type="button" id="sendCordBtn" class="btn btn-outline-primary">인증코드 발송</button> 
                                                        <div class="identity-area" style="display: none; width: 100%;">

                                                            <div id="identity-resultBox" style="width: 100%; height: 50px; padding: 10px 0px;">
                                                                <span style="display: block; float: left;"></span>
                                                            </div>

                                                            
                                                            <button type="button" id="resendBtn" style="float: left; margin-left: 10px;">인증코드 재전송</button>
                                                            <p style="position: relative; left: -12%; z-index: 12; top: 47px; color: red;     display: inline-block;" class="timer"></p>
                                                            
                                                            <div style="display: flex; width: 100%; position: absolute;">
                                                                <input type="text" name="code" class="form-control" placeholder="인증코드를 입력하세요" style="display:block; width:45%; float:left;">
                                                                <button type="button" id="authBtn" class="btn btn-outline-primary" style="float:left;" disabled>인증코드 확인</button>
                                                            </div>

                                                            <div id="code-resultBox" style="width: 100%; height: 50px; padding: 10px 0px;">
                                                                <span style="display: block; float: left; margin-top: 40px;"></span>
                                                            </div>

                                                        </div>

                                                    </div>



                                            <br>
                                            </div>


                                        </div>
                                    </div>
                                    <!--모달 끝-->             
                                        
                                        
        
                                    <div class="text-daborder-danger small mt-1" style="margin-left: 10px; width: 100%;">
                                        인증할 수 있는 이메일을 입력하세요
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <script>

                            // 코드 유효성 Flag
                            let codeValid = false; 

                            // 발송 후 지난 초
                            let currentTime = 0;

                            // 유효시간 
                            let minutes;
                            let seconds;
                            let timerThread;

                            // 인증코드
                            let responseCode = "";

                            // 타이머
                            let $timer = $(".timer");

                            //identity-area div
                            let $identityArea = $(".identity-area");

                            // 메세지 결과
                            let $identityResult = $("#identity-resultBox span");

                            // 코드 결과
                            let $codeResult = $("#code-resultBox span");


                            function getEmail(){

                                let $email = $("#email").val();
                                $("input[name=userEmail]").val($email);
                               

                            }

                            // 인증코드 유효시간 카운트다운 및 화면 출력
                            function timerStart(){

                                
                                // 인증코드 유효성 true
                                codeValid = true;
                                // 현재 발송 시간 초기화
                                currentTime = 0;
                                // 20초
                                let count = 300;

                                $timer.html("05:00");

                                // 1초마다 실행
                                timerThread = setInterval(function() {
                                    
                                    minutes = parseInt(count / 60, 10);
                                    seconds = parseInt(count % 60, 10);
                            
                                    minutes = minutes < 10 ? "0" + minutes : minutes;
                                    seconds = seconds < 10 ? "0" + seconds : seconds;
                            

                                    $timer.html(minutes + ":" + seconds);

                                    
                                    // 타이머 끝
                                    if (--count < 0) {
                                        timerStop();
                                        $timer.text("시간초과");
                                        $timer.css("color","red");

                                        $codeResult.text("인증코드가 만료되었습니다.");
                                        $codeResult.css("color","red");
                                    }

                                    currentTime++

                                }, 1000);
                        
                            } 

                            // 타이머 종료
                            function timerStop(){
                                // 타이머 종료
                                clearInterval(timerThread);
                                // 유효시간 만료
                                codeValid = false;
                            }

                            // 인증코드가 유효하면 true, 만료되었다면 false 반환
                            function iscodeValid(){

                                return codeValid;

                            }

                            // 인증코드 발송 후 10초가 지났는가? 지났으면 true, 안지났으면 false
                            function isRerequest(){

                                return  currentTime>=10?true:false;

                            }

                            $("#verificationBtn").click(function(){
                                getEmail();
                            })

                            // 인증코드 발송 버튼 클릭시
                            $("#sendCordBtn").click(function(){

                                // 인증코드 발송 처리
                                // 발송된 코드 
                                $.ajax({
                                    url:'AjaxSendCode.me'
                                    ,type:'post'
                                    ,data:{userEmail:$("#email").val()}
                                    ,success:(data)=>{
                                    	responseCode = data;
                                    	console.log(responseCode);
                                    },error:()=>{
                                        alert('ajax 통신 실패!');
                                    }
                                });


                                // 인증코드 발송 버튼 비활성
                                $("#sendCordBtn").attr("disabled",true);

                                $identityArea.css("display","block");

                                // 타이머 설정 및 화면에 출력
                                timerStart();


                                $identityResult.text("입력한 이메일로 인증코드 발송했습니다.");
                                $identityResult.css("color","black");


                            })


                            $("input[name=code]").keyup(function(){
                                let $length = $("input[name=code]").val().length;
                                if($length>=6){
                                    $("#authBtn").attr("disabled",false);
                                }else{
                                    $("#authBtn").attr("disabled",true);
                                }
                            })
                            
                            
                            $("input[name=code]").blur(function(){
                                
                                if(!iscodeValid()){
                                    
                                    $codeResult.text("인증코드가 만료되었습니다.");
                                    $codeResult.css("color","red");
                                    
                                }else{
                                    
                                    $("#authBtn").attr("disabled",false);

                                }
                            })

                            

                            // 인증코드 확인 버튼 클릭할 때
                            $("#authBtn").click(function(){
                                    // 타이머 시간 초과 확인
                                    if(iscodeValid()){
                                    	
                                        let $code = $("input[name=code]").val();
                                       
                                        	
                                        // 인증코드 일치 검사 
                                        if(responseCode == $code){
                                            // 통과
                                            $codeResult.text("이메일 인증 성공!")
                                            $codeResult.css("color","lightgreen");
                                            verifiedFlag = true;
                                            console.log("verifiedFlag"+verifiedFlag);
                                        }
                                        else{
                                            // 불일치
                                            $codeResult.text("이메일 인증 실패! 인증코드를 확인하세요")
                                            $codeResult.css("color","red");
                                            verifiedFlag = false;
                                            console.log("verifiedFlag"+verifiedFlag);

                                        }
                                    }
                                })

                                // 인증코드 재발송 버튼 클릭할 때
                                $("#resendBtn").click(function(){

                                        // 인증코드 발송 후 10초가 지났는지 확인
                                        if(isRerequest()){


                                            $identityResult.text("입력한 이메일로 인증코드 발송했습니다.");
                                            $identityResult.css("color","black");
                                            
                                            $.ajax({
                                                url:'AjaxSendCode.me'
                                                ,type:'post'
                                                ,data:{userEmail:$("#email").val()}
                                                ,success:(data)=>{
                                                	responseCode = data;
                                                	console.log(responseCode);
                                                },error:()=>{
                                                    alert('ajax 통신 실패!');
                                                }
                                            });
                                           

                                            // 타이머 리셋
                                            timerStop()
                                            timerStart()

                                        }
                                        else{
                                            // 인증코드 발송 거부
                                            $identityResult.text("인증코드 발송 후 10초 뒤부터 재발송이 가능합니다.");
                                            $identityResult.css("color","red");

                                        }


                                })                            

                        </script>






        
                        <tr>
                            <th>
                                <div class="align-center">
                                    생년월일
                                </div>
                            </th>
                            <td>
                                <div class="input-group" style="width:40%; padding: 10px;">
                                    <input type="date" name="birth" class="form-control">
                                </div> 
                            </td>
                        </tr>
        
        
                        <tr>
                            <th>
                                <div class="align-center">
                                    연락처
                                </div>
                            </th>
                            <td>
                                <div class="input-group"  style="width:40%; padding: 10px;">
                                    <input type="phone" name="phone" class="form-control" placeholder="연락처를 입력하세요"  style="width:100%;" >                        
                                </div>                        
                                <div class="text-daborder-danger small mt-1" style="margin-left: 10px; padding-left:10px; width: 100%; text-align:left">
                                        - 없이 숫자만 입력하세요
                                </div>
                            </td>
                        </tr>
                        
                        
                        <script  src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        <script>
        
                            function selectZipcode() {
        
        
                                new daum.Postcode({

                                oncomplete: function(data) {
                                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                    var addr = ''; // 주소 변수
                                    var extraAddr = ''; // 참고항목 변수

                                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                        addr = data.roadAddress;
                                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                        addr = data.jibunAddress;
                                    }

                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                    document.getElementById('zipcode').value = data.zonecode;
                                    document.getElementById("address").value = addr;
                                    // 커서를 상세주소 필드로 이동한다.
                                    document.getElementById("detailAddress").focus();
                                }
                            }).open({
                                popupTitle: '우편번호 검색'
                                // ,theme: themeObj
                                });
                            }
                        </script> 
                        
                               
                        <tr>
                            <th>
                                <div class="align-center">
                                    주소
                                </div>
                            </th>
                            <td>
                                <div class="input-group" style="width:40%; padding-left: 10px; padding-top: 10px; padding-bottom: 5px; display:flex; flex-wrap: nowrap; ">
                                    <input type="text" id="zipcode" name="post" placeholder="우편번호" style="width: 20%;" class="form-control">
                                    <button id="zipcodeBtn" type="button" class="btn btn-outline-primary" onclick="selectZipcode();" style="width: 35%;">우편번호 검색</button><br>
                                </div>
                                <div class="input-group" style="width:80%; padding-left: 10px; padding-bottom: 10px;">
                                    <input type="text" id="address" name="address" placeholder="주소" style="width: 40%;" class="form-control">
                                    <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" style="width: 40%;" class="form-control">
                                </div>                        
                            </td>
                        </tr>
                        



                        
                        <c:if test="${ sort eq 3 }">
                            <tr>
                                <th colspan="2">
                                    <div class="align-center">
                                        <span class="redMark">*</span>
                                        수강과목
                                    </div>
                                </th>
                            </tr>

                        <tr>
                            <td colspan="2">
                                <table id="subjectList" width="100%" style="text-align: center;">
                                    <tr>
                                        <td>과목명</td>
                                        <td>정원</td>
                                        <td>신청인원</td>
                                        <td>수강일자</td>
                                        <td>선택</td>
                                    </tr>
                                    <c:choose>
                                        <c:when test="${ empty list and sort eq 3 }">
                                            <tr><td colspan="5">수강할 수 있는 과목이 없습니다.</td></tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var='s' items="${ list }">
                                                <tr>
                                                    <td>${ s.subjectName }</td>
                                                    <td>${ s.maximumSeats }</td>
                                                    <td>${ s.currentSeats }</td>
                                                    <td>${ s.startDate } ~ ${ s.endDate }</td>
                                                    <td>
                                                        <input type="radio" name="subject" value="${s.subjectNo}">
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </table>
                            </td>
                        </tr>
                    </c:if>
                        
                    </table>
                    
                    
                    
                    <div class="btn-center">
                        <button class="btn btn-primary btn-pill mr-2" type="submit" onclick="submitForm();return false;">가입</button>
                        <button class="btn btn-light btn-pill" type="button" onclick="javascript:history.back();">취소</button>
                    </div> 
                </form>

                <script>
                
                

                </script>

            </div>
            
        
        </div>


    </div>



	 <jsp:include page="../common/footer.jsp"/>




</body>
</html>