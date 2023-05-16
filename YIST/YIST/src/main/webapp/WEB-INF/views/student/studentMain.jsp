<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- 캘린더 -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>

<style>
#notice td:nth-child(2):hover {
  background-color: #9cd3f4;
}
</style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>

	<div class="main-content">
    <section class="inner-header divider parallax layer-overlay overlay-dark-8" data-bg-img="images/bg/bg6.jpg">
	  <div class="container pt-60 pb-60">
	    <div class="row">
	      <div class="col-md-2">
	        <img src="${ loginUser.image }" alt="" style="width: 100%;  border-radius: 50%">
	      </div>
	      <div class="col-md-10">
	        <div class="section-content">
	          <h2 class="title text-white">${ loginUser.name }</h2>
	          <div class="left_subject_e text-white">
	            <ul style="overflow: visible;">
	              <c:forEach var="member" items="${ins}">
	              <li class="class">${ member.subjectName }</li>
	              <li class="classroom">${ member.startDate } ~ ${ member.endDate }</li>
				    <li>${ member.name }</li>
 				 </c:forEach>

	              <br>
	              <form action="test.qr" method="get">
				    <li><input type="hidden" name="url" value="http://<%= InetAddress.getLocalHost().getHostAddress() %>:8848/yist/result.att?id=${loginUser.id}"/><button type="submit" class="btn btn-default btn-theme-colored btn-circled">출석하기</button></li>
				  </form>
	              <li><a href="logout.me" class="btn btn-default btn-theme-colored btn-circled">로그아웃</a></li>
	            </ul>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	
	
	<!-- 캘린더 -->
	<script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });
    </script>
	
    <section>
      <div class="container">
        <div class="row multi-row-clearfix">
          <div class="blog-posts">
            <div class="col-md-5">
              <section class="post clearfix mb-30 bg-lighter">
                <div class="entry-content border-1px p-20 pr-10" id='calendar'>
                  <div id='calendar'></div>                  
                </div>
              </section>
            </div>
            <div class="col-md-7">
              <section class="post clearfix mb-30 bg-lighter">
                <div class="entry-content border-1px p-20 pr-10">
                  <table id="notice">
                    <caption>공지사항</caption>
                    <tbody>
                    	<!-- 공지사항 최신순으로 7개 뿌리기 -->
                    	
                    </tbody>
                  </table>
                </div>
              </section>
            </div>
          </div>
        </div>
      </div>
    </section> 
  </div> 
  
  <script>
  	$(function() {
		topNoticeList();
		
		setInterval(topNoticeList, 60000);
	})
	
	$(document).on("click", "#notice>tbody>tr", function() {
		location.href='noticeDetail.st?nno=' +  $(this).find("input").val();
	})
	
	function topNoticeList() {
		$.ajax({
			url: "mainNotice.st",
			success: function(data) {
				let value = "";
				
				for ( let i in data) {
					value += "<tr>"
						   + "<input type='hidden' value=" + data[i].boardNo +">"
						   + "<td style='text-align: left;'>" + data[i].boardTitle + "</td>"
						   + "<td>" + data[i].createDate + "</td>"
						   + "</tr>"
				}
				$("#notice tbody").html(value);
			},
			error: function() {
				console.log("메인 공지사항 ajax 통신 실패");
			}
		});
	}
	
  </script>
  
	<jsp:include page="common/footer.jsp"/>
</html>