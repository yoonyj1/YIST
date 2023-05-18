<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#search-area {
  width: 100%;
  margin-bottom: 30px;
}

form {
  display: flex;
  justify-content: center;
}

select, input{
  text-align: center;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

button {
  background-color: #9cd3f4;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.post .entry-title {
  margin-top: 10px;
}
</style>
</head>
<body>
	
	<jsp:include page="common/header.jsp"/>
	
	<div class="container">
    <div class="sub08_title">
      <ul style="text-align: center;  margin-top: 40px;">
        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">학습 동영상</h2></li>
        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
        <li class="classroom"><p class="mb-15" style="margin-bottom: 40px;">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
      </ul>
    </div> 

	  <div id="search-area">
	    <form action="search.vi" method="get" align="center">
	    	<input type="hidden" name="cpage" value="1">
	      <select name="condition" id="search-type" style="width: 7%;">
	        <option value="writer">작성자</option>
	        <option value="title">제목</option>
	        <option value="content">내용</option>
	      </select>
	      <div style="width: 25%;">
	        <input type="text" id="search-keyword" name="keyword" style="width: 95%;" value="${ keyword }">
	      </div>
	      <button type="submit" style="width: 6%;">검색</button>
	    </form>
	  </div>
	  
	  <c:if test="${ not empty condition }">
        <script>
        	$(function() {
        		$("#search-area option[value=${condition}]").attr("selected", true);
        	})
        </script>
       </c:if>

    <div class="container mt-30 mb-30 pt-30 pb-30">
      <div class="row multi-row-clearfix">
        <div class="blog-posts">
          <div class="col-md-12">
            <div class="list-dashed">
              <article class="post clearfix mb-30 pb-30">
                <div class="row">
                  <div class="col-sm-5">
                    <div class="entry-header">
                      <div class="post-thumb">
                        <div class="fluid-video-wrapper">
                          <iframe src="images/yist/KakaoTalk_20230330_173845232.mp4" height="230" title="Creative" allowfullscreen></iframe>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-7">
                    <div class="entry-content mt-0">
                      <a href="#">
                      <h4 class="entry-title mt-0 pt-0">JAVA_컬렉션_우리반 도서 프로그램 만들기1</h4>
                      <p class="mb-30">2022.11.19일 줌에서 진행한 컬렉션_우리반 도서 프로그램 만들기 2탄 영상입니다.</p>
                      </a>
                      <ul class="list-inline font-12 mb-20 mt-10">
                        <li class="text-theme-colored">Admin |</li>
                        <li><span class="text-theme-colored">2022-11-19</span></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </article>
              <article class="post clearfix mb-30 pb-30">
                <div class="row">
                  <div class="col-sm-5">
                    <div class="entry-header">
                      <div class="post-thumb">
                        <div class="fluid-video-wrapper">
                          <iframe src="images/yist/KakaoTalk_20230330_173845232.mp4" height="230" title="Creative" allowfullscreen></iframe>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-7">
                    <div class="entry-content mt-0">
                      <a href="#">
                      <h4 class="entry-title mt-0 pt-0">JAVA_컬렉션_우리반 도서 프로그램 만들기1</h4>
                      <p class="mb-30">2022.11.19일 줌에서 진행한 컬렉션_우리반 도서 프로그램 만들기 2탄 영상입니다.</p>
                      </a>
                      <ul class="list-inline font-12 mb-20 mt-10">
                        <li class="text-theme-colored">Admin |</li>
                        <li><span class="text-theme-colored">2022-11-19</span></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </article>
              <article class="post clearfix mb-30 pb-30">
                <div class="row">
                  <div class="col-sm-5">
                    <div class="entry-header">
                      <div class="post-thumb">
                        <div class="fluid-video-wrapper">
                          <iframe src="images/yist/KakaoTalk_20230330_173845232.mp4" height="230" title="Creative" allowfullscreen></iframe>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-sm-7">
                    <div class="entry-content mt-0">
                      <a href="#">
                      <h4 class="entry-title mt-0 pt-0">JAVA_컬렉션_우리반 도서 프로그램 만들기1</h4>
                      <p class="mb-30">2022.11.19일 줌에서 진행한 컬렉션_우리반 도서 프로그램 만들기 2탄 영상입니다.</p>
                      </a>
                      <ul class="list-inline font-12 mb-20 mt-10">
                        <li class="text-theme-colored">Admin |</li>
                        <li><span class="text-theme-colored">2022-11-19</span></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </article>
              </c:forEach>
            </div>
          </div>
          
        </div>
      </div>
    </div>       
  </div>

	<nav style="text-align: center;">
	    <ul class="pagination">
	      <c:choose>
	      	<c:when test="${ pi.currentPage eq 1 }">
	      		<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
       	  	</c:when>
	       	<c:otherwise>
	        	<li class="page-item"><a class="page-link" href="videoList.st?cpage=${ pi.currentPage - 1 }">Previous</a></li>
	        </c:otherwise>
	      </c:choose>			
           	
          <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
          	<li class="page-item"><a class="page-link" href="videoList.st?cpage=${ p }">${ p }</a></li>
          </c:forEach>
          
          <c:choose>
        	<c:when test="${ pi.currentPage eq pi.maxPage }">
            	<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
        	</c:when>
        	<c:otherwise>
            	<li class="page-item"><a class="page-link" href="search.vi?cpage=${ pi.currentPage + 1 }">Next</a></li>
        	</c:otherwise>
          </c:choose>   
	    </ul>
	  </nav>
  
  <jsp:include page="common/footer.jsp"/>
</body>
</html>