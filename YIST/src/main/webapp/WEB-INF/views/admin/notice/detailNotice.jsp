<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-공지사항상세조회</title>
<c:set var="URL" value="${pageContext.request.requestURL}" />


<style>
	div.content-wrap{
          width: 75%;
          border: 1px solid #ddd;
          border-radius: 5px;
          padding: 20px;
          margin:20px auto;
    }
        
    div.title-area{
		padding-left: 10px;
		margin-top: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid #ddd;
		height: 150px;
	}
        
	div.title-area h4{
		font-family: 'LINESeedKR-Bd';
	}
        
	div.writer-area{
		margin-top: 10px;
	}
        
	.view-span{
		color: #8eca7d;
		font-family: 'LINESeedKR-Bd';
	}
        
	div.writer-area p.date-p, 
	div.writer-area span.count-span{
		float: left;
		margin-right: 10px;
		margin-top: 5px;
	}
        
	div.content-area{
          width: 100%;
          margin-top: 20px;
          color: black;
          line-height: 1rem;
          padding-left: 10px;
	}

	div.attach-area{
          margin: 50px 0px;
          border: 1px solid #ddd;
          border-radius: 5px;
          width: 100%;
          /* height: 50px; */
          line-height: 50px;
          padding: 10px;
	}

	div.attach-area a{
          color: #8eca7d;
	}
	
	div.btn-center>button:first-child{
		background-color: #99da87;
		border-color: #99da87;
	}

	div.btn-center>button:first-child:hover{
		background-color: #8eca7d;
		border-color: #8eca7d;
	}
	
	#kakaotalk-sharing-btn{
		background-color:#FFEB00;
		color: black;
    	font-family: 'LINESeedKR-Bd';
    	margin-right: 0.625rem;
	}
	
</style>


</head>

<body class="navbar-fixed sidebar-fixed" id="body">
	<jsp:include page="../common/header.jsp"/>


	<div class="card card-default">
		<div class="card-header">
			<h2>공지사항</h2>
		</div>

		<div class="card-body">
			
           <div class="content-wrap" id="addMaterialClass-area">
                    

                  <div class="title-area">
                    <span class="view-span">
                    	열람권한 : 
						<c:choose>
							<c:when test="${ n.view eq 1 }">관리자</c:when>
							<c:when test="${ n.view eq 2 }">강사</c:when>
							<c:otherwise>전체</c:otherwise>
						</c:choose>
					</span>
                    <h4>${ n.boardTitle }</h4>

                    <div class="writer-area">
                      <h5>${ n.boardWriter }</h5>
                      <p class="date-p">${ n.createDate }</p>
                      <span class="count-span">조회수 ${ n.count }</span>
                    </div>                     
                    
                  </div>
                  
                  <div class="content-area">
					
					${ n.boardContent }
					

	                  <div class="attach-area">
	                  	<c:choose>
	                  		<c:when test="${ empty originName }">
		                      첨부파일이 없습니다.
	                  		</c:when>
	                  		<c:otherwise>
		                      첨부파일 | <a href="#" download="">첨부파일이름</a>
	                  		</c:otherwise>
	                  	</c:choose>
	                 
	                  </div>
                  
                  
                  </div>





                  

                </div>

				

                <div class="btn-center">
                    <button class="btn btn-primary btn-pill mr-2" type="button" onclick="modify();">수정</button>

                    
                    
                    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js" integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
                    <script>
                    
	        			if (!Kakao.isInitialized()) {
	        				  Kakao.init('1dd209811fb46e598ddaea624e530cb2');
	        			}
	        			
	        			
	        			//Kakao.Share.createCustomButton({
	        			    //container: '#kakaotalk-sharing-btn',
	        			    //templateId: 93424,
	        			    //templateArgs: {
	        			      //title: '${n.boardTitle}',
	        			      //description: '${n.boardContent}',
	        			      //url:'${URL}'
	        			    //},
	        			//});
	        			
					    function shareMessage() {
					        Kakao.Share.sendDefault({
					            objectType: 'feed',
					            content: {
					                title: '${n.boardTitle}',
					                description: 'YIST에서 작성된 게시글입니다.',
					                imageUrl: 'https://file.notion.so/f/s/7610af1b-6726-46fe-9215-a4473493a00b/YIST_%EA%B0%80%EB%A1%9C%EB%A1%9C%EA%B3%A0_%EA%B5%B5%EC%9D%8C.png?id=1ca55a43-6cec-44a3-8a84-d5764cec6fe9&table=block&spaceId=2c34fcf9-feb3-465e-8056-d029fc770287&expirationTimestamp=1683349548027&signature=rztH1rG-1o-SSPbRLB6LWltsk-v4byDKGIxxouPQ1Ek&downloadName=YIST+%EA%B0%80%EB%A1%9C%EB%A1%9C%EA%B3%A0_%EA%B5%B5%EC%9D%8C.png',
					                link: {
					                    webUrl: 'http://localhost:8848',
					                },
					            },
					            buttons: [
					                {
					                    title: '자세히보기',
					                    link: {
					                        webUrl: '${URL}',
					                    },
					                },
					            ],
					        });
					    }
	        			    
	        			    
	        		</script>    
                    
                    
                    
                    <a id="kakaotalk-sharing-btn" href="javascript:;" class="btn btn-pill" onclick="shareMessage();">
					  <!--
					  	<img src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png" alt="카카오톡 공유 보내기 버튼" style="width:50px;"/>
					  -->
					  카카오톡 공유하기
					</a>
					
                    <button class="btn btn-light btn-pill" type="button" onclick="javascript:history.back();">뒤로</button>         
	        		       
                 </div> 
                 


		</div>

		<script>
		

			
		
			function modify() {
				location.href="updateForm.no?no="+${ n.boardNo};
			}
		
		</script>



	</div>




</body>
</html>