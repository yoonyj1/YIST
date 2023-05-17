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

    <div id="search-area" style="margin-bottom: 40px;">
      <form action="" method="get" align="center">
        <select name="search-type" id="search-type" style="width: 7%;">
          <option value="writer">작성자</option>
          <option value="title">제목</option>
        </select>
        <div style="width: 25%;">
          <input type="text" id="search-keyword" name="keyword" style="width: 95%;">
        </div>
        <button type="submit" style="width: 6%;">검색</button>
      </form>
    </div>

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
              
            </div>
          </div>
          
        </div>
      </div>
    </div>       
  </div>

  <nav style="text-align: center; margin-bottom: 40px;">
    <ul class="pagination">
      <li>
        <a href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a>
      </li>
      <li><a href="#">1</a></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
      <li>
        <a href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
  
  <jsp:include page="common/footer.jsp"/>
</body>
</html>