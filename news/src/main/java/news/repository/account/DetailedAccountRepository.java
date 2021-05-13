package news.repository.account;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import news.model.account.DetailedAccount;
import news.repository.Repository;

@Component
public class DetailedAccountRepository extends Repository<DetailedAccount> {
	
	// GET ONE BY USERNAME
	public DetailedAccount getOneByUsername(String username) {
		String sql = "SELECT * FROM account WHERE username = :username";
		return querySingle(sql, new MapSqlParameterSource("username", username));
	}
	
	// GET ONE BY ID
	public DetailedAccount getOneById(int id) {
		String sql = "SELECT * FROM account WHERE id = :id";
		return querySingle(sql, new MapSqlParameterSource("id", id));
	}
	
	// CHECK ONE BY ID
	public boolean checkOneById(int id) {
		String sql = "SELECT EXISTS (SELECT 1 FROM account WHERE id = :id)";
		return template.queryForObject(sql, new MapSqlParameterSource("id", id), Boolean.class);
	}
	
	// CHECK ONE BY USERNAME
	public boolean checkOneByUsername(String username) {
		String sql = "SELECT EXISTS (SELECT 1 FROM account WHERE username = :username)";
		return template.queryForObject(sql, new MapSqlParameterSource("username", username), Boolean.class);
	}
	
	// INSERT ONE RETRIEVE ID
	public int insertOne(DetailedAccount account) {
		String sql = "INSERT INTO account(fullname, username, password, role) "
				+ "VALUES (:fullname, :username, :password, :role)";
		
		MapSqlParameterSource source = new MapSqlParameterSource("fullname", account.getFullname())
				.addValue("username", account.getUsername())
				.addValue("password", account.getPassword())
				.addValue("role", "GUEST");
		
		final KeyHolder keyHolder = new GeneratedKeyHolder();
		
		try {
			template.update(sql, source, keyHolder, new String[] {"id"});
			return keyHolder.getKey().intValue();
		} catch (DataAccessException e) {
			e.printStackTrace();
			return -1;
		}
	}
}