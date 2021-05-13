package news.mapper.account;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import news.model.account.DetailedAccount;

@Component
public class DetailedAccountMapper implements RowMapper<DetailedAccount> {

	@Override
	public DetailedAccount mapRow(ResultSet rs, int rowNum) throws SQLException {
		// Flow: id -> fullname -> username -> password -> role
		DetailedAccount detailedAccount = new DetailedAccount();
		
		// Set Id
		detailedAccount.setId(rs.getInt(1));
		
		// Set fullname
		detailedAccount.setFullname(rs.getString(2));
		
		// Set username
		detailedAccount.setUsername(rs.getString(3));
		
		// Set password
		detailedAccount.setPassword(rs.getString(4));
		
		// Set role
		detailedAccount.setRole(rs.getString(5));
		
		return detailedAccount;
	}
}