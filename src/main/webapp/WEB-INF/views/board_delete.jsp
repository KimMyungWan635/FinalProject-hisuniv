<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.BoardTO" %>    
<%
	BoardTO to = (BoardTO)request.getAttribute("to");
	
	String seq = to.getSeq();
	String subject = to.getSubject();
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
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/board_write.css">
	<link rel="stylesheet" href="css/base/jquery-ui.css" />
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  	<link href="assets/css/style.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
</head>
<body>
	<div class="container" style="padding-top: 50px;">
	    <div class="row justify-content-center">
	        <div class="col-lg-6">
	            <div class="section_title text-center mb-70">
	                <span class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">Delete</span>
	                <h3 class="wow fadeInUp" data-wow-duration="1.2s" data-wow-delay=".2s">강의 삭제</h3>
	            </div>
	        </div>
	    </div>
	</div>
	
	<hr color="white">
	
	<form action="delete_ok.do" method="post">
		<input type="hidden" name="seq" value="<%=seq %>" />
		<div class="section-top-border1">
			<div class="progress-table contents_sub">
				<div class="table-head">
					<div class="serial"></div>
						<div class="country">제목 </div>
					<div class="mt-10">
						<input type="text" name="subject" value="<%=subject %>" readonly class="single-input" />
					</div>
				</div>
			</div>
		</div>
		<div class="get_in_tauch_area" style="padding-top: 1px; padding-bottom: 1px">
	       <div class="container">
	            <div class="row justify-content-center">
	                <div class="col-lg-8">
	                    <div class="touch_form">
	                        <div class="col-md-12">
	                            <div class="submit_btn wow fadeInUp" data-wow-duration="1s" data-wow-delay=".7s">
	                                <button class="boxed-btn3" type="submit">Delete</button>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</form>
	<br><br><br><br><br>
	
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
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>