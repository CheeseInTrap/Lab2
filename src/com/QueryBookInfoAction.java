package com;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class QueryBookInfoAction extends ActionSupport {

	/**
	 * 
	 */
	
	public String ISBN;
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	
	private static final long serialVersionUID = 1L;

	public String execute() throws Exception {

		ActionContext actionContext = ActionContext.getContext();
		actionContext.put("ISBN",ISBN);
		return SUCCESS;
	}
	
	
	
	
}
