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

	<form action = "addBookResult" name = "form_add_book_Info">
	<div class="jumbotron">
		<div class="container">
			<h1>welcome</h1>
			<p>在这里可以向图书信息数据库中新增一本图书，若该书作者不在库中，还可以增加新作者</p>
		</div>
	</div>
	
	<div class="container">
		
		<p><input type = "text" name="ISBN" id="ISBN" placeholder="ISBN" required autofocus></p>
		<p><input type = "text" name="Title" id="Title"  placeholder="Title" required></p>
		<p><input type = "text" name = "Name" id="Name" placeholder="AuthorName" required></p>
		<p><input type = "text" name = "Age" id="Age" placeholder="Age(选填)"></p>
		<p><input type = "text" name = "Country" id="Country" placeholder="Country(选填)"></p>
		<p><input type = "text" name = "Publisher" id="Publisher" placeholder="Publisher(选填)"></p>
		<p><input type = "text" name = "Year" placeholder="Year">-<input type = "text" name = "Month" placeholder="Month">-<input type = "text" name = "Day" placeholder="Day"></p>
		<p><input type = "text" name = "Price" id="Price" placeholder="Price"></p>
		<p><input type = "submit" value="添加"></p>
	</div>
	</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>