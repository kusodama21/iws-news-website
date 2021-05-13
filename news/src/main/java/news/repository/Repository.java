package news.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

public class Repository<T> {

	@Autowired
	protected NamedParameterJdbcTemplate template;
	
	@Autowired
	protected RowMapper<T> mapper;
	
	// Short for query single - with params, return null if not exists
	protected T querySingle(String query, MapSqlParameterSource source) {
		try {
			return template.queryForObject(query, source, mapper);
		} catch (IncorrectResultSizeDataAccessException e) {
			return null;
		}
	}
	
	// Short for query single - no params, return null if not exists
	protected T querySingle(String query) {
		try {
			return template.getJdbcOperations().queryForObject(query, mapper);
		} catch (IncorrectResultSizeDataAccessException e) {
			return null;
		}
	}
	
	// Short for update - return result of operation > 0 if success, else return false
	protected boolean update(String query, MapSqlParameterSource source) {
		try {
			return template.update(query, source) > 0;
		} catch (DataAccessException e) {
			return false;
		}
	}
}
