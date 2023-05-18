<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

th, td {
	height: 50px;
	padding: 10px;
	text-align: center;
	border: 1px solid #dae0e9;
}

th {
	background-color: #eee;
	font-weight: bold;
}

tr td:nth-child(3):hover {
	background-color: #9cd3f4;
}

#search-area {
	width: 100%;
	margin-bottom: 30px;
}

#search-area {
	display: flex;
	justify-content: center;
}

select, input {
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

.active {
	background-color: red;
}
</style>
</head>
<body>
	<jsp:include page="common/header.jsp" />

	<div class="container">
		<div class="sub08_title">
			<ul style="text-align: center; margin-top: 40px">
				<li class="title"><h2 class="text-uppercase mt-15"
						style="font-size: 30px; font-weight: bold;">우리반 게시판</h2></li>
				<li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반
						공공데이터 융합 개발자 양성과정A</p></li>
				<li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023.
						05. 19 09:00~15:30 (김시연 강사)</p></li>
			</ul>
			<div data-example-id="simple-button-group" class="bs-example"
				style="text-align: center; padding: 15px;">
				<div aria-label="Basic example" role="group" class="btn-group">
					<button class="btn btn-default" type="button" id="materials"
						onclick="showMaterials()" style="background-color: #c1e5fb">학습자료</button>
					<button class="btn btn-default" type="button" id="task"
						onclick="showTask()">과제</button>
					<button class="btn btn-default" type="button" id="qna"
						onclick="showQnA()">Q & A</button>
				</div>
			</div>
		</div>
		<div class="entry-content">
			<table id="result">
				<thead>

				</thead>
				<tbody>

				</tbody>
			</table>
			
			<div style="text-align: right;">
				<a href="/yist/qnaInsert.st" style=" display:none" id="writeBtn" class="btn btn-gray btn-theme-colored btn-circled">글쓰기</a>
			</div>
			
		</div>
	</div>

	<script>
		$(document).ready(function() {
			showMaterials();
			
		});

		
		// 학습자료
		function showMaterials(cpage, searchType, keyword) {
			var data = {cpage : cpage}
			
			if(searchType && keyword && searchType.length > 0 && keyword.length > 0){
				data.searchType = searchType
				data.keyword = keyword
			}
			
			$.ajax({
					url : "MaterialList.st",
					type : "get",
					data : data
					,
					success : function(result) {
						//console.log(result.list)
						var list = result.list
						$("#materials").css("background", "#c1e5fb");
						$("#task").css("background", "white");
						$("#qna").css("background", "white");

						var html = "";
						var value = "";

						value += "<tr higth='20px'>";
						value += "<th width='5%'>번호</th>";
						value += "<th width='15%'>카테고리</th>";
						value += "<th width='45%'>제목</th>";
						value += "<th width='10%'>작성자</th>";
						value += "<th width='10%'>작성일</th>";
						value += "<th width='10%'>조회수</th>";
						value += "</tr>";

						$("#result thead").html(value);
						
						if (result.list.length === 0) {
							html += "<tr><td colspan='6' align='center'>존재하는 글이 없습니다</td></tr>";
						} else {
							for ( var i in list) {
								html += "<tr>";
								html += "<td class='mno'>"
										+ result.list[i].boardNo + "</td>";
								html += "<td>학습자료</td>";
								html += "<td><a href=materialDetail.st?materialNo="
										+ result.list[i].boardNo
										+ ">"
										+ result.list[i].boardTitle
										+ "</a></td>";
								html += "<td>" + result.list[i].boardWriter
										+ "</td>";
								html += "<td>" + result.list[i].createDate
										+ "</td>";
								html += "<td>" + result.list[i].count
										+ "</td>";
								html += "</tr>";
							}

							$("#result tbody").html(html);

							var a = '';
							var page = result.page;
							var startpage = result.startPage;
							var endpage = result.endPage;
							var list = result.list;
							var maxpage = result.maxPage;

							console.log(page + " , " + startpage + " , "
									+ endpage + " , " + list);

							a += '<ul class="pagination" align="center">';

							if (page == 1) {
								// 실행할 코드
								a += '<li class="page-item disabled"><a class="page-link" href="">이전</a></li>';
							} else {
								a += '<li class="page-item"><a class="page-link"  onclick="showMaterials('
										+ (page - 1) + ');">이전</a></li>';
							}

							for (var num = startpage; num <= endpage; num++) {
								console.log("n page", num , page)
								console.log(num === page)
								//if(num === page){
								//	a += '<li class="page-item pagebtn active">'
								//}else{
									a += '<li class="page-item pagebtn">'
								//}
								
										+ '<a class="page-link pagebtn" onclick="showMaterials('
										+ num
										+ '); return false;">'
										+ num
										+ '</a></li>'
							}

							if (page == maxpage) {
								a += '<li class="page-item disable d"><a class="page-link" href="">Next</a></li>';
							} else {
								a += '<li class="page-item"><a class="page-link"  onclick="showMaterials('
										+ (page + 1)
										+ '); return false;">다음</a></li>';
							}

							a += '</ul>';
							a += ' </div>';

							$("#pagingArea").html(a);

						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("Error: " + textStatus + " "
								+ errorThrown);
					}

				});

		}

		function postMaterials(cpage) {
			
			$.ajax({
				url : "MaterialList.st",
				type : "POST",
				data : {
					cpage : cpage
				},
				success : function(result) {

					$("#materials").css("background", "#c1e5fb");
					$("#task").css("background", "white");
					$("#qna").css("background", "white");

					var html = "";
					var value = "";

					value += "<tr higth='20px'>";
					value += "<th width='5%'>번호</th>";
					value += "<th width='15%'>카테고리</th>";
					value += "<th width='45%'>제목</th>";
					value += "<th width='10%'>작성자</th>";
					value += "<th width='10%'>작성일</th>";
					value += "<th width='10%'>조회수</th>";
					value += "</tr>";

					$("#result thead").html(value);

					if (result.list.length === 0) {
						html += "<tr><td colspan='6' align='center'>존재하는 글이 없습니다</td></tr>";
					} else {
						for ( var i in list) {
							html += "<tr>";
							html += "<td class='mno'>"
									+ result.list[i].boardNo + "</td>";
							html += "<td>학습자료</td>";
							html += "<td><a href=materialDetail.st?materialNo="
									+ result.list[i].boardNo
									+ ">"
									+ result.list[i].boardTitle
									+ "</a></td>";
							html += "<td>" + result.list[i].boardWriter
									+ "</td>";
							html += "<td>" + result.list[i].createDate
									+ "</td>";
							html += "<td>" + result.list[i].count
									+ "</td>";
							html += "</tr>";
						}

						$("#result tbody").html(html);

						var a = '';
						var page = result.page;
						var startpage = result.startPage;
						var endpage = result.endPage;
						var list = result.list;
						var maxpage = result.maxPage;

						console.log(page + " , " + startpage + " , "
								+ endpage + " , " + list);

						a += '<ul class="pagination" align="center">';

						if (page == 1) {
							// 실행할 코드
							a += '<li class="page-item disabled"><a class="page-link" href="">이전</a></li>';
						} else {
							a += '<li class="page-item"><a class="page-link"  onclick="showMaterials('
									+ (page - 1) + ');">이전</a></li>';
						}

						for (var num = startpage; num <= endpage; num++) {
							a += '<li class="page-item active pagebtn"><a class="page-link pagebtn" onclick="showMaterials('
									+ num
									+ '); return false;">'
									+ num
									+ '</a></li>'
						}

						if (page == maxpage) {
							a += '<li class="page-item disable d"><a class="page-link" href="">Next</a></li>';
						} else {
							a += '<li class="page-item"><a class="page-link"  onclick="showMaterials('
									+ (page + 1)
									+ '); return false;">다음</a></li>';
						}

						a += '</ul>';
						a += ' </div>';

						$("#pagingArea").html(a);

					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("Error: " + textStatus + " "
							+ errorThrown);
				}

			});
		}

		// 과제
		function showTask() {
			 	 $.ajax({
					  url: "taskList.st",
					  type: "POST",
					  success: function(list) {
						  $("#task").css("background", "#c1e5fb");
						  $("#materials").css("background", "white");
						  $("#qna").css("background", "white");
						  
						  var html = "";
						  var value = "";
						  
						  value += "<tr higth='20px'>";
						  value += "<th width='5%'>번호</th>";
						  value += "<th width='15%'>카테고리</th>";
						  value += "<th width='30%'>제목</th>";
						  value += "<th width='15%'>작성자</th>";
						  value += "<th width='20%'>기간</th>";
						  value += "<th width='15%'>상태</th>";
						  value += "</tr>";
						  
						  $("#result thead").html(value);
						   let today = new Date();
						   let endDate;
						   
						   console.log("오늘 : " + today.getTime());
						   
						   if (list.length == 0) {
								html += "<tr><td colspan='6' align='center'>존재하는 글이 없습니다</td></tr>";
						   } else {
							   for (let i in list) {
									endDate = new Date(list[i].endDate);
						   			console.log("마감일 : " + endDate.getTime());
								    html += "<tr>";
								    html += "<td>" + list[i].taskNo + "</td>";
								    html += "<td>과제</td>";
								    html += "<td><a href=taskDetail.st?taskNo=" + list[i].taskNo + ">" + list[i].taskTitle + "</a></td>";
								    html += "<td>" + list[i].id + "</td>";
								    html += "<td>" + list[i].startDate + "~" + list[i].endDate + "</td>";
								    if (today.getTime() > endDate.getTime()){
								    	if(list[i].submitContent != null){
								    		if (list[i].status == 'Y'){
								    			html += "<td style=\"color:red;\">마감/확인</td>";
								    		} else {
									    		html += "<td style=\"color:red;\">마감/제출</td>";
								    		}
								    	} else {
										    html += "<td style=\"color:red;\">마감/미제출</td>";
								    	}
								    } else {
								    	if(list[i].submitContent != null){
								    		if (list[i].status == 'Y'){
								    			html += "<td style=\"color:blue;\">진행중/확인</td>";
								    		} else {
									    		html += "<td style=\"color:blue;\">진행중/제출</td>";
								    		}
								    	} else {
										    html += "<td style=\"color:blue;\">진행중/미제출</td>";
								    	}
								    }
								    html += "</tr>";
								}
								$("#result tbody").html(html);
						   }
					  },
					  error : function(jqXHR, textStatus, errorThrown) {
		              	  console.log("Error: " + textStatus + " " + errorThrown);
				  	  }
				 })
			
	 }	

		// Q&A
		function showQnA(cpage, searchType, keyword) {
			var loginId = '${loginUser.id}'
			
			var data = {
					cpage : cpage
			}
			
			if(searchType && keyword && searchType.length > 0 && keyword.length > 0){
				data.searchType = searchType
				data.keyword = keyword
			}
			
			
			document.getElementById('writeBtn').style.display = 'inline'
			
			$.ajax({
						url : "qnaList.st",
						type : "POST",
						data : data,
						success : function(result) {

							console.log(result.list);

							$("#qna").css("background", "#c1e5fb");
							$("#materials").css("background", "white");
							$("#task").css("background", "white");

							var html = "";
							var value = "";

							value += "<tr higth='20px'>";
							value += "<th width='5%'>번호</th>";
							value += "<th width='10%'>카테고리</th>";
							value += "<th width='10%'>공개</th>";
							value += "<th width='45%'>제목</th>";
							value += "<th width='15%'>작성자</th>";
							value += "<th width='15%'>작성일</th>";
							value += "</tr>";

							$("#result thead").html(value);

							if (result.list.length === 0) {
								html += "<tr><td colspan='5' align='center'>존재하는 글이 없습니다.</td></tr>";

							} else {
								for ( let i in result.list) {
									html += "<tr>";
									html += "<td>" + result.list[i].boardNo
											+ "</td>";
									html += "<td>Q&A</td>";
									html += "<td>"+ (result.list[i].views == 2 ? '비밀글': '전체공개') + "</td>";
								if(result.list[i].views === 2 && (result.list[i].boardWriter !== loginId) ){
									html += "<td onclick='handlePrivateContent()'>"+ result.list[i].boardTitle +"</td>";
								}else{
									html += "<td><a href=qnaDetail.st?qno="
										+ result.list[i].boardNo + ">"
										+ result.list[i].boardTitle
										+ "</a></td>";	
										
	
								}
									html += "<td>" + result.list[i].boardWriter
											+ "</td>";
									html += "<td>" + result.list[i].createDate
											+ "</td>";
									html += "</tr>";
								}
							}
							$("#result tbody").html(html);

							var a = '';
							var page = result.page;
							var startpage = result.startPage;
							var endpage = result.endPage;
							var list = result.list;
							var maxpage = result.maxPage;

							console.log(page + " , " + startpage + " , "
									+ endpage + " , " + list);

							a += '<ul class="pagination" align="center">';

							if (page == 1) {
								a += '<li class="page-item disabled"><a class="page-link" href="">이전</a></li>';
							} else {
								a += '<li class="page-item"><a class="page-link"  onclick="showQnA('
										+ (page - 1) + ');">이전</a></li>';
							}

							for (var num = startpage; num <= endpage; num++) {
								a += '<li class="page-item active pagebtn"><a class="page-link pagebtn" onclick="showQnA('
										+ num
										+ '); return false;">'
										+ num
										+ '</a></li>'
							}

							if (page == maxpage) {
								a += '<li class="page-item disable d"><a class="page-link" href="">Next</a></li>';
							} else {
								a += '<li class="page-item"><a class="page-link"  onclick="showQnA('
										+ (page + 1)
										+ '); return false;">다음</a></li>';
							}

							a += '</ul>';
							a += ' </div>';

							$("#pagingArea").html(a);

						},
						error : function(jqXHR, textStatus, errorThrown) {
							console.log("Error: " + textStatus + " "
									+ errorThrown);
						}

					});
		}
		
		function handlePrivateContent(){
			alert('비밀글입니다!')
		}
		
		function searchBoard(){
			var keyword = $('#search-keyword').val()
			var searchType = $('#search-type').val()
			var qna = document.getElementById('qna')
			if(qna.style.background === 'white'){
				showMaterials(1, searchType, keyword)	
			}else{
				showQnA(1, searchType, keyword)
			}
			
		}
		
	</script>

	<nav style="text-align: center;" id="pagingArea"></nav>


	<div id="search-area">
		<!-- <form action="" method="get" align="center"> -->
			<select name="search-type" id="search-type" style="width: 7%;">
				<option value="writer">작성자</option>
				<option value="title">제목</option>
			</select>
			<div style="width: 25%;">
				<input type="text" id="search-keyword" name="keyword"
					style="width: 95%;">
			</div>
			<button onclick="searchBoard()" type="button" style="width: 6%;">검색</button>
		<!-- </form> -->
	</div>

	<jsp:include page="common/footer.jsp" />
</body>
</html>