<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
.btn-dark {
	position: absolute;
	z-index: 999;
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
	        <img src="${pageContext.request.contextPath}/resources/student/images/yist/profile.png" alt="" style="width: 100%">
	      </div>
	      <div class="col-md-10">
	        <div class="section-content">
	          <h2 class="title text-white">이윤화</h2>
	          <div class="left_subject_e text-white">
	            <ul>
	              <li class="class">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</li>
	              <li class="classroom">[강남 361] 2022. 10. 18 ~ 2023. 05. 19 ｜ 09:00 ~ 15:30</li>
	              <li>김시연 강사님</li>
	              <br>
	              <li>
	              <a href='' class="btn btn-default btn-theme-colored btn-circled">로그아웃</a>
	                <!-- <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-dark btn-theme-colored btn-circled">&nbsp;&nbsp;알림&nbsp;&nbsp;</button> -->
	                <button type="button" class="btn btn-dark btn-theme-colored btn-circled position-relative" 
	                tabindex="0" data-toggle="popover" data-bs-trigger="focus" title="알림" data-html="true" data-content="
                      <a href='testList.st'>채점이 완료되었습니다.</a>
                      <hr>
                      <a href='testList.st'>공지사항이 등록되었습니다.</a>
                      <hr>
                      <a href='testList.st'>등록하신 게시글에 댓글이 달렸습니다.</a>

                      " data-placement="right">&nbsp;&nbsp;알림&nbsp;&nbsp;
                      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
					    5
					  </span>
                      </button>
	              </li>
	            </ul>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>
	
	<script>
      $(function () {
        $('[data-toggle="popover"]').popover()
      });
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
                      <tr>
                        <td width="80%" style="text-align: left;">지하철지연으로 인한 지각 출석인정 시 제출서류 안내</td>
                        <td>2023-03-27</td>
                      </tr>
                      <tr>
                        <td style="text-align: left;">2023.01.01 ~ 2023.12.31 훈련장려금 인상 안내</td>
                        <td>2023-03-25</td>
                      </tr>
                      <tr>
                        <td style="text-align: left;">HRD-Net모바일 어플 OS업그레이드 작업 안내</td>
                        <td>2023-03-21</td>
                      </tr>
                      <tr>
                        <td style="text-align: left;">폭우로 인한 금일 지각자 출석인정 방법 및 원격훈련 전환 공지</td>
                        <td>2023-03-19</td>
                      </tr>
                      <tr>
                        <td style="text-align: left;">자습실 이용시 주의사항</td>
                        <td>2023-03-21</td>
                      </tr>
                      <tr>
                        <td style="text-align: left;">KH수강생을 위한 식권 판매 변경된 제도 안내 입니다.</td>
                        <td>2023-03-19</td>
                      </tr>
                      <tr>
                        <td style="text-align: left;">코로나19 진단검사 체계 전환에 따른 출결 인정 방법</td>
                        <td>2023-03-19</td>
                      </tr>
                  </table>
                </div>
              </section>
            </div>
          </div>
        </div>
      </div>
    </section> 
  </div> 
	<jsp:include page="common/footer.jsp"/>
</html>