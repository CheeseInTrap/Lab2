package com;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;;
public class AddBookResultAction extends ActionSupport{

	/**
	 * 
	 */
	
	
	String ISBN;
	String Title;
	String Name;
	int Age;
	String Country;
	String Publisher;
	String Year;
	String Month;
	String Day;
	String Price;
	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
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
	public String getPublisher() {
		return Publisher;
	}
	public void setPublisher(String publisher) {
		Publisher = publisher;
	}
	public String getYear() {
		return Year;
	}
	public void setYear(String year) {
		Year = year;
	}
	public String getMonth() {
		return Month;
	}
	public void setMonth(String month) {
		Month = month;
	}
	public String getDay() {
		return Day;
	}
	public void setDay(String day) {
		Day = day;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	
	
	
	private static final long serialVersionUID = 1L;
	
	@Override
	public String execute() throws Exception {

		String PublishDate = Year+"-"+Month+"-"+Day;
		BookDao dao = new BookDao();
		ActionContext actionContext = ActionContext.getContext();
		actionContext.put("ISBN", ISBN);
		int result = dao.AddBook(ISBN, Title, Name, Publisher, PublishDate, Float.valueOf(Price),Age,Country);		
		if(result==0) {
			return "BookExsist";
		}else if(result == -1) {
			return ERROR;
		}else {
			return SUCCESS;
		}
	}

}
