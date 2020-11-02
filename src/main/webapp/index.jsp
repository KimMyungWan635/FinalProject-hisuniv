<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>윤명철 교수의 역사대학</title>
    <link rel="icon" type="image/x-icon" href="img/favicon.ico" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/slick.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    
    <style>
    .sbtn{
		border: 1px solid skyblue;
		background-color: black;
		color: white;
		padding: 5px;
		}
    </style>
    
    <script type="text/javascript">
    
    
	    window.onload = function() {
	    	readGuestbook();
	    	readGallery();
	    };
	    
	    /*
	    //search start
	    $(document).ready(function() {
		    $(document).on('click', '#sbtn', function() {
		    		if ($('#s_content').val() == '') {
		  		    	alert('검색내용을 입력하셔야 합니다.');
		  			  	return false;
		  		  	}
		    		
		    		document.sfrm.submit();
		   	});
	    });
	    // /search end
	    */
	    
	    /* guestbook start */
	    var writeGuestbook = function() {
			var request = new XMLHttpRequest();
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					if (request.status == 200) {
						var data = request.responseText.trim();
						var json = eval('(' + data + ')');
						if (json.flag == 1) {
							alert('방명록이 작성되었습니다');
							readGuestbook();
							document.getElementById("password").value = '';
							document.getElementById("content").value = '';
						} else {
							alert('[오류] 방명록이 작성되지 않았습니다');
						}
					} else {
						alert('페이지 처리 에러');
					};
				};
			};
			var url = 'guestbookWrite_ok.do?';
			url += '&writer=' + encodeURIComponent(document.getElementById("writer").value)
			url += '&password=' + document.getElementById("password").value
			url += '&content=' + encodeURIComponent(document.getElementById("content").value)
			request.open('get', url, true);
			request.send();
		};
			
		var readGuestbook = function() {
			var request = new XMLHttpRequest();
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					if (request.status == 200) {
						showData(request.responseText.trim());
					} else {
						alert('페이지 처리 에러');
					};
				};
			};
			request.open('get', 'guestbookList.do', true);
			request.send();
			
			var showData = function(data) {
				var json = eval('(' + data + ')');
				
				// 팝업창 크기 (수정, 삭제)
				var width = 700;
				var height = 700;
				// 팝업창 위치
				var left = (screen.width - width) / 2 ;
			    var top = (screen.height - height) / 2 ;
			    
			    var	result = '';
				$.each (json.data, function(index, item) {
					result += '<div class="whole-wrap">';
					result += '<div class="container box_1170">';
			    	result += '<div class="section-top-border11">';
			    	result += '<h3 class="mb-30">' + item.writer + '<p11 class="wdate">&nbsp&nbsp&nbsp'+ item.wdate +'</p11></h3> ';
			    	result += '<div class="row">';
			    	result += '<div class="col-lg-12">';
			    	result += '<blockquote class="generic-blockquote" style="word-wrap:break-word; word-break:break-all;">';
			    	result += item.content;
			    	<%
		    			if (session.getAttribute("u_name") != null || session.getAttribute("m_id") != null) {
		    		%>
			    	result += '<div class="title">';
					result += '<button class="btn genric-btn default" onclick="window.open(\'guestbookModify.do?seq=' + item.seq + '\', \'pop\', \'width='+width+', height='+height+', toolbar=no, location=no, menubar=no, scrollbars=no, status=no, resizable=no, left='+left+', top='+top+'\')">수정</button>';
					result += '&nbsp&nbsp';
					result += '<button class="btn genric-btn default" onclick="window.open(\'guestbookDelete.do?seq=' + item.seq + '\', \'pop\', \'width='+width+', height='+height+', toolbar=no, location=no, menubar=no, scrollbars=no, status=no, resizable=no, left='+left+', top='+top+'\')">삭제</button>';
					result += '</div>';
					<%
	    				}
	    			%>
			    	result += '</blockquote>';
			    	result += '</div>';
			    	result += '</div>';
			    	result += '</div>';
			    	result += '</div>';
			    	result += '</div>';
				});
				
				document.getElementById('guestbooklist').innerHTML = result;
			};
		};
		/* guestbook end */
		
		/* gallery start */
		var readGallery = function() {
			var request = new XMLHttpRequest();
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					if (request.status == 200) {
						showData(request.responseText.trim());
					} else {
						alert('페이지 처리 에러');
					};
				};
			};
			request.open('get', 'galleryMain.do', true);
			request.send();
			
			var showData = function(data) {
				var json = eval('(' + data + ')');
				
			    var	result = '';
				$.each (json.data, function(index, item) {
					result += '<div class="col-lg-4 col-md-6 col-lg-4">';
					result += '<div class="single_Portfolio wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">';
			    	result += '<div class="portfolio_thumb">';
			    	result += '<img src="resources/upload/' + item.filename + '">';
			    	result += '</div>';
			    	result += '<div class="portfolio_hover">';
			    	result += '<div class="title">';
			    	result += '<span>Gallery</span>';
					result += '<h3>' + item.subject + '</h3>';
			    	result += '<a class="boxed-btn3" href="galleryList.do">View</a>';
			    	result += '</div>';
			    	result += '</div>';
			    	result += '</div>';
			    	result += '</div>';
				});
				
				document.getElementById('gallerylist').innerHTML = result;
			};
		};
		/* gallery end */
    </script>
</head>
<body>
    <header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid p-0">
                    <div class="row align-items-center no-gutters">
                        <div class="col-xl-2 col-lg-2">
                            <div class="logo-img">
	                            <a href="index.jsp">
	                            	<img src="img/logo.png">
	                            </a>
                            </div>
                        </div>
                        <div class="col-xl-8 col-lg-8">
                            <div class="main-menu  d-none d-lg-block text-center">
                                <nav>
                                    <ul id="navigation">
                                        <li><a class="active" href="https://www.youtube.com/channel/UCdtzVv7J1ls4s338lzfmjjQ" target="_blank">Youtube</a></li>
                                        <li><a href="#Guestbook">Guest book</a></li>
                                        <li><a href="galleryList.do">Gallery</a></li>
<%
	if (session.getAttribute("u_name") == null) {
		// 사용자 로그아웃 상태
%>                                      
										<li><a href="UserLogin.do">login</a></li>
										<!-- 
										<li>
										<form action="search.do" method="post" name="sfrm">
											<table>
												<input type="text" value="" name="s_content" id="s_content" maxlength="10"/>
												<button class="sbtn" id="sbtn">검색</button>
											</table>
										</form>
										</li>
										 -->
<%	
	} else {
		// 사용자 로그인 상태
%>									
										<li><a href="UserLogout.do">logout</a></li>
<%	
	}
%>										
									</ul>
                                </nav>
                            </div>
                        </div>
<%
	if (session.getAttribute("m_id") != null) {
		// 관리자 로그인 상태
%>                        
                        <div class="col-lg-2 d-none d-lg-block">
                            <div class="log_chat_area d-flex align-items-end">
                                <a href="write.do" class="say_hi">강의 등록</a>
                            </div>
                        </div>
<%
	} else if (session.getAttribute("u_name") != null) {
		// 사용자 로그인 상태
%>
						<div class="col-lg-2 d-none d-lg-block">
                            <div class="log_chat_area d-flex align-items-end">
                                <a href="UserModify.do" class="say_hi"><%=session.getAttribute("u_name") %>님 환영합니다.</a>
                            </div>
                        </div>
<%
	}
%>

                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="single_slider d-flex align-items-center slider_bg_1 overlay">
            <div class="container">
                <div class="row align-items-center justify-content-start">
                    <div class="col-lg-10 col-md-10">
                        <div class="slider_text">
                            <h3 class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".1s">
                                Thank you for visiting.
                            </h3>
                            <a class="boxed-btn3 wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".2s" href="list.do">강의실 입장</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider_area_end -->

    <!-- gallery_area  -->
    <div class="portfolio_image_area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="section_title text-center mb-90">
                        <h3 class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">Gallery</h3>
                        <p class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">Gallery 미리보기</p>
                    </div>
                </div>
            </div>
            <div id="gallerylist" class="row">
            </div>
        </div>
    </div>
    <!--/ gallery_area  -->
    
	<!-- guestbook form -->
    <div id="Guestbook" class="get_in_tauch_area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="section_title text-center mb-90">
                        <h3 class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">Guest book</h3>
                        <p class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">방명록을 남겨주세요</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="touch_form">
<%
	if (session.getAttribute("u_name") == null) {
		// 사용자 로그아웃 상태
%>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                                        <input type="text" placeholder="Your Name" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".4s">
                                        <input type="Password" id="password" maxlength="15" placeholder="Password" readonly>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">
                                       <textarea id="content" cols="30" rows="10" maxlength="1000" placeholder="Message" readonly></textarea>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="submit_btn wow fadeInUp" data-wow-duration="1s" data-wow-delay=".6s">
                                        <button class="boxed-btn3" onclick="location.href='UserLogin.do'">로그인이 필요합니다</button>
                                    </div>
                                </div>
                            </div>
<%	
	} else {
		// 사용자 로그인 상태
%>                              
						<form action="javascript:writeGuestbook()" method="post">
                            <div class="row">  
								<div class="col-md-6">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                                        <input type="text" id="writer" id="name" value="<%=session.getAttribute("u_name") %>" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".4s">
                                        <input type="Password" id="password" maxlength="15" placeholder="Password" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">
                                       <textarea id="content" cols="30" rows="10" maxlength="1000" placeholder="Message" required></textarea>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="submit_btn wow fadeInUp" data-wow-duration="1s" data-wow-delay=".6s">
                                        <button type="submit" class="boxed-btn3">Send Message</button>
                                    </div>
                                </div>
                          	</div>
                        </form>
<%	
	}
%>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!--/ guestbook form -->
	
	<!-- guestbook_area  -->
    <div class="service_area">
    	<div class="container" style="width: 500%">
		    <div class="row justify-content-center">
		        <div>
		            <div class="section_title text-left11 mb-70">
		                <span class="wow fadeInUp text-center" data-wow-duration="1s" data-wow-delay=".1s" >Guestbook</span>
		                <div class="section_title11 single_Portfolio wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s" style="visibility: visible; animation-duration: 1s; animation-delay: 0.3s; padding-top: 1px; padding-bottom: 1px">
		                	<div align="center" class="container">
			                	<button type="button" class="btn btn-secondary" data-toggle="collapse" data-target="#list">방명록 펼치기</button>
			                </div>	
		                	<div id="list" class="collapse">
		                		<p id="guestbooklist"></p>
		                	</div>
       					</div>
		            </div>
		        </div>
		    </div>
	    </div>
    </div>
    <!-- /guestbook_area  -->

    <!-- footer start -->
    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-2 col-md-3">
                        <div class="footer_logo wow fadeInRight" data-wow-duration="1s" data-wow-delay=".3s">
                            <a href="index.jsp">
                                <img src="img/logo.png" alt="윤명철 교수의 역사대학">
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-7 col-lg-7 col-md-9">
                        <div class="menu_links">
                            <ul>
<%
	if (session.getAttribute("m_id") == null) {
		// 관리자 로그아웃 상태
%>                             
                                <li><a class="wow fadeInDown" data-wow-duration="1s" data-wow-delay=".2s" href="ManagerLogin.do">Admin Login</a></li>
<%
	} else {
		// 관리자 로그인 상태
%>                              
								<li><a class="wow fadeInDown" data-wow-duration="1s" data-wow-delay=".2s" href="ManagerLogout.do">Admin Logout</a></li>
<%
	}
%> 								     
                                <li><a class="wow fadeInDown" data-wow-duration="1s" data-wow-delay=".4s" href="introduce.do">Profile</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy-right_text">
            <div class="container">
                <div class="footer_border"></div>
                <div class="row">
                    <div class="col-xl-12">
                        <p class="copy_right text-center wow fadeInUp" data-wow-duration="1s" data-wow-delay="1.3s">
					    	| 윤명철 교수의 역사대학 |
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/ footer end  -->

    <!-- JS here -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/scrollIt.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/nice-select.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/gijgo.min.js"></script>

    <!--contact js-->
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <script src="js/main.js"></script>
</body>
</html>