package com;

public class Author {
	public int AuthorID;
	public String Name;
	public int Age;
	public String Country;

	
	public Author(int AuthorID,String Name,int Age,String Country) {
		// TODO Auto-generated constructor stub
		this.AuthorID = AuthorID;
		this.Name = Name;
		this.Age = Age;
		this.Country = Country;
		
	}
	
	public int getAuthorID() {
		return AuthorID;
	}

	public void setAuthorID(int authorID) {
		AuthorID = authorID;
	}
	
	public String getName() {
		return Name;
	}
	
	public void setName(String name) {
		Name = name;
	}
	
	public int getAge() {
		return Age;
	}
	
	public void setAge(int age) {
		Age = age;
	}
	
	public String getCountry() {
		return Country;
	}
	
	public void setCountry(String country) {
		Country = country;
	}
}
