<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page import="java.util.*" %>
<%@ page import="com.Author,com.Book,com.BookDao,com.AuthorDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询图书</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>

	<div class="container">

      <form action="queryBookInfo" method="post" name="form1">
      <div class="jumbotron">
		<div class="container">
			<h1>更新图书信息</h1>
			<p>在这里，可以根据ISBN找到图书信息，并且对其进行修改</p>
		</div>
	</div>
	
        <h2 class="form-signin-heading">查询</h2>
        <label for="ISBN" class="sr-only">图书ISBN</label>
        <input type="text" id="ISBN" name = "ISBN" class="form-control" placeholder="ISBN" required autofocus>
        <button class="btn btn-lg btn-primary btn-block" type="submit">查询</button>
      </form>
<%String ISBN =request.getParameter("ISBN");
  System.out.println("ISBN2="+ISBN);
%>
    </div> <!-- /container -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>