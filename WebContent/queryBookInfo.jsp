<%@page import="com.AuthorDao,com.Author"%>
<%@page import="com.BookDao,com.Book"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
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

<% String ISBN=null; 
ActionContext actionContext = ActionContext.getContext();
ISBN = (String)actionContext.get("ISBN");
System.out.println("ISBN="+ISBN);
BookDao bd = new BookDao();
Book book = bd.getBookByISBN(ISBN);
if(book==null){
	%><div class="alert alert-warning">数据库中不存在这本书</div>
	<%
	return;
}
int AuthorID = book.getAuthorID();
AuthorDao ad = new AuthorDao();
Author author = ad.getAuthorByID(AuthorID);
%>
<body>
<form action="updateBookInfoResult" method="post" name="form">
<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">查询结果</div>
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
  
    	<div class="panel panel-default">
  	<div class="panel-heading">如果需要对图书信息进行更新，请在下方表格中填写想要修改的信息,您只被允许修改图书的作者、出版社、出版日期、价格</div>
  	<table class="table">
  		<tr>
  			<td>ISBN</td>
  			<td>Title</td>
  			<td>Author</td>
  			<td>Publisher</td>
  			<td>PublishDate</td>
  			<td>Price</td>
  		</tr>
  		<tr>
  			<td>ISBN不可修改<input type=hidden name="ISBN" value=<%=book.getISBN()%>></td>
  			<td>Title不可修改<input type="hidden" name="title" value=<%=book.getTitle() %>></td>
  			<td><input type = "text" id="authorName" name="name"></td>
  			<td><input type = "text" id="publisher" name="publisher"></td>
  			<td><input type="text" id="pulisherDate" name="publishDate"></td>
  			<td><input type="text" id="price" name="price"></td>
  			<td><input type = "submit" value="更新"></td>
  		</tr>
  	</table>
  	<p><a class="btn btn-primary" herf="welcome" role="button">点击返回</a></p>
  	</div>
  </div>
	
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>