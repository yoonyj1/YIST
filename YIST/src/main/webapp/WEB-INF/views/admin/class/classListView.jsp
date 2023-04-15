<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-강의관리</title>
<style>
	table#classTable{
		text-align: center;
		line-height: 2em;
		width: 85%;
		margin-left: auto; margin-right: auto;
	}

	table#classTable input[type=checkbox]{
          margin-top: 7px;
          margin-bottom: 7px;
	}

	table#classTable tbody>tr:hover{
          box-shadow: 0px 10px 18px 0px rgb(55 103 208 / 20%);
          background-color: transparent;
          cursor: pointer;
	}
	
	table#classTable tbody>tr:hover td{
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
	
	a.page-link:hover{
		color:#99da87;
		background-color: white;
		border-color: #99da87;
    }

</style>


</head>
<body class="navbar-fixed sidebar-fixed" id="body">

	<jsp:include page="../common/header.jsp"/>

	<div class="card card-default">
		<div class="card-header">
			<h2>강의</h2>
			<div class="btn-right" style="float: right">
				<button id="addClass" type="button" class="mb-1 btn btn-pill btn-primary">등록</button>
				<button type="button" class="mb-1 btn btn-pill btn-danger" id="classDeleteBtn" data-toggle="modal" data-target="#classDeleteModal">삭제</button>

				<!-- 모달 -->
				<div class="modal fade" id="classDeleteModal" tabindex="-1" role="dialog" aria-labelledby="classDeleteModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="classDeleteModalLabel">강의 삭제</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body" style="text-align: center; color: black;">
								삭제된 강의는 복구할 수 없습니다. <br> 정말 삭제하시겠습니까?
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-danger btn-pill btn-block" data-dismiss="modal" onsubmit="deleteClass();">삭제</button>
							</div>
						</div>
					</div>
					<!--모달 끝-->


				</div>

			</div>
		</div>

		<div class="card-body">

			<table id="classTable" class="table table-hover table-product">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>강의번호</th>
						<th>강의명</th>
						<th>강사명</th>
						<th>정원</th>
						<th>수강인원</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td><input type="checkbox"></td>
						<td class="classNo">1</td>
						<td>자바의정석</td>
						<td>남성</td>
						<td>10</td>
						<td>8</td>
						<td>
							<button type="button" class="btn btn-sm btn-outline-warning">수정</button>
						</td>
					</tr>

					<tr>
						<td><input type="checkbox"></td>
						<td class="classNo">2</td>
						<td>자바의정석</td>
						<td>남성</td>
						<td>10</td>
						<td>8</td>
						<td>
							<button type="button" class="btn btn-sm btn-outline-warning">수정</button>
						</td>
					</tr>

					<tr>
						<td><input type="checkbox"></td>
						<td class="classNo">3</td>
						<td>자바의정석</td>
						<td>남성</td>
						<td>10</td>
						<td>8</td>
						<td>
							<button type="button" class="btn btn-sm btn-outline-warning">수정</button>
						</td>
					</tr>

					<tr>
						<td><input type="checkbox"></td>
						<td class="classNo">4</td>
						<td>자바의정석</td>
						<td>남성</td>
						<td>10</td>
						<td>8</td>
						<td>
							<button type="button" class="btn btn-sm btn-outline-warning">수정</button>
						</td>
					</tr>

					<tr>
						<td><input type="checkbox"></td>
						<td class="classNo">5</td>
						<td>자바의정석</td>
						<td>남성</td>
						<td>10</td>
						<td>8</td>
						<td>
							<button type="button" class="btn btn-sm btn-outline-warning">수정</button>
						</td>
					</tr>

					<tr>
						<td><input type="checkbox"></td>
						<td class="classNo">6</td>
						<td>자바의정석</td>
						<td>남성</td>
						<td>10</td>
						<td>8</td>
						<td>
							<button type="button" class="btn btn-sm btn-outline-warning">수정</button>
						</td>
					</tr>

					<tr>
						<td><input type="checkbox"></td>
						<td class="classNo">7</td>
						<td>자바의정석</td>
						<td>남성</td>
						<td>10</td>
						<td>8</td>
						<td>
							<button type="button" class="btn btn-sm btn-outline-warning">수정</button>
						</td>
					</tr>

					<tr>
						<td><input type="checkbox"></td>
						<td class="classNo">8</td>
						<td>자바의정석</td>
						<td>남성</td>
						<td>10</td>
						<td>8</td>
						<td>
							<button type="button" class="btn btn-sm btn-outline-warning">수정</button>
						</td>
					</tr>

					<tr>
						<td><input type="checkbox"></td>
						<td class="classNo">9</td>
						<td>자바의정석</td>
						<td>남성</td>
						<td>10</td>
						<td>8</td>
						<td>
							<button type="button" class="btn btn-sm btn-outline-warning">수정</button>
						</td>
					</tr>

					<tr>
						<td><input type="checkbox"></td>
						<td class="classNo">10</td>
						<td>자바의정석</td>
						<td>남성</td>
						<td>10</td>
						<td>8</td>
						<td>
							<button type="button" class="btn btn-sm btn-outline-warning">수정</button>
						</td>
					</tr>


				</tbody>
			</table>

			<script>
				

			
                $(function(){
                    
					//전체선택(해제)
	                 $("#classTable thead th input[type=checkbox]").click(function(){
	                   if($("#classTable thead th input[type=checkbox]").is(":checked")){
	                      $("#classTable tbody td input[type=checkbox]").attr("checked",true);
	                   }else{
	                      $("#classTable tbody td input[type=checkbox]").attr("checked",false);
	                   }
	                 });
                    
	                //수정화면이동
					$("#classTable>tbody>tr>td>button").click(function(){
						//location.href='modify.cl?cno=' + $(this).children(".cno").text();
						location.href='update.cl';
					})
					
					//조회화면이동
					$('#classTable').on('click', 'tr td:nth-child(3)', function() {
						var classNo = $(this).siblings('.classNo').text();

						location.href = 'detail.cl';
						
					});
					
					//등록화면이동
					$("#addClass").click(function(){
						location.href='insert.cl';
					})
					
					
					
					
					
              	})
       
			
				
            </script>





			<div class="search-area">
				<form action="" method="get">
					<select class="custom-select my-1 mr-sm-2 w-auto" id="classSearchCondition">
						<option selected name="" value="teacher">강사명</option>
						<option value="className">강의명</option>
						<option value="classNo">강의번호</option>
					</select> 
					<input type="text" class="form-control rounded-pill" name="keyword" style="width: 50%;">
					<button type="submit" class="btn btn-outline-primary">검색</button>
				</form>
			</div>

			<div class="card align-items-center" style="border: none; clear: both;">

				<nav aria-label="Page navigation example" style="margin-top: 50px;">
					<ul class="pagination pagination-seperated pagination-seperated-rounded">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous"> 
								<span aria-hidden="true" class="mdi mdi-chevron-left mr-1"></span>Prev
								<span class="sr-only">Previous</span>
							</a>
						</li>
						<li class="page-item active">
							<a class="page-link" href="#">1</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">2</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">3</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">4</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">5</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Next"> Next 
								<span aria-hidden="true" class="mdi mdi-chevron-right ml-1"></span>
								<span class="sr-only">Next</span>
							</a>
						</li>
					</ul>
				</nav>
				
			</div>
			
			
		</div>





	</div>




</body>
</html>