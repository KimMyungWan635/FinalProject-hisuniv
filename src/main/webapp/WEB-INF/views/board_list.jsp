<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.LcategoryTO"%>
<%@ page import="model.ScategoryTO"%>
<%@ page import="java.util.ArrayList"%>
<%
	ArrayList<LcategoryTO> LcategoryList = (ArrayList<LcategoryTO>)request.getAttribute("LcategoryList");
	ArrayList<ScategoryTO> ScategoryList = (ArrayList<ScategoryTO>)request.getAttribute("ScategoryList");

	StringBuffer dropdown = new StringBuffer();
	
	for (LcategoryTO lto : LcategoryList) {
		dropdown.append("<li><a href='#'>" + lto.getName() + "<i class='ti-angle-down'></i></a>");
		dropdown.append("<ul class='submenu'>");
		
		for (ScategoryTO sto : ScategoryList) {
			if (lto.getSeq().equals(sto.getLseq())) {
				dropdown.append("<li><a href='view.do?sseq=" + sto.getSeq() + "&sname=" + sto.getName() + "&lname=" + lto.getName() + "'>" + sto.getName() + "</a></li>");
			}
		}
		
		dropdown.append("</ul>");
		dropdown.append("</li>");
	}
%>    
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
</head>
<body>
    <header>
        <div class="header-area">
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
                            <div class="main-menu d-none d-lg-block text-center">
                                <nav>
                                    <ul id="navigation">
                                        <%=dropdown %>
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

    <div class="slider_area">
        <div class="single_slider d-flex align-items-center slider_bg_1 overlay">
            <div class="container">
                <div class="row align-items-center justify-content-start">
                    <div class="col-lg-10 col-md-10">
                        <div class="slider_text">
                            <h3 class="wow fadeInLeft" data-wow-duration="1s" data-wow-delay=".1s">
                                 	
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
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