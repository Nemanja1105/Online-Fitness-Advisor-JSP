package org.unibl.etf.dao;

import java.sql.SQLException;
import java.util.List;

import org.unibl.etf.models.dto.Advisor;


public interface AdvisorDAO {
	Advisor login(String username,String password)throws SQLException;
	
}
