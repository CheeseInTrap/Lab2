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

      <form action="queryBookByAuthorResult" name="form1">
        <h2 class="form-signin-heading">查询</h2>
        <label for="authorName" class="sr-only">作者姓名</label>
        <input type="text" id="authorName" name = "Name" class="form-control" placeholder="作者姓名" required autofocus>
        <button class="btn btn-lg btn-primary btn-block" type="submit">查询</button>
      </form>

    </div> <!-- /container -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>