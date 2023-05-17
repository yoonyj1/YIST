<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
</head>
<body class="">

  <c:if test="${ not empty loginUser }">
	<jsp:include page="chatbot.jsp"/>
  </c:if>  
  
  <!-- Footer -->
  <footer id="footer" class="footer divider parallax layer-overlay overlay-dark-9" data-bg-img="resources/images/bg/bg7.jpg" data-parallax-ratio="0.7">

	<div class="container pt-70 pb-40">
      <div class="row">
        <div class="col-md-6 col-md-offset-3 text-center">
          <p class="maincopy">
            KH정보교육원&nbsp;｜&nbsp;사업자등록번호 : 851-87-00622&nbsp;｜&nbsp;서울 강남 제2014-01호 <br> 
            대표자 : 양진선&nbsp;｜&nbsp;책임자 : 최홍석&nbsp;｜&nbsp; 개인정보관리책임자 : 양진선
          </p>
          <p class="subcopy" style="padding-bottom: 10px;">
            강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F<br>
            강남지원 2관 : 서울특별시 강남구 테헤란로10길 9 그랑프리 빌딩 4F, 5F, 7F<br>
            강남지원 3관 : 서울특별시 강남구 테헤란로 130 호산빌딩 5F, 6F<br>
          </p>
          <p class="subcopy copyright" style="font-size:11px; color:#656565;">
            Copyright&nbsp;©&nbsp;1998-<script>document.write(new Date().getFullYear())</script>2023&nbsp;KH Information Educational Institute All Right Reserved
          </p>
          
        </div>
      </div>
    </div>
  </footer>
  
  
<!-- JS | Custom script for all pages -->

<!-- <script src="resources/js/custom.js"></script> -->

</body>

</html>