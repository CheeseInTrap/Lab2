<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.Author"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.Author,com.Book,com.BookDao,com.AuthorDao" %>

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
	
	<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">查询结果</div>
  <!-- Table -->
  <div class="container">
  <table class="table">
    <tr>
    	<td>#</td>
		<td>Title</td>
		<td>#</td>
	</tr>
			
			<%
			ActionContext actionContext = ActionContext.getContext();
			String Name = (String)actionContext.get("Name");
			AuthorDao ad = new AuthorDao();
			Author author = ad.getAuthorIDByName(Name);
			if(author==null){
				%>
					<div class="alert alert-warning" role="alert">
						未查询到该作者
					</div>
				<%
				return;
			}
			int AuthorID = author.getAuthorID();
			BookDao dao = new BookDao();
			List<Book> list = dao.getBookByAuthorID(AuthorID);
			Book book=null;
			for(int i=0;i<list.size();i++)
			{	book=list.get(i);
			%>
			<tr>
			<td><%=i+1%></td>
			<td><%=book.getTitle() %></td>
			<td><a class="btn btn-primary" href="queryBookInfo?ISBN=<%=book.getISBN()%>" role="button">查看详细信息</a></td>
			<td><a class="btn btn-primary" href="deleteBook?ISBN=<%=book.getISBN()%>" role="button">删除</a></td>
			</tr>
			<%}%>
  </table>
  </div>
 
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>