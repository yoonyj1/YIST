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
	
	<div class="card card-default">
		<div class="card-header">
			<h2>시험 자료 조회</h2>
		</div>

		<div class="card-body">

			<div class="content-wrap" id="addMaterialClass-area">
                    

 				<div class="title-area">

					<h4>정보처리산업기사 실기 스터디 6주 과정 32일차(4월 13일)</h4>

					<div class="writer-area">
                        <h5>관리자</h5>
                        <p class="date-p">2023.03.17</p>
                        <span class="count-span">0</span>
                    </div>                     
                      
               </div>
                    
               <div class="content-area">
                      Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quia facere sed iste sit illum ipsa vero? Aspernatur, aperiam! Delectus cupiditate aperiam tempora inventore commodi consequatur quos consequuntur deserunt architecto. Voluptatibus.
                      Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima quibusdam unde animi nostrum suscipit aliquid distinctio odit voluptas. Tempora optio distinctio fugit neque ratione. Dolorum aspernatur voluptas beatae expedita aliquam?
                      Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis repellendus dolorem atque alias quasi, cupiditate aut pariatur ullam molestiae nemo animi distinctio necessitatibus odit magni illo. Fugit numquam veniam ad?
                      Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum harum dolores quibusdam at nostrum obcaecati quis nihil odit repellendus dolorem rem eos explicabo, tenetur esse consectetur a, incidunt blanditiis earum?
                    
	               <div class="attach-area">
	                        <!--첨부파일 있을 때-->
	                        첨부파일 | <a href="#" download="">첨부파일이름</a>
	                        <!--첨부파일 없을 때-->
	                        첨부파일이 없습니다.
	               </div>
                    
                    
               </div>





                    

            </div>

            <div class="btn-center">
                <button class="btn btn-primary btn-pill mr-2" type="submit">수정</button>
                <button class="btn btn-light btn-pill" type="button" onclick="javascript:history.back();">취소</button>
            </div>

            


		</div>





	</div>

</body>
</html>