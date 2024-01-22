package org.unibl.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.unibl.etf.dao.AdvisorQuestionDAO;
import org.unibl.etf.models.dto.AdvisorQuestion;
import org.unibl.etf.utils.ConnectionPool;
import org.unibl.etf.utils.DBUtil;

public class AdvisorQuestionDAOImpl implements AdvisorQuestionDAO{
	
	private static final String FIND_ALL_QUERY = "SELECT \r\n"
			+ "	a.id,\r\n"
			+ "    a.created_at,\r\n"
			+ "    a.message,\r\n"
			+ "    a.seen,\r\n"
			+ "    a.fitness_program_id,\r\n"
			+ "    fp.name as fitness_program_name,\r\n"
			+ "    a.sender_id,\r\n"
			+ "    c.name as client_name,\r\n"
			+ "    c.surname as client_surname,\r\n"
			+ "    c.image_id as client_image_id\r\n"
			+ "FROM advisor_question a\r\n"
			+ "inner join client c on a.sender_id = c.id\r\n"
			+ "inner join fitness_program fp on fp.id=a.fitness_program_id;";
	
	private static final String SEARCH_QUERY="SELECT \r\n"
			+ "	a.id,\r\n"
			+ "    a.created_at,\r\n"
			+ "    a.message,\r\n"
			+ "    a.seen,\r\n"
			+ "    a.fitness_program_id,\r\n"
			+ "    fp.name as fitness_program_name,\r\n"
			+ "    a.sender_id,\r\n"
			+ "    c.name as client_name,\r\n"
			+ "    c.surname as client_surname,\r\n"
			+ "    c.image_id as client_image_id\r\n"
			+ "FROM advisor_question a\r\n"
			+ "inner join client c on a.sender_id = c.id\r\n"
			+ "inner join fitness_program fp on fp.id=a.fitness_program_id\r\n"
			+ "where a.message like ? \r\n"
			+ ";";
	
	private static final String UPDATE_SEEN_QUERY="update advisor_question set seen=1 where id=?";
	
	private ConnectionPool connectionPool;
	
	public AdvisorQuestionDAOImpl() {
		this.connectionPool = ConnectionPool.getInstance();
	}

	@Override
	public List<AdvisorQuestion> findAll()throws SQLException {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		List<AdvisorQuestion> result = new ArrayList<>();
		try {
			connection=connectionPool.checkOut();
			statement = DBUtil.prepareStatement(connection, FIND_ALL_QUERY, false, new Object[0]);
			resultSet = statement.executeQuery();
			while(resultSet.next()) {
				result.add(new AdvisorQuestion(resultSet.getLong(1), resultSet.getDate(2), resultSet.getString(3),resultSet.getBoolean(4),resultSet.getLong(5),resultSet.getString(6),resultSet.getLong(7),resultSet.getString(8),resultSet.getString(9),resultSet.getLong(10)));
			}
			
		} finally {
			connectionPool.checkIn(connection);
			DBUtil.close(statement, resultSet);
		}
		return result;
	}

	@Override
	public List<AdvisorQuestion> search(String term) throws SQLException {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		List<AdvisorQuestion> result = new ArrayList<>();
		Object[]values= {"%"+term+"%"};
		try {
			connection=connectionPool.checkOut();
			statement = DBUtil.prepareStatement(connection, SEARCH_QUERY, false,values);
			resultSet = statement.executeQuery();
			while(resultSet.next()) {
				result.add(new AdvisorQuestion(resultSet.getLong(1), resultSet.getDate(2), resultSet.getString(3),resultSet.getBoolean(4),resultSet.getLong(5),resultSet.getString(6),resultSet.getLong(7),resultSet.getString(8),resultSet.getString(9),resultSet.getLong(10)));
			}
			
		} finally {
			connectionPool.checkIn(connection);
			DBUtil.close(statement, resultSet);
		}
		return result;
	}

	@Override
	public boolean update(long id) throws SQLException {
		Connection connection = null;
		PreparedStatement statement = null;
		Object[]values= {id};
		boolean result=false;
		try {
			connection=connectionPool.checkOut();
			statement = DBUtil.prepareStatement(connection, UPDATE_SEEN_QUERY, false,values);
			result=statement.executeUpdate()==1;
		}
		finally {
			connectionPool.checkIn(connection);
			DBUtil.close(statement);
		}
		return result;
	}

}
