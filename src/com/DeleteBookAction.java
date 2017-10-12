package com;
import com.opensymphony.xwork2.ActionSupport;
public class DeleteBookAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String ISBN;
	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	
	public String execute() throws Exception{
		BookDao dao = new BookDao();
		
		//dao.deleteBookByTitle(Title);
		//System.out.println("delete" + Title);
		dao.deleteBookByISBN(ISBN);
		
		return SUCCESS;
	}
	

}
