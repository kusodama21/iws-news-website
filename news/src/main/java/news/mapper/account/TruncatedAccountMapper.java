package news.mapper.account;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import news.model.account.TruncatedAccount;

@Component
public class TruncatedAccountMapper implements RowMapper<TruncatedAccount>{

	@Override
	public TruncatedAccount mapRow(ResultSet rs, int rowNum) throws SQLException {
		// Flow: id -> fullname -> role
		TruncatedAccount truncatedAccount = new TruncatedAccount();
		
		// Set Id
		truncatedAccount.setId(rs.getInt(1));
		
		// Set fullname
		truncatedAccount.setFullname(rs.getString(2));
		
		// Set role
		truncatedAccount.setRole(rs.getString(3));
		
		return truncatedAccount;
	}
}