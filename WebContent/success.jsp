<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.BookDao,com.Book"%>
<%@page import="com.AuthorDao,com.Author"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	

   </head>
<body>
<%String ISBN =(String) ActionContext.getContext().get("ISBN");
BookDao bd = new BookDao();
Book book = bd.getBookByISBN(ISBN);
int AuthorID = book.getAuthorID();
AuthorDao ad = new AuthorDao();
Author author = ad.getAuthorByID(AuthorID);%>
	<div class="alert alert-success" role="alert">操作成功</div>
	<div class="table-responsive">
  	<h1> </h1>
  	<table class="table table-striped">
		<tr>
			<td>AuthorID</td>
			<td>Name</td>
			<td>Age</td>
			<td>Country</td>
		</tr>
		<tr>
			<td><%=author.getAuthorID() %></td>
			<td><%=author.getName() %></td>
			<td><%=author.getAge() %></td>
			<td><%=author.getCountry() %></td>
		</tr>
		<tr>
			<td>ISBN</td>
			<td>Title</td>
			<td>AuthorID</td>
			<td>Publisher</td>
			<td>PublishDate</td>
			<td>Price</td>
		</tr>
		<tr>
			<td><%=book.getISBN() %></td>
			<td><%=book.getTitle() %></td>
			<td><%=book.getAuthorID() %></td>
			<td><%=book.getPublisher() %></td>
			<td><%=book.getPublishDate()%></td>
			<td><%=book.getPrice() %></td>
		</tr>
	</table>
	</div>
	
	
	
	<p><a class="btn btn-primary" href="welcome" role="button">点击返回</a></p>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>