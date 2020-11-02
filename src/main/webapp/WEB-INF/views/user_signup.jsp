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
    <script type="text/javascript">
    	$(document).ready(function() {
			$(document).on('click', '#btn', function() {
				checkEmail();
				if ($('#password').val() != $('#passwordCheck').val()) {
					alert('동일한 비밀번호를 입력해주세요.');
					return false;
				}
				if ($('#emailCheck').val() == '1') {
					alert('존재하는 이메일입니다');
					return false;
				}
			});
	    });
    	
    	var checkEmail = function() {
			$.ajax({
				url: 'UserSignupCheck.do',
				data: {
					email: $('#email').val()
				},
				type: 'get',
				dataType: 'json',
				async: false,
				success: function(json) {
					
					if (json.flag == 1) {
						$('#emailCheck').val('1');
					} else {
						$('#emailCheck').val('0');
					}
					
				},
				error: function(error) {
					console.log('[에러]' + error.status);
					console.log('[에러]' + error.responseText);
				}
			});
		};
	</script>
</head>
<body>
	<br><br><br>
    <div align="center">
        <div class="col-lg-6">
            <div class="section_title text-center mb-70">
                <span class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">Sing up</span>
                <h3 class="wow fadeInUp" data-wow-duration="1.2s" data-wow-delay=".2s">회원가입</h3>
            </div>
        </div>
    </div>
	<hr>
    <div class="get_in_tauch_area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="touch_form">
                        <form action="UserSignupEmail.do" method="post">
                        <input type="hidden" id="emailCheck" value="0" />
                            <div class="row">
                            	<div class="col-md-12">
	                                <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
	                                    <input type="text" name="name" placeholder="이름" required />
	                                </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                                        <input type="email" id="email" name="email" placeholder="이메일" required />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                                        <input type="password" id="password" name="password" placeholder="비밀번호" required />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                                        <input type="password" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 확인" required />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="submit_btn wow fadeInUp" data-wow-duration="1s" data-wow-delay=".7s">
                                        <button id="btn" class="boxed-btn3" type="submit">Sign Up</button>
                                    </div>
                                </div>
                        	</div>
                        </form>
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
</body>
</html>