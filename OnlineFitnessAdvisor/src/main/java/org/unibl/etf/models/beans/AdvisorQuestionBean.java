package org.unibl.etf.models.beans;

import java.util.ArrayList;
import java.util.List;

import org.unibl.dao.impl.AdvisorQuestionDAOImpl;
import org.unibl.etf.dao.AdvisorQuestionDAO;
import org.unibl.etf.models.dto.Advisor;
import org.unibl.etf.models.dto.AdvisorQuestion;

public class AdvisorQuestionBean {
	private AdvisorQuestionDAO advisorQuestionDAO;
	private List<AdvisorQuestion> advisorQuestions=new ArrayList<>();
	
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

	public List<AdvisorQuestion> getAdvisorQuestions() {
		return advisorQuestions;
	}


	
	

}
