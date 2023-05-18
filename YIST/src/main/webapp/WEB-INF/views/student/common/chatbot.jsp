<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<style>
		@font-face {
			font-family: 'LINESeedKR-Rg';
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Rg.woff2') format('woff2');
			font-weight: 400;
			font-style: normal;            
		}
		
		.button-wrap{
			text-align: right; 
			padding: 30px;
			overflow: auto;
			position:relative;
		}
		
		a#chat-channel-button{
			position: fixed; 
			display:inline-block; 
			bottom:130px;
			right: 60px;
			z-index: 999; 
			text-align:center;
		}
		
		a#chat-channel-button>span{
		    line-height: 2rem;
		    font-size: 1.2rem;
		    font-family: 'LINESeedKR-Rg';
		    color: white;
		    background-color: #f7e600;
		    border-radius: 5px;
		    height: 1.5rem;
		    width: 100%;
		    display: inline-block;
		    margin-top: 15px;
		}
	</style>
</head>
<body>

	<div class="button-wrap" >
			<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js" integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
			<script src="https://kit.fontawesome.com/9824677df6.js" crossorigin="anonymous"></script>
			<script>
				Kakao.init('1dd209811fb46e598ddaea624e530cb2');

				//$("#footer").css("position","relative").css("overflow","visible");
			</script>

			<a id="chat-channel-button" href="javascript:chatChannel()"
				style="">
				
				<i class="fa-solid fa-comments fa-lg" style="color: #f7e600; font-size: 4rem;"></i>
				<br>
				<span>챗봇문의</span>
				
			</a>

			<script>
				function chatChannel() {
					Kakao.Channel.chat({
						channelPublicId : '_umvxkxj',
					});
				}
			</script>
	
	</div>



</body>
</html>