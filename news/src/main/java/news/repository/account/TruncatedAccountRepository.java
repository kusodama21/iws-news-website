package news.repository.account;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Component;

import news.model.account.TruncatedAccount;
import news.repository.Repository;

@Component
public class TruncatedAccountRepository extends Repository<TruncatedAccount> {

	// GET ONE BY ID
	public TruncatedAccount getOneById(int id) {
		String sql = "SELECT id, fullname, role FROM account WHERE id = :id";
		return querySingle(sql, new MapSqlParameterSource("id", id));
	}
}
