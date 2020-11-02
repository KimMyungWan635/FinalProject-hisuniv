<%@page import="model.SearchTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
<title>Insert title here</title>
<style>
	/*
	 #container {width: 960px; margin: 0 auto;}
     #container #input-form {text-align: center;}
     #user-table {margin: 0 auto; text-align: center;}
     #input-form {margin-top: 10px; margin-bottom: 10px;}

     #user-table {border-collapse: collapse;}
     #user-table > thead > tr { background-color: #333; color:#fff; }
     #user-table > thead > tr > th { padding: 8px; width: 300px;  }
     #user-table > tbody > tr > td { border-bottom: 1px solid gray; padding:8px; width:100px; }
	*/
	
	body	{
		background-color:black;
	}
	
	
</style>

</head>
<body>

<%
	ArrayList<SearchTO> searchList = (ArrayList<SearchTO>)request.getAttribute("searchList");
	StringBuffer searchBuffer = new StringBuffer();
	String flag = "1";
	String searchFlag = "O";
	for(SearchTO to : searchList)	{
		flag = "0";
		searchBuffer.append("<tr>");	
		searchBuffer.append("<td><a href='view.do?seq="+to.getSeq()+"&sseq="+to.getSseq()+"&searchFlag="+searchFlag+"'>"+to.getSubject()+"</td>");
		searchBuffer.append("<td>"+to.getContent()+"</td>");
		searchBuffer.append("</tr>");

	}
	
	if(flag.equals("1"))	{
		searchBuffer.append("<tr>");	
		searchBuffer.append("<td>검색 기록이 존재하지 않습니다</td>");
		searchBuffer.append("</tr>");
	}
%>

<script type="text/javascript">
window.onload = function() {
	document.getElementById('sbtn').onclick = function() {
		if(document.sfrm.s_content.value.trim() == "") {
			alert('검색내용을 입력하셔야 합니다.');
			return false;				
		}
		document.sfrm.submit();
	};
};

/*
// 아니 ㅅㅂㅏㄹ... 이거 왜 작동 안하나요 ? if ($('#s_content').val() == '') {
$(document).ready(function() {
    $(document).on('click', '#sbtn', function() {
    		if ($('#s_content').val() == '') {
  		    	alert('검색내용을 입력하셔야 합니다.');
  			  	return false;
  		  	}
    		
    		document.sfrm.submit();
   	});
});
*/
</script>

<!-- 
<div id="container">
        <div id="input-form">
        
        <form action="search.do" name="sfrm" method="post">
            제목 : <input type="text" id="s_content" name="s_content" />
           <button id="sbtn">검색</button>
        </form>

        </div>

        <table id="user-table">
            <thead>
                <tr>
                    <th style="font-color:white">제목</th>
                    <th>내용</th>
                </tr>
            </thead>

            <tbody>
            	<%= searchBuffer %>
            </tbody>
        </table>
    </div>
 -->
 
 
 
 
<div class="container">

  <div id="input-form" style="">
        <form action="search.do" name="sfrm" method="post">
            제목 : <input type="text" id="s_content" name="s_content" />
           <button id="sbtn">검색</button>
        </form>
  </div>        
            
  <table class="table table-dark">
    <thead>
      <tr>
        <th width="300px">Firstname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
    	<%= searchBuffer %>
    </tbody>
  </table>
</div>

</body>
</html>