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
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/base/jquery-ui.css" />
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  	<link href="assets/css/style.css" rel="stylesheet">
  	<style type="text/css">
	    ::selection {
			background-color: white;
			color: black;
		}
    </style>
	<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>
    <script type="text/javascript">
		$(document).ready(function() {
			$('#accordion1').accordion({
				heightStyle: 'content'
	        });
			$('#accordion2').accordion({
				heightStyle: 'content'
	        });
			
			lcategorySelect();
	        
	        $('#accordion1').on('change', function() {
	        	scategorySelect();
	        });
		});
		
		var lcategorySelect = function() {
			$.ajax({
				url: 'lcategorySelect.do',
				type: 'get',
				dataType: 'json',
				success: function(json) {
					
					$('#accordion1').empty();
					
					var selectlist = '<select class="form-control" name="lcategory">';
						selectlist += '<option>대분류 선택</option>';
					$.each(json.data, function(index, item) {
						selectlist += '<option value="' + item.seq + '">' + item.name + '</option>';
					});
					selectlist += '</select>';
						
					$('#accordion1').append(selectlist);
					$('#accordion1').accordion('refresh');
					
				},
				error: function(error) {
					console.log('[에러]' + error.status);
					console.log('[에러]' + error.responseText);
				}
			});
		};
		
		var scategorySelect = function() {
			$.ajax({
				url: 'scategorySelect.do',
				data: {
					lseq: $('#accordion1 option:selected').val()
				},
				type: 'get',
				dataType: 'json',
				success: function(json) {
					
					$('#accordion2').empty();
					
					var selectlist = '<select class="form-control" name="scategory">';
					$.each(json.data, function(index, item) {
						selectlist += '<option value="' + item.seq + '">' + item.name + '</option>';
					});
					selectlist += '</select>';
					
					$('#accordion2').append(selectlist);
					$('#accordion2').accordion('refresh');
					
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
	<div class="container" style="padding-top: 50px;">
	    <div class="row justify-content-center">
	        <div class="col-lg-6">
	            <div class="section_title text-center mb-70">
	                <span class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">Write</span>
	                <h3 class="wow fadeInUp" data-wow-duration="1.2s" data-wow-delay=".2s">강의 등록</h3>
	            </div>
	        </div>
	    </div>
	</div>
	
	<nav class="nav-menu d-none d-lg-block">
    	<ul>
	    	<li class="book-a-table text-center"><a href="categorySet.do"> 목록 관리 </a></li>
        </ul>
    </nav>
    
    <hr color="white">
    
	<form action="write_ok.do" method="post">
		<div class="section-top-border">
			<div class="progress-table contents_sub">
				<div class="table-head board_write">
					<div class="serial"></div>
					<div class="country">대분류 </div>
					<div id="accordion1"></div>
				</div>
				<div class="table-row">
					<div class="serial"></div>
					<div class="country">소분류 </div>
					<div id="accordion2"></div>
				</div>
				<div class="table-row">
					<div class="serial"></div>
					<div class="country">제목 </div>
					<div class="mt-10">
						<input type="text" class="single-input" id="subject" name="subject" placeholder="제목을 입력하세요." required />
					</div>
				</div>
				<div class="table-row">
					<div class="serial"></div>
					<div class="country">유튜브 링크 </div>
					<div class="mt-10">
						<input type="text" class="single-input" id="link" name="link" placeholder="유튜브 링크를 입력하세요." required />
					</div>
				</div>
			</div>
		</div>
		<textarea name="content" id="content" class="single-input1" style="width:100%; height:300px;"></textarea>
		<div class="get_in_tauch_area" style="padding-top: 1px; padding-bottom: 1px">
			<div class="container">
				<div class="row justify-content-center1">
					<div class="col-lg-8">
						<div class="touch_form">
							<div class="col-md-12">
								<div class="submit_btn wow fadeInUp" data-wow-duration="1s" data-wow-delay=".7s">
									<button id="wbtn" class="boxed-btn3" type="submit">Write</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

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
	<script type="text/javascript" src="./smart_editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
		window.onload = function(){
			document.getElementById('wbtn').onclick = function() {
				editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	    		if ($('#accordion2 option:selected').val() == null) {
	  		    	alert('대소분류를 선택하셔야 합니다.');
	  			  	return false;
	  		  	}
		    };
		};
	
		var editor_object = []; 
		nhn.husky.EZCreator.createInIFrame({ 
			oAppRef : editor_object, 
			elPlaceHolder: "content", 
			sSkinURI: "./smart_editor/SmartEditor2Skin.html", 
			fCreator : "createSEditor2",
			htParams : {  
				bUseToolbar : true,  
				bUseVerticalResizer : true,  
				bUseModeChanger : true
			} 
		});
	</script>
</html>