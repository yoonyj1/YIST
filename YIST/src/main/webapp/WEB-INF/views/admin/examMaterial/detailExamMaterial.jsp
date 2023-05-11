<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-수업자료조회</title>
<style>

	div.content-wrap{
          width: 75%;
          border: 1px solid #ddd;
          border-radius: 5px;
          padding: 20px;
          margin: 20px auto;
	}
        
	div.content-area{
          width: 100%;
          margin-top: 20px;
          color: black;
          line-height: 1rem;
          padding-left: 10px;
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

    .subject-span{
          color: #8eca7d;
          font-family: 'LINESeedKR-Bd';
	}

	div.writer-area{
          margin-top: 10px;
	}

	div.writer-area p.date-p, 
	div.writer-area span.count-span{
          float: left;
          margin-right: 10px;
          margin-top: 5px;
	}

	div.attach-area{
          margin: 50px 0px;
          width: 100%;
          margin-top: 20px;
          color: black;
          line-height: 1rem;
          padding-left: 10px;
	}

	div.attach-area a{
          color: #8eca7d;
	}

</style>
</head>
<body class="navbar-fixed sidebar-fixed" id="body">

	<jsp:include page="../common/header.jsp"/>

    <c:if test="${ not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>



	<div class="card card-default">
		<div class="card-header">
			<h2>시험 자료 조회</h2>
		</div>

		<div class="card-body">

			<div class="content-wrap" id="addMaterialClass-area">
                    

 				<div class="title-area">
                    <span class="subject-span">${ em.className }</span>
					<h4>${ em.boardTitle }</h4>

					<div class="writer-area">
                        <h5>${ em.boardWriter }</h5>
                        <p class="date-p">${ em.createDate }</p>
                    </div>                     
                      
               </div>
                    
               <div class="content-area">
                    ${ em.boardContent }
                    
	               <div class="attach-area">

                        <c:choose>
        
                            <c:when test="${ empty em.originName }">
                            첨부파일이 없습니다.
                            </c:when>

                            <c:otherwise>
                            첨부파일 | <a href="${ em.changeName } " download="${ em.originName }">${ em.originName }</a>
                            </c:otherwise>

                        </c:choose>

	               </div>
                    
                    
               </div>





                    

            </div>

            <div class="btn-center">
                <button class="btn btn-primary btn-pill mr-2" type="click" onclick="modify();">수정</button>
                <button class="btn btn-light btn-pill" type="button" onclick="backToList();">취소</button>
            </div>

            


		</div>





	</div>

    <script>

        function modify(){
            location.href = 'insertForm.em?no=' + '${ em.boardNo }';
        }

        function backToList(){
            location.href = 'examMaterialAdminList.ad';
        }

    </script>

</body>
</html>