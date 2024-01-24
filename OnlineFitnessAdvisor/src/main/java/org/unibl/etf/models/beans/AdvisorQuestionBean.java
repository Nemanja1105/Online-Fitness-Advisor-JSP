package org.unibl.etf.models.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.unibl.dao.impl.AdvisorQuestionDAOImpl;
import org.unibl.etf.dao.AdvisorQuestionDAO;
import org.unibl.etf.models.dto.Advisor;
import org.unibl.etf.models.dto.AdvisorQuestion;

public class AdvisorQuestionBean implements Serializable {
	private AdvisorQuestionDAO advisorQuestionDAO;
	private List<AdvisorQuestion> advisorQuestions=new ArrayList<>();
	private AdvisorQuestion selected=null;
	
	public AdvisorQuestionBean() {
		this.advisorQuestionDAO=new AdvisorQuestionDAOImpl();
	}
	
	public void findAll() {
		try {
			this.advisorQuestions=this.advisorQuestionDAO.findAll();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void search(String term) {
		try {
			this.advisorQuestions=this.advisorQuestionDAO.search(term);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void markAsRead(Long id) {
		try {
			this.advisorQuestionDAO.update(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	public void setSelected(AdvisorQuestion selected) {
		this.selected = selected;
	}

	public AdvisorQuestion getSelected() {
		return selected;
	}

	public void findById(Long id) {
		var tmp= this.advisorQuestions.stream().filter(el->el.getId()==id).findFirst();
		if(tmp.isEmpty())
			this.selected=null;
		this.selected= tmp.get();
	}

	public List<AdvisorQuestion> getAdvisorQuestions() {
		return advisorQuestions;
	}


	
	

}
