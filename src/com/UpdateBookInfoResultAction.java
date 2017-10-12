package com;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateBookInfoResultAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String ISBN;
	String Title;
	String Name;
	String Publisher;
	String PublishDate;
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

	public String getPublisher() {
		return Publisher;
	}

	public void setPublisher(String publisher) {
		Publisher = publisher;
	}

	public String getPublishDate() {
		return PublishDate;
	}

	public void setPublishDate(String publishDate) {
		PublishDate = publishDate;
	}

	public String getPrice() {
		return Price;
	}

	public void setPrice(String price) {
		Price = price;
	}

	@Override
	public String execute() throws Exception {

		ActionContext actionContext = ActionContext.getContext();
		actionContext.put("ISBN",ISBN);
		BookDao bDao = new BookDao();
		//System.out.println("actionÀïµÄ" + ISBN + Title + Name + Publisher + PublishDate);
		int result = bDao.updateBookInfo(ISBN, Title, Name, Publisher, PublishDate, Price);
		if (result == 1) {
			return SUCCESS;
		}
		return ERROR;
	}
}
