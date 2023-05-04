<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-공지사항상세조회</title>


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
                    <button class="btn btn-light btn-pill" type="button" onclick="javascript:history.back();">취소</button>
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