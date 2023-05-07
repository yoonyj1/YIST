<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://unpkg.com/video.js/dist/video-js.min.css" rel="stylesheet">
<script src="https://unpkg.com/video.js/dist/video.min.js"></script>
<title>Insert title here</title>
<style>
    table {
    border-collapse: collapse;
    width: 100%;
    margin: 13px 0 37px 0;
    text-align: center;
  }
  
  caption {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
    text-align: center;
  }
  
  th,
  td {
    height: 50px;
    padding: 10px;
    border: 1px solid #c4c4c4;
  }

  th {
    background-color: #eee;
    font-weight: bold;
    font-size: 18px;
  }
  
  td {
    font-size: 15px;
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

</style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>
	
	<div class="container">
    <div class="sub08_title">
      <ul style="text-align: center; margin-top: 40px">
        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">학습동영상</h2></li>
        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
      </ul>
    </div> 
    <div class="entry-content">
      <table id="contentArea" align="center" class="table" style="margin-top: 10px;">
        <tr>
            <th style="text-align: center;">제목</th>
            <td colspan="3" style="text-align: left;">JAVA_컬렉션_우리반 도서 프로그램 만들기1</td>
        </tr>
        <tr>
            <th width="10%" style="text-align: center;">작성자</th>
            <td width="40%" style="text-align: left;">관리자</td>
            <th width="10%" style="text-align: center;">작성일</th>
            <td width="40%" style="text-align: left;">2023-03-27</td>
        </tr>
        <tr>
            <td colspan="4">
              <div style="padding: 50px; font-size: 18px; line-height: 2;">
                <p style="height:auto">
                  2022.11.19일 줌에서 진행한 컬렉션_우리반 도서 프로그램 만들기 1탄 영상입니다.
                </p>
              <div class="post-thumb" style="margin: 40px;">
                <div class="fluid-video-wrapper">
                  <video id="vid1" class="video-js vjs-big-play-button vjs-big-play-centered"
				        data-setup='{"controls": true, "fluid": true, "autoplay": false, "muted": true, "playbackRates": [0.5, 1, 1.5, 2]}'>
				        <source src="http://vjs.zencdn.net/v/oceans.mp4" type="video/mp4">
				        <source src="//vjs.zencdn.net/v/oceans.webm" type="video/webm">
				    </video>
                </div>
              </div>
              </div>
            </td>
        </tr>
      </table>
      <div class="">
        <table>
          <tr>
            <td width=15% style="text-align: center;"><i class="pe-7s-angle-up"></i> 이전글</td>
            <td style="text-align: left;" >
              <a href="">JAVA_객체다형_추상메소드_인터페이스</a> 
            </td>
        </tr>
        <tr>
            <td style="text-align: center;"><i class="pe-7s-angle-down"></i> 다음글</td>
            <td style="text-align: left;">
              <a href="">JAVA_컬렉션_우리반 도서 프로그램 만들기2</a> 
            </td>
        </tr>
        </table>
        
      </div>  
      <div style="text-align: center; margin: 50px;">
        <a href="#" class="btn btn-gray btn-theme-colored btn-circled"><i class="fa fa-home"></i> 목록으로</a>
      </div> 
    </div>       
  </div>
  
  <jsp:include page="common/footer.jsp"/>
  
</body>
</html>