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
	<nav class="navbar navbar-default">
  		<div class="container-fluid">
	   		<div class="navbar-header">
    	  		<h1>图书管理系统</h1>
    		</div>
  		</div><!-- /.container-fluid -->
	</nav>
	<div class="jumbotron">
		<div class="container">
			<h1>welcome</h1>
			<p>欢迎进入图书管理系统</p>
		</div>
	</div>
	

	<div class="container">
	  <div class="row">
        <div class="col-lg-4">
          <h2>查询</h2>
          <p>输入作者名字，查询该作者所著的全部图书的题目</p>
          <p><a class="btn btn-primary" href="queryBookByAuthor" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-lg-4">
          <h2>添加</h2>
          <p>用户可新增一本图书，若该书作者不在库中，还需增加新作者</p>
          <p><a class="btn btn-primary" href="addBook" role="button">View details &raquo;</a></p>
       </div>
        <div class="col-lg-4">
          <h2>更新</h2>
          <p>用户可更新一本图书的作者、出版社、出版日期、价格</p>
          <p><a class="btn btn-primary" href="updateBook" role="button">View details &raquo;</a></p>
        </div>
      </div>
	</div>
      
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>