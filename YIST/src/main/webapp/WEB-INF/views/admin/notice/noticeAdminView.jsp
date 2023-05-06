<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-공지사항관리</title>
</head>
<style>

	table#noticeTable{
          text-align: center;
          line-height: 2em;
          width: 85%;
          margin-left: auto; margin-right: auto;
    }
    
    table#noticeTable input[type=checkbox]{
          margin-top: 7px;
          margin-bottom: 7px;
        }

	table#noticeTable tbody>tr:hover{
          box-shadow: 0px 10px 18px 0px rgb(55 103 208 / 20%);
          background-color: transparent;
          cursor: pointer;
	}
	
	table#noticeTable tbody>tr:hover td{
          color: #8a909d;
	}

	.search-area{
          display: flex;
          justify-content: center;
          margin-top: 40px;
          width: 100%;
	}
        
	.search-area>form{
          text-align: center;
          display: inline-block;
	}

	.search-area>form>*{
          float: left;
	}
	
	nav > ul > li.page-item.active > a.page-link{
          background-color: #99da87;
          border-color: #99da87;
	}
	
	nav > ul > li.page-item.active > a.page-link:hover{
          background-color: #99da87;
          border-color: #99da87;
		  color: white;
	}
	
	nav > ul > li.page-item > a.page-link:hover{
		color:#99da87;
		background-color: white;
		border-color: #99da87;
    }
	
</style>


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
			<h2>공지사항</h2>
			
			<div class="btn-right" style="float:right">
				<button type="button" class="mb-1 btn btn-pill btn-primary" onclick="noticeInsert();">등록</button>
                <button type="button" class="mb-1 btn btn-pill btn-danger" id="noticeDeleteBtn" data-toggle="modal" data-target="#noticeDeleteModal">삭제</button>
				
					<div class="modal fade" id="noticeDeleteModal" tabindex="-1" role="dialog" aria-labelledby="noticeDeleteModalLabel" aria-hidden="true">
		                  <div class="modal-dialog" role="document">
		                  
		                    <div class="modal-content">
		                    
		                      <div class="modal-header">
		                        <h5 class="modal-title" id="noticeDeleteModalLabel">공지사항 삭제</h5>
		                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                          <span aria-hidden="true">×</span>
		                        </button>
		                      </div>
		                      
		                      <div class="modal-body" style="text-align: center; color: black;">
		                        삭제된 공지사항은 복구할 수 없습니다.
		                        <br>
		                        정말 삭제하시겠습니까?
		                      </div>
	                      
		                      <div class="modal-footer">
		                        <button type="button" class="btn btn-danger btn-pill btn-block" data-dismiss="modal">삭제</button>
		                      </div>
		                      
	                    	</div>
	                 	 </div>
                	</div>  

               </div>
			</div>


			<script>
				function noticeInsert(){
					location.href="insertForm.no";
				}
			</script>


			<div class="card-body">

                <table id="noticeTable" class="table table-hover table-product">

	                  <thead>
	                    <tr>
	                      <th><input type="checkbox"></th>
	                      <th>글번호</th>
	                      <th>제목</th>
	                      <th>작성자</th>
	                      <th>작성일자</th>
	                      <th>관리</th>
	                    </tr>
	                  </thead>

	                  <tbody>

							<c:if test="${ empty list }">
								<tr>
									<td colspan="6" style="text-align: center;">조회된 공지사항이 없습니다.</td>
								</tr>
							</c:if>

							<c:forEach var='n' items="${ list }">

								<tr>
									<td>
									  <input type="checkbox">
									</td>
									<td class="boardNo">${ n.boardNo }</td>
									<td>${ n.boardTitle }</td>
									<td>${ n.boardWriter }</td>
									<td>${ n.createDate }</td>
									<td>
									  <button type="button" class="btn btn-sm btn-outline-warning">수정</button>
									</td>
								</tr>

							</c:forEach>            
		
		                </tbody>

				</table>

                <script>
                  $(function(){
                    
                    $("#noticeTable thead th input[type=checkbox]").click(function(){
                      if($("#noticeTable thead th input[type=checkbox]").is(":checked")){
                        $("#noticeTable tbody td input[type=checkbox]").attr("checked",true);
                      }else{
                        $("#noticeTable tbody td input[type=checkbox]").attr("checked",false);
                      }
                    });
                    
	                //수정화면이동
					$("#noticeTable>tbody>tr>td>button").click(function(){
						let $cno = $(this).parent("td").siblings('.boardNo').text()
						location.href='updateForm.no?no='+ $cno;
					})
                    
					
					$('#noticeTable').on('click', 'tr td:nth-child(3)', function() {
						let noticeNo = $(this).siblings('.boardNo').text();
						location.href = 'detail.no?no=' + noticeNo;
						
					});
                    
                    
                  })

                </script>
            
                <div class="search-area">
                  <form action="search.no" method="get">
                    <select class="custom-select my-1 mr-sm-2 w-auto" id="materialSearchCondition">
                      <option selected value="writer">작성자</option>
                      <option value="title">제목</option>
                      <option value="content">내용</option>
                    </select>
                    <input type="text" class="form-control rounded-pill" name="keyword" style="width: 50%;">
                    <button type="submit" class="btn btn-outline-primary">검색</button>
                  </form>
                </div>

				<c:if test="${ ! empty condition }">
					<script>
					
						$(function() {
							$(".search-area option[value=${condition}]").attr("selected", true);
						})
					
					</script>
				</c:if>



                <div class="card align-items-center" style="border: none; clear: both;">
                
					<div class="card align-items-center" style="border: none; clear: both;">

						<nav aria-label="Page navigation example" style="margin-top: 50px;">
							<ul class="pagination pagination-seperated pagination-seperated-rounded">
								<c:choose>
									<c:when test="${ pi.currentPage eq 1 }">
										<li class="page-item disabled">
											<a class="page-link" href="" aria-label="Previous"> 
												<span aria-hidden="true" class="mdi mdi-chevron-left mr-1"></span>Prev
												<span class="sr-only">Previous</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${ empty condition }">
												<li class="page-item">
													<a class="page-link" href="noticeAdminList.ad?page=${ pi.currentPage -1 }" aria-label="Previous"> 
														<span aria-hidden="true" class="mdi mdi-chevron-left mr-1"></span>Prev
														<span class="sr-only">Previous</span>
													</a>
												</li>							
											</c:when>
											<c:otherwise>
												<li class="page-item">
													<a class="page-link" href="search.no?page=${ pi.currentPage -1 }&condition=${condition}&keyword=${keyword}" aria-label="Previous"> 
														<span aria-hidden="true" class="mdi mdi-chevron-left mr-1"></span>Prev
														<span class="sr-only">Previous</span>
													</a>
												</li>							
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:choose>
										<c:when test="${ empty condition }">
											<li class="page-item">
												<a class="page-link" href="noticeAdminList.ad?page=${ p }">${ p }</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<a class="page-link" href="search.no?page=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<li class="page-item disabled">
											<a class="page-link" href="" aria-label="Next"> 
												<span aria-hidden="true" class="mdi mdi-chevron-right mr-1"></span>Next
												<span class="sr-only">Next</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${ empty condition }">
												<li class="page-item">
													<a class="page-link" href="noticeAdminList.ad?page=${ pi.currentPage + 1 }" aria-label="Next"> 
														<span aria-hidden="true" class="mdi mdi-chevron-right mr-1"></span>Next
														<span class="sr-only">Next</span>
													</a>
												</li>							
											</c:when>
											<c:otherwise>
												<li class="page-item">
													<a class="page-link" href="search.no?page=${ pi.currentPage + 1 }&condition=${condition}&keyword=${keyword}"" aria-label="Next"> 
														<span aria-hidden="true" class="mdi mdi-chevron-right mr-1"></span>Next
														<span class="sr-only">Next</span>
													</a>
												</li>							
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								
		
							</ul>
						</nav>



                  </div>
                </div>





	</div>

	<script>
		$(function(){
			const cP = '${pi.currentPage}';

			const $pageLinks = $('a.page-link');

			$pageLinks.each(function(index, link) {

				let text = link.innerText;
				
				if (text === cP) {
					$(link).parent('li').addClass('active');
				}

			});
		});

	</script>



</body>
</html>