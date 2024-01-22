package org.unibl.etf.dao;

import java.sql.SQLException;
import java.util.List;

import org.unibl.etf.models.dto.AdvisorQuestion;

public interface AdvisorQuestionDAO {
	List<AdvisorQuestion> findAll()throws SQLException;
	List<AdvisorQuestion> search(String term)throws SQLException;
	boolean update(long id)throws SQLException;

}
