package com.itbank.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO {
	
	@Autowired private JdbcTemplate jdbcTemplate;

	public String selectBanner() {
		String sql = "select banner from v$version";
//		 rowMapper = new RowMapper<String>() {
//			@Override
//			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
//				return rs.getString("banner");
//			}
//		};
		RowMapper<String> rowMapper = (rs, rownum) -> rs.getString("banner");
		return jdbcTemplate.queryForObject(sql, rowMapper);
	}

	public java.sql.Date selectSysdate() {
		String sql = "select sysdate from dual";
//		Date sysdate = jdbcTemplate.queryForObject(sql, java.sql.Date.class);
		RowMapper<java.sql.Date> rowMapper = (rs, rownum) -> rs.getDate("sysdate");
		return jdbcTemplate.queryForObject(sql, rowMapper);
	}
	
}
