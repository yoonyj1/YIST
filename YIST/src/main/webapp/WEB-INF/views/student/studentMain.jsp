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
<style>
td:hover {
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
	              <li class="class">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</li>
	              <li class="classroom">${loginUser.startDate} ~ ${loginUser.endDate}</li>
	              <li>김시연 강사님</li>
	              <br>
	              <li><a href="logout.me" class="btn btn-default btn-theme-colored btn-circled">로그아웃</a></li>
	            </ul>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	
	<script>
      /* $(function () {
        $('[data-toggle="popover"]').popover()
      }); */
    </script>
	
	<!-- <div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">알림</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-theme-colored" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div> -->
	
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
		  $(".btn").click(function() {
		    $("#myModal").modal();
		  });
		});
	</script> -->
	
    <section>
      <div class="container">
        <div class="row multi-row-clearfix">
          <div class="blog-posts">
            <div class="col-md-4">
              <section class="post clearfix mb-30 bg-lighter">
                <div class="entry-content border-1px p-20 pr-10">
                  <table id="calendar">
                    <caption>2023년 3월</caption>
                    <thead>
                      <tr>
                        <th scope="col">일</th>
                        <th scope="col">월</th>
                        <th scope="col">화</th>
                        <th scope="col">수</th>
                        <th scope="col">목</th>
                        <th scope="col">금</th>
                        <th scope="col">토</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>1</td>
                        <td>2</td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                        <td>9</td>
                      </tr>
                      <tr>
                        <td>10</td>
                        <td>11</td>
                        <td>12</td>
                        <td>13</td>
                        <td>14</td>
                        <td>15</td>
                        <td>16</td>
                      </tr>
                      <tr>
                        <td>17</td>
                        <td>18</td>
                        <td>19</td>
                        <td>20</td>
                        <td>21</td>
                        <td>22</td>
                        <td>23</td>
                      </tr>
                      <tr>
                        <td>24</td>
                        <td>25</td>
                        <td>26</td>
                        <td>27</td>
                        <td>28</td>
                        <td>29</td>
                        <td>30</td>
                      </tr>
                      <tr>
                        <td>31</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                      </tr>
                    </tbody>
                  </table>                  
                </div>
              </section>
            </div>
            <div class="col-md-8">
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