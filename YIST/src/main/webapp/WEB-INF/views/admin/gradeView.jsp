<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="navbar-fixed sidebar-fixed" id="body">
    <script>
      NProgress.configure({ showSpinner: false });
      NProgress.start();
    </script>


    	<jsp:include page="common/header.jsp"/>
    	
    	 <div class="page-wrapper">
        
          

        <!-- ====================================
        ——— CONTENT WRAPPER
        ===================================== -->
          <div class="content">					<div class="invoice-wrapper rounded border bg-white py-5 px-3 px-md-4 px-lg-5 mb-6">
						<div class="d-flex justify-content-between">
							<h2 class="text-dark font-weight-medium">성적조회</h2>
							<div class="btn-group">
								
								<button class="btn btn-sm btn-secondary">
									<i class="mdi mdi-printer"></i> Print</button>
							</div>
						</div>

            <br>

						<ul class="nav nav-tabs mb-3" id="pills-tab" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#nav-tabs-home" role="tab"
                  aria-controls="nav-tabs" aria-selected="true">Java</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="nav-profile-tab" data-toggle="pill" href="#nav-profile" role="tab"
                  aria-controls="nav-profile" aria-selected="false">Phython</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="nav-profile-tab" data-toggle="pill" href="#nav-profile2" role="tab"
                  aria-controls="nav-profile" aria-selected="false">C</a>
              </li>
            </ul>
            <div class="tab-content mt-5" id="nav-tabContent">
              <div class="tab-pane fade show active" id="nav-tabs-home" role="tabpanel" aria-labelledby="nav-home-tab">
                <div class="accordion accordion-shadow" id="accordionShadow">
                  <div class="card">
                    <div class="card-header" id="headingShadowOne">
                      <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseShadowOne"
                          aria-expanded="true" aria-controls="collapseShadowOne">
                          자바1반
                        </button>
                      </h2>
                    </div>
                    <div id="collapseShadowOne" class="collapse show" aria-labelledby="headingShadowOne" data-parent="#accordionShadow">
                      <div class="card-body">
                        <table class="table">
                          <thead>
                            <tr>
                              <th scope="col">시험명</th>
                              <th scope="col">평균</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr style="cursor: pointer;" data-toggle="modal" data-target="#exampleModalForm">
                              <td scope="row" data-toggle="modal">시험1</td>
                              <td>88</td>
                            </tr>
                            
                            <tr>
                              <td scope="row">시험2</td>
                              <td>92</td>
                            </tr>
                            <tr>
                              <td scope="row">시험3</td>
                              <td>68</td>
                            </tr>
                            <tr>
                              <td scope="row">시험4</td>
                              <td>100</td>
                            </tr>
                            <tr>
                              <td scope="row">시험5</td>
                              <td>48</td>
                            </tr>
                            <tr>
                              <td scope="row">시험6</td>
                              <td>52</td>
                            </tr>
                          </tbody>
                        </table>
                        
                    <div class="modal fade" id="exampleModalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle"
                    aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalFormTitle">시험 1</h5>
                        </div>
                        <div class="modal-body">
                          <table class="table">
                            <thead>
                              <tr align="right">
                                <td colspan="3"><button class="updateScore btn btn-sm btn-primary">수정</button></td>
                              </tr>
                              <tr>
                                <th scope="col">석차</th>
                                <th scope="col">이름</th>
                                <th scope="col">점수</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td scope="row">1</td>
                                <td>Lucia</td>
                                <td class="score">100</td>
                              </tr>
                              <tr>
                                <td scope="row">2</td>
                                <td>Catrin</td>
                                <td class="score">98</td>
                              </tr>
                              <tr>
                                <td scope="row">3</td>
                                <td>Lilli</td>
                                <td class="score">95</td>
                              </tr>
                              <tr>
                                <td scope="row">4</td>
                                <td>Else</td>
                                <td class="score">90</td>
                              </tr>
                              <tr>
                                <td scope="row">5</td>
                                <td>Ursel</td>
                                <td class="score">88</td>
                              </tr>
                              <tr>
                                <td scope="row">6</td>
                                <td>Anke</td>
                                <td class="score">85</td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="closeBtn btn btn-danger btn-pill" data-dismiss="modal">Close</button>
                        </div>
                      </div>
                    </div>
                  </div>
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-header" id="headingShadowTwo">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseShadowTwo"
                          aria-expanded="false" aria-controls="collapseShadowTwo">
                          자바2반
                        </button>
                      </h2>
                    </div>
                    <div id="collapseShadowTwo" class="collapse" aria-labelledby="headingShadowTwo" data-parent="#accordionShadow">
                      <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                        moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3
                        wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil
                        anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                        butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you
                        probably haven't heard of them accusamus labore sustainable VHS.
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-header" id="headingShadowThree">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseShadowThree"
                          aria-expanded="false" aria-controls="collapseShadowThree">
                          자바3반
                        </button>
                      </h2>
                    </div>
                    <div id="collapseShadowThree" class="collapse" aria-labelledby="headingShadowThree" data-parent="#accordionShadow">
                      <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                        moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3
                        wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil
                        anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                        butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you
                        probably haven't heard of them accusamus labore sustainable VHS.
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                <div class="accordion accordion-shadow" id="accordionShadow">
                  <div class="card">
                    <div class="card-header" id="headingShadowOne">
                      <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseShadowOne"
                          aria-expanded="true" aria-controls="collapseShadowOne">
                          파이썬1반
                        </button>
                      </h2>
                    </div>
                    <div id="collapseShadowOne" class="collapse show" aria-labelledby="headingShadowOne" data-parent="#accordionShadow">
                      <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                        moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3
                        wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil
                        anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                        butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you
                        probably haven't heard of them accusamus labore sustainable VHS.
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-header" id="headingShadowTwo">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseShadowTwo"
                          aria-expanded="false" aria-controls="collapseShadowTwo">
                          파이썬2반
                        </button>
                      </h2>
                    </div>
                    <div id="collapseShadowTwo" class="collapse" aria-labelledby="headingShadowTwo" data-parent="#accordionShadow">
                      <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                        moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3
                        wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil
                        anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                        butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you
                        probably haven't heard of them accusamus labore sustainable VHS.
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-header" id="headingShadowThree">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseShadowThree"
                          aria-expanded="false" aria-controls="collapseShadowThree">
                          파이썬3반
                        </button>
                      </h2>
                    </div>
                    <div id="collapseShadowThree" class="collapse" aria-labelledby="headingShadowThree" data-parent="#accordionShadow">
                      <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                        moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3
                        wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil
                        anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                        butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you
                        probably haven't heard of them accusamus labore sustainable VHS.
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="nav-profile2" role="tabpanel" aria-labelledby="nav-profile-tab">
                <div class="accordion accordion-shadow" id="accordionShadow">
                  <div class="card">
                    <div class="card-header" id="headingShadowOne">
                      <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseShadowOne"
                          aria-expanded="true" aria-controls="collapseShadowOne">
                          C 1반
                        </button>
                      </h2>
                    </div>
                    <div id="collapseShadowOne" class="collapse show" aria-labelledby="headingShadowOne" data-parent="#accordionShadow">
                      <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                        moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3
                        wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil
                        anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                        butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you
                        probably haven't heard of them accusamus labore sustainable VHS.
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-header" id="headingShadowTwo">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseShadowTwo"
                          aria-expanded="false" aria-controls="collapseShadowTwo">
                          C 2반
                        </button>
                      </h2>
                    </div>
                    <div id="collapseShadowTwo" class="collapse" aria-labelledby="headingShadowTwo" data-parent="#accordionShadow">
                      <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                        moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3
                        wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil
                        anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                        butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you
                        probably haven't heard of them accusamus labore sustainable VHS.
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-header" id="headingShadowThree">
                      <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseShadowThree"
                          aria-expanded="false" aria-controls="collapseShadowThree">
                          C 3반
                        </button>
                      </h2>
                    </div>
                    <div id="collapseShadowThree" class="collapse" aria-labelledby="headingShadowThree" data-parent="#accordionShadow">
                      <div class="card-body">
                        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
                        moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3
                        wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil
                        anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur
                        butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you
                        probably haven't heard of them accusamus labore sustainable VHS.
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <script>
              $(function(){
                $(".updateScore").click(function(){
                  
                  $(".score").html("<input type='text'>");

                  $(".closeBtn").text("적용");
                })
              })
            </script>
						
					</div>
</div>
          
        </div>
        
          <!-- Footer -->
          <footer class="footer mt-auto">
            <div class="copyright bg-white">
              <p>
                &copy; <span id="copy-year"></span> Copyright Mono Dashboard Bootstrap Template by <a class="text-primary" href="http://www.iamabdus.com/" target="_blank" >Abdus</a>.
              </p>
            </div>
            <script>
                var d = new Date();
                var year = d.getFullYear();
                document.getElementById("copy-year").innerHTML = year;
            </script>
          </footer>

      </div>
    
                    <!-- Card Offcanvas -->
                    <div class="card card-offcanvas" id="contact-off" >
                      <div class="card-header">
                        <h2>Contacts</h2>
                        <a href="#" class="btn btn-primary btn-pill px-4">Add New</a>
                      </div>
                      <div class="card-body">

                        <div class="mb-4">
                          <input type="text" class="form-control form-control-lg form-control-secondary rounded-0" placeholder="Search contacts...">
                        </div>

                        <div class="media media-sm">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="images/user/user-sm-01.jpg" alt="User Image">
                              <span class="active bg-primary"></span>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title">Selena Wagner</span>
                              <span class="discribe">Designer</span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="images/user/user-sm-02.jpg" alt="User Image">
                              <span class="active bg-primary"></span>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title">Walter Reuter</span>
                              <span>Developer</span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="images/user/user-sm-03.jpg" alt="User Image">
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title">Larissa Gebhardt</span>
                              <span>Cyber Punk</span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="images/user/user-sm-04.jpg" alt="User Image">
                            </a>

                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title">Albrecht Straub</span>
                              <span>Photographer</span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="images/user/user-sm-05.jpg" alt="User Image">
                              <span class="active bg-danger"></span>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title">Leopold Ebert</span>
                              <span>Fashion Designer</span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="images/user/user-sm-06.jpg" alt="User Image">
                              <span class="active bg-primary"></span>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title">Selena Wagner</span>
                              <span>Photographer</span>
                            </a>
                          </div>
                        </div>

                      </div>
                    </div>
</body>
</html>