<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="wrapper">
			<!-- 헤더 -->
			<jsp:include page="../instructor/common/header.jsp"></jsp:include>
			
			<div class="content-wrapper table-hover">
        <div class="content"><!-- For Components documentaion -->
          <!-- 메인 -->
          <div class="row">
            <div class="col">
              <div align="center" style="font-size: 25px; color: black;">평가목록</div>
              <hr>
              <table class="table" style="text-align: center;">
                <thead style="background-color: lightgray;">
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">과목</th>
                    <th scope="col">평가명</th>
                    <th scope="col">구분</th>
                    <th scope="col">평가일</th>
                    <th scope="col">평가</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td scope="row">1</td>
                    <td>자바기초</td>
                    <td>자료형과 연산자</td>
                    <td>서술형</td>
                    <td>2023-04-01</td>
                    <td>
                      <button type="button" class="test-start mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;">시작</button>
                      <button type="button" class="test-score mb-1 btn btn-pill btn-secondary" data-toggle="modal" data-target="#examModal" style="height: 25px; line-height: 10px;" disabled>채점</button>
                      <!-- 채점 모달 -->
                      <div class="modal fade" id="examModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-xl" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">[자바기초] 자료형과 연산자</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <!-- 시험참여 학생 목록 -->
                              <div class="table-hover">
                                <table class="table">
                                  <thead style="background-color: darkgray;">
                                    <tr>
                                      <th scope="col">번호</th>
                                      <th scope="col">이름</th>
                                      <th scope="col">점수</th>
                                      <th scope="col">상태</th>
                                      <th scope="col"></th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <!-- 미완료시 채점 비활성화 -->
                                    <tr>
                                      <td scope="row">1</td>
                                      <td>조진원</td>
                                      <td>0/100</td>
                                      <td>미완료</td>
                                      <td><button type="button" class="mb-1 btn btn-pill btn-primary" disabled>채점</button></td>
                                    </tr>
                                    <!-- 완료시 채점 활성화 -->
                                    <tr>
                                      <td scope="row">2</td>
                                      <td>김진원</td>
                                      <td>0/100</td>
                                      <td>완료</td>
                                      <td><button type="button" class="mb-1 btn btn-pill btn-primary" data-toggle="modal" data-target="#score1">채점</button></td>
                                    </tr>
                                    
                                    <!-- 채점후 미통과 -->
                                    <tr>
                                      <td scope="row">2</td>
                                      <td>박진원</td>
                                      <td>50/100</td>
                                      <td>완료</td>
                                      <td><button type="button" class="mb-1 btn btn-pill btn-primary" data-toggle="modal" data-target="#score2">채점</button></td>
                                    </tr>
                                    <!-- 채점후 통과 -->
                                    <tr>
                                      <td scope="row">3</td>
                                      <td>이진원</td>
                                      <td>80/100</td>
                                      <td>완료</td>
                                      <td><button type="button" class="mb-1 btn btn-pill btn-primary">채점</button></td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                              <!-- 시험참여 학생 목록 끝 -->
                            </div>

                            <div class="modal-footer">
                              <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal">닫기</button>
                              <button type="button" class="btn btn-primary btn-pill" disabled>채점완료</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      <button type="button" class="test-end mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" disabled>종료</button>
                    </td>
                  </tr>

                  <tr>
                    <td scope="row">2</td>
                    <td>자바기초</td>
                    <td>조건문과 반복문</td>
                    <td>서술형</td>
                    <td>2023-04-11</td>
                    <td>
                      <button type="button" class="test-start mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" disabled>시작</button>
                      <button type="button" class="test-score mb-1 btn btn-pill btn-secondary" style="height: 25px; line-height: 10px;" disabled>채점</button>
                      <button type="button" class="test-end mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" disabled>종료</button>
                    </td>
                  </tr>

                </tbody>
              </table>
            </div>
            
            
            
            						<!-- 채점 모달 -->
                                      <div class="s-modal modal fade" id="score1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                        aria-hidden="true">
                                        <div class="modal-dialog modal-xl" role="document">
                                          <div class="modal-content">
                                            <div class="modal-header">
                                              <h5 class="modal-title" id="exampleModalLabel">김진원</h5>
                                              <button type="button" class="close" data-dismiss="" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                              </button>
                                            </div>
                                            <div class="modal-body">
                                              <!-- 문답시작 -->
                                              <div class="row">
												<table class="table table-bordered mx-5">
													<thead style="background-color: lightgray;">
														<tr>
															<td width="100">문제</td>
															<td>1. 연산자 종류에 대해 작성하시오.</td>
														</tr>
													</thead>
														
													<tbody>
														<tr>
															<td>학생답안</td>
															<td>-, *, +, /, %</td>
														</tr>
													</tbody>
													
													<tfoot>
														<tr>
															<td>모범답안</td>
															<td style="color: blue">-, *, +, /, %</td>
														</tr>
													</tfoot>
												</table>
                                              </div>
                                              
                                              <hr>
                                              
                                             <div class="row">
	                                              <table class="table table-bordered mx-5">
													<thead style="background-color: lightgray;">
														<tr>
															<td width="100">문제</td>
															<td>2. 자료형 종류에 대해 작성하시오.</td>
														</tr>
													</thead>
														
													<tbody>
														<tr>
															<td>학생답안</td>
															<td>short, int, float</td>
														</tr>
													</tbody>
													
													<tfoot>
														<tr>
															<td>모범답안</td>
															<td style="color: blue">short, int, float, double, byte, long, char</td>
														</tr>
													</tfoot>
												</table>
                                             </div>
                                             
                                             <hr>
                                              <!-- 문답끝 -->
                                            <div class="modal-footer">
	                                            <div class="d-flex flex-row mb-1 p-2">
												  <div class="py-4">점수입력 : </div>
												  <div class="p-2">
		                                                <div class="form-group">
														    <input class="form-control" id="input-score" type="number" onkeyPress="javascript:checkInputNum();" value="10" min="0" maxlength="100" placeholder="점수를 입력하세요">
														</div>
												  </div>
												</div>
                                              <button type="button" class="btn btn-danger btn-pill" data-dismiss="" id="close">닫기</button>
                                              <button type="button" class="btn btn-primary btn-pill">저장</button>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                      <!-- 채점 모달 끝 -->
                                      
                                      
            <script>
            function checkInputNum(){
                if ((event.keyCode < 48) || (event.keyCode > 57)){
                    event.returnValue = false;
                }
            }
            
              $(function(){
                $(".test-start").click(function(){
                  let title = $(this).parents("tr").children().eq(2).html();
                  
                  if(confirm("[" + title + "] 평가를 시작하시겠습니까?")){
                    alert("평가가 시작되었습니다");
                    $(this).attr("disabled", true);
                    $(this).next().attr("disabled", false);
                    $(this).next().next().attr("disabled", false);
                  }
                  
                })

                $(".close, #close").click(function(){
                  let getId = '#' + $(this).parents(".s-modal").attr('id');
                  console.log(getId);
                  $(getId).modal('hide');
                  
                })

                $(".test-end").click(function(){
                  if(confirm("평가를 종료 하시겠습니까?")){
                    $(this).prev().attr("disabled", true);
                    $(this).attr("disabled", true);
                    alert("평가가 종료되었습니다");
                  }
                })
              })

			  $(document).ready(function(){
				   $(document).on("keyup","#input-score", function(){
					 if ($(this).val() > 100){
						 $(this).val(100);
					 }
					 
					 if ($(this).val() < 0){
						 $(this).val(0);
					 }
				   })
			  })
            </script>
          </div>
        </div>
      </div>
	</div>
	</div>
</body>
</html>