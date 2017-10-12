package com;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AuthorDao {

	DBManager manager = new DBManager();
	
	
	List<Author> authors = new ArrayList<>();
	public Author getAuthorIDByName(String Name){
		
		Connection connection = manager.getConnection();
		try {
			Statement statement = connection.createStatement();
			String sql = "select * from author where Name = "+"\""+Name+"\"";
			System.out.println(sql);
			ResultSet rs = statement.executeQuery(sql);
			Author author=null;
			if(rs.next()) {
				int AuthorID = rs.getInt("AuthorID");
				int Age = rs.getInt("Age");
				String Country = rs.getString("Country");
				
				author = new Author(AuthorID, Name, Age, Country);
				
			}
			connection.close();
			//System.out.println(authors.size()+"");
			return author;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public Author getAuthorByID(int AuthorID) {
		Connection connection = manager.getConnection();
		try {
			Statement statement = connection.createStatement();
			String sql = "select * from author where AuthorID = "+"\""+AuthorID+"\"";
			System.out.println(sql);
			ResultSet rs = statement.executeQuery(sql);
			Author author = null;
			if(rs.next()) {
				String Name = rs.getString("Name");
				int Age = rs.getInt("Age");
				String Country = rs.getString("Country");
				author = new Author(AuthorID, Name, Age, Country);
			}
			
			connection.close();
			//System.out.println(authors.size()+"");
			return author;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	
	public int queryAuthorExsist(String AuthorName) {
		Connection connection = manager.getConnection();
		
		
		try {
			Statement statement = connection.createStatement();
			String sql = "select * from author where Name = "+"\""+AuthorName+"\"";
			
			ResultSet resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {//该作者存在返回1
				return 1;
			}else {
				return 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return -1;
	}
}
