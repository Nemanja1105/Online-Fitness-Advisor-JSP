package org.unibl.etf.models.beans;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.unibl.dao.impl.AdvisorDAOImpl;
import org.unibl.etf.dao.AdvisorDAO;
import org.unibl.etf.models.dto.Advisor;

public class AdvisorBean {
	private Advisor advisor;
	private boolean isLoggedIn = false;
	private AdvisorDAO advisorDAO;
	private BCryptPasswordEncoder passwordEncoder=new BCryptPasswordEncoder(10);

	public AdvisorBean() {
		this.advisorDAO = new AdvisorDAOImpl();
	}

	public boolean isLoggedIn() {
		return isLoggedIn;
	}

	public void setLoggedIn(boolean isLoggedIn) {
		this.isLoggedIn = isLoggedIn;
	}

	public Advisor getAdvisor() {
		return this.advisor;
	}

	public boolean login(String username, String password) {
		try {
			
			//passwordEncoder.matches(password, admin.getPassword())
			var advisor = this.advisorDAO.login(username, password);
			//if (advisor!=null && password.equals(advisor.getPassword())) {
			if(advisor != null && passwordEncoder.matches(password, advisor.getPassword())) {
				this.advisor = advisor;
				this.isLoggedIn=true;
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
