package com;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class QueryBookByAuthorResultAction extends ActionSupport {
	
	public String Name;
	
	public String getName() {
		return Name;
	}
	
	public void setName(String name) {
		Name = name;
	}
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String execute() throws Exception {

		//System.out.println("×÷ÕßÐÕÃû£º"+Name);
		ActionContext actionContext = ActionContext.getContext();
		actionContext.put("Name", Name);
		return SUCCESS;
	}
}
