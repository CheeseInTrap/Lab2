package com;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookDao {

	DBManager manager = new DBManager();
	List<Book> books = new ArrayList<>();

	public List<Book> getBookByAuthorID(int AuthorID){
		
		Connection connection = manager.getConnection();
		try {
			Statement statement = connection.createStatement();
			String sql = "select * from book where AuthorID = "+"\""+AuthorID+"\"";
			ResultSet rs = statement.executeQuery(sql);
			
			while(rs.next()) {
				String ISBN = rs.getString("ISBN");
				String Title = rs.getString("Title");
				//int AuthorID = rs.getInt("AuthorID");
				String Publisher = rs.getString("Publisher");
				Date PublishDate = rs.getDate("PublishDate");
				float Price = rs.getFloat("Price");
				Book book = new Book(ISBN, Title, AuthorID, Publisher, PublishDate, Price);
				books.add(book);
				
			}
			connection.close();
			return books;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	public Book getBookByTitle(String Title) {
		try {
			Connection connection = manager.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select * from book where Title = "+"\""+Title+"\"";
			//System.out.println(Title+"  "+sql);
			ResultSet rs = statement.executeQuery(sql);
			Book book=null;
			while(rs.next()) {
				String ISBN = rs.getString("ISBN");
				int AuthorID = rs.getInt("AuthorID");
				String Publisher = rs.getString("Publisher");
				Date PublishDate = rs.getDate("PublishDate");
				float Price = rs.getFloat("Price");
				book = new Book(ISBN, Title, AuthorID, Publisher, PublishDate, Price);
				
			}
			connection.close();
			return book;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;		
	}
	
	public void deleteBookByTitle(String Title) {
		
		try {
			Connection connection = manager.getConnection();
			Statement statement = connection.createStatement();
			String sql = "delete from book where Title = "+"\""+Title+"\"";
			System.out.println(sql);
			statement.executeUpdate(sql);
			connection.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}
	
	//根据返回的int确定添加照片的结果，0是照片已经存在
	public int AddBook(String ISBN,String Title,String Name,String Publisher,String PublishDate,float Price,int Age,String Country) {
		try {
			Connection connection = manager.getConnection();
			Statement statement = connection.createStatement();
			
			ResultSet resultSet = null;
			//先查询这本书是不是已经存在
			String sql = "select * from book where ISBN = "+"\""+ISBN+"\"";
			
			resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {
				return 0;
			}else {
				AuthorDao authorDao = new AuthorDao();
				int result = authorDao.queryAuthorExsist(Name);
				if(result==0) {//如果该书的作者不存在，就添加作者
					sql = "insert into author(Name,Age,Country) values (\'"+Name+"\',\'"+Age+"\',\'"+Country+"\')";
					System.out.println(sql);
					statement.executeUpdate(sql);
				}
				
				Author author = authorDao.getAuthorIDByName(Name);
				int AuthorID = author.getAuthorID();
				System.out.println(PublishDate);
				sql = "insert into book(ISBN,Title,AuthorID,Publisher,PublishDate,Price) "
						+ "values (\'"+ISBN+"\',\'"+Title+"\',\'"+AuthorID+"\',\'"+Publisher+"\',\'"+PublishDate+"\',\'"+Price+"\')";
				System.out.println(sql);
				statement.executeUpdate(sql);
			}
			
			connection.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return 1;
	}
	
	public void deleteBookByISBN(String ISBN) {
		try {
			Connection connection = manager.getConnection();
			Statement statement = connection.createStatement();
			String sql = "delete from book where ISBN = "+"\""+ISBN+"\"";
			System.out.println(sql);
			statement.executeUpdate(sql);
			connection.close();
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	public Book getBookByISBN(String ISBN) {
		try {
			Connection connection = manager.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select * from book where ISBN = "+"\""+ISBN+"\"";
			ResultSet resultSet = statement.executeQuery(sql);
			Book book = null;
			if (resultSet.next()) {
				book = new Book(ISBN, resultSet.getString("Title"), resultSet.getInt("AuthorID")
						, resultSet.getString("Publisher"), resultSet.getDate("PublishDate")
						, resultSet.getFloat("Price"));
			}
			connection.close();
			return book;
		}catch (Exception e) {
			// TODO: handle exception
		}
		return null;
		
	}
	
	public int updateBookInfo(String ISBN,String Title,String Name,String Publisher,String PublishDate,String Price) {
		System.out.println(ISBN+Title+Name);
		try {
			Connection connection = manager.getConnection();
			Statement statement = connection.createStatement();
			String sql = "select * from book where ISBN = "+"\""+ISBN+"\"";
			System.out.println(sql);
			ResultSet resultSet = statement.executeQuery(sql);
			int AuthorID=0;
			if (resultSet.next()) {
				if (!Title.equals("")) {
					sql = "update book set Title = \'"+Title+"\' where ISBN = "+"\""+ISBN+"\"";
					System.out.println(sql);
					statement.executeUpdate(sql);
				}
				if(!Name.equals("")) {
					sql = "select * from author where Name = \""+Name+"\"";
					System.out.println(sql);
					resultSet = statement.executeQuery(sql);
					if(resultSet.next()) {
						AuthorID = resultSet.getInt("AuthorID");
					}else{
						sql = "insert into author(Name) values (\'"+Name+"\')";
						statement.executeUpdate(sql);
						sql = "select * from author where Name=\""+Name+"\"";
						resultSet = statement.executeQuery(sql);
						if (resultSet.next()) {
							AuthorID = resultSet.getInt("AuthorID");
						}
					}
					sql = "update book set AuthorID = \'"+AuthorID+"\' where ISBN = "+"\""+ISBN+"\"";
					System.out.println(sql);
					statement.executeUpdate(sql);
				}
				if (!Publisher.equals("")) {
					sql = "update book set Publisher = \'"+Publisher+"\' where ISBN = "+"\""+ISBN+"\"";
					statement.executeUpdate(sql);
				}
				if (!PublishDate.equals("")) {
					sql = "update book set PublishDate = \'"+PublishDate+"\' where ISBN = "+"\""+ISBN+"\"";
					statement.executeUpdate(sql);
				}
				if (!Price.equals("")) {
					sql = "update book set Price = \'"+Price+"\' where ISBN = "+"\""+ISBN+"\"";
					statement.executeUpdate(sql);
				}
				return 1;
			}
			
			
			connection.close();
			return 1;
		}catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
		
	}
}
