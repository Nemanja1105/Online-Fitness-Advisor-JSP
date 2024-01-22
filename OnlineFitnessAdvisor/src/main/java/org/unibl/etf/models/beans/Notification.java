package org.unibl.etf.models.beans;

import java.io.Serializable;

public class Notification implements Serializable{
	private boolean type;
	private String message;
	
	
	public Notification() {
		super();
	}
	public Notification( String message,boolean type) {
		super();
		this.type = type;
		this.message = message;
	}
	public boolean isType() {
		return type;
	}
	public void setType(boolean type) {
		this.type = type;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	

}
