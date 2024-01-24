package org.unibl.etf.models.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

public class AdvisorQuestion implements Serializable{
	private Long id;
	private Date createdAt;
	private String message;
	private boolean seen;
	private Long fitnessProgramId;
	private String fitnessProgramName;
	private Long senderId;
	private String clientName;
	private String clientSurname;
	private Long clientImageId;
	private String clientEmail;
	private static final String IMAGE_URL="http://localhost:9001/api/v1/images/";
	
	public AdvisorQuestion() {
		super();
	}

	public AdvisorQuestion(Long id, Date createdAt, String message, boolean seen, Long fitnessProgramId,
			String fitnessProgramName, Long senderId, String clientName, String clientSurname, Long clientImageId,
			String clientEmail) {
		super();
		this.id = id;
		this.createdAt = createdAt;
		this.message = message;
		this.seen = seen;
		this.fitnessProgramId = fitnessProgramId;
		this.fitnessProgramName = fitnessProgramName;
		this.senderId = senderId;
		this.clientName = clientName;
		this.clientSurname = clientSurname;
		this.clientImageId = clientImageId;
		this.clientEmail=clientEmail;
	}
	
	

	public String getClientEmail() {
		return clientEmail;
	}

	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isSeen() {
		return seen;
	}

	public void setSeen(boolean seen) {
		this.seen = seen;
	}

	public Long getFitnessProgramId() {
		return fitnessProgramId;
	}

	public void setFitnessProgramId(Long fitnessProgramId) {
		this.fitnessProgramId = fitnessProgramId;
	}

	public String getFitnessProgramName() {
		return fitnessProgramName;
	}

	public void setFitnessProgramName(String fitnessProgramName) {
		this.fitnessProgramName = fitnessProgramName;
	}

	public Long getSenderId() {
		return senderId;
	}

	public void setSenderId(Long senderId) {
		this.senderId = senderId;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getClientSurname() {
		return clientSurname;
	}
	
	public String getProfileImage() {
		if(this.clientImageId!=0)
			return IMAGE_URL+this.clientImageId;
		return "images/profileIcon.png";
	}

	public void setClientSurname(String clientSurname) {
		this.clientSurname = clientSurname;
	}

	public Long getClientImageId() {
		return clientImageId;
	}

	public void setClientImageId(Long clientImageId) {
		this.clientImageId = clientImageId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AdvisorQuestion other = (AdvisorQuestion) obj;
		return Objects.equals(id, other.id);
	}
	
	
	
	

}
