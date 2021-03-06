<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.GuestbookTO" %>    
<% 
	GuestbookTO gto = (GuestbookTO)request.getAttribute("gto");
	String seq = gto.getSeq();
	String writer = gto.getWriter();
	String content = gto.getContent();
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
	<div class="container">
	    <div class="row justify-content-center">
	        <div class="col-lg-6">
	            <div class="section_title text-center mb-70">
	                <span class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">Guestbook Modify</span>
	                <h3 class="wow fadeInUp" data-wow-duration="1.2s" data-wow-delay=".2s">방명록 수정</h3>
	                <p class="wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">비밀번호와 수정할 내용을 입력해주세요</p>
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
                        <form action="guestbookModify_ok.do" method="post">
                        	<input type="hidden" name="seq" value="<%=seq %>" />
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                                        <input type="text" name="writer" value="<%=writer %>" readonly />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                                        <input type="password" name="password" maxlength="15" placeholder="Password" required />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="single_input wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">
                                       <textarea name="content" cols="30" rows="10" maxlength="1000" placeholder="Message"><%=content %></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="submit_btn wow fadeInUp" data-wow-duration="1s" data-wow-delay=".7s">
                                        <button class="boxed-btn3" type="submit">Modify</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>