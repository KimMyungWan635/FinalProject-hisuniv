<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.CommentTO" %>    
<% 
	CommentTO cto = (CommentTO)request.getAttribute("cto");
	String seq = cto.getSeq();
	String writer = cto.getWriter();
	String content = cto.getContent();
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
</head>
<body>
	<br><br><br>
<%
	if (session.getAttribute("m_id") == null) {
		// 관리자 로그아웃 상태
%>  
	<div class="container">
	    <div class="row justify-content-center">
	        <div class="col-lg-6">
	            <div class="section_title text-center mb-70">
	                <span class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">Comment Delete</span>
	                <h3 class="wow fadeInUp" data-wow-duration="1.2s" data-wow-delay=".2s">댓글 삭제</h3>
	                <p class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">비밀번호를 입력해주세요</p>
	            </div>
	        </div>
	    </div>
	</div>
	<hr>
    <div class="get_in_tauch_area" style="padding-top: 1px; padding-bottom: 1px">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="touch_form">
                        <form action="commentDelete_ok.do" method="post">
                        	<input type="hidden" name="seq" value="<%=seq %>" />
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                                        <input type="text" name="writer" value="<%=writer %>" readonly />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                                        <input type="password" name="password" placeholder="Password" required />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="submit_btn wow fadeInUp" data-wow-duration="1s" data-wow-delay=".7s">
                                        <button class="boxed-btn3" type="submit">Delete</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%	
	} else {
		// 관리자 로그인 상태
%>
	<div class="container">	   
	    <div class="row justify-content-center">
	        <div class="col-lg-6">
	            <div class="section_title text-center mb-70">
	                <span class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">Comment Delete</span>
	                <h3 class="wow fadeInUp" data-wow-duration="1.2s" data-wow-delay=".2s">댓글 관리자용 삭제</h3>
	                <p class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">버튼을 누르시면 아래 댓글이 삭제됩니다</p>
	            </div>
	        </div>
	    </div>
    </div>
    <div data-scroll-index="0" class="get_in_tauch_area" style="padding-top: 1px; padding-bottom: 1px">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="touch_form">
	                    <div class="row">
	                        <div class="col-md-12">
	                            <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
	                                <input type="text" name="writer" value="<%=writer %>" readonly />
	                            </div>
	                        </div>
	                        <div class="col-md-12">
                                <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">
                                   <textarea name="content" cols="30" rows="10" placeholder="Message" readonly><%=content %></textarea>
                                </div>
                            </div>
	                        <div class="col-md-12">
	                            <div class="submit_btn wow fadeInUp" data-wow-duration="1s" data-wow-delay=".7s">
	                                <button class="boxed-btn3" onclick="location.href='commentManagerDelete_ok.do?seq=<%=seq %>'">관리자용 강제 삭제 버튼</button>
	                            </div>
	                        </div>
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%
	}
%>
</body>
</html>