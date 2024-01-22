package org.unibl.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.unibl.etf.dao.AdvisorDAO;
import org.unibl.etf.models.dto.Admin;
import org.unibl.etf.models.dto.Advisor;
import org.unibl.etf.utils.ConnectionPool;
import org.unibl.etf.utils.DBUtil;

public class AdvisorDAOImpl implements AdvisorDAO {

	private static final String LOGIN_QUERY = "select * from advisor where username=? AND status=1";
	private ConnectionPool connectionPool;

	public AdvisorDAOImpl() {
		this.connectionPool = ConnectionPool.getInstance();
	}

	@Override
	public Advisor login(String username, String password) throws SQLException {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		Object values[] = { username };
		Advisor result = null;
		try {
			connection = connectionPool.checkOut();
			statement = DBUtil.prepareStatement(connection, LOGIN_QUERY, false, values);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				result = new Advisor(resultSet.getLong("id"), resultSet.getString("username"), resultSet.getString("password"), resultSet.getString("name"), resultSet.getString("surname"), resultSet.getString("email"));
			}
		} finally {
			connectionPool.checkIn(connection);
			DBUtil.close(statement, resultSet);
		}
		return result;
	}

}
