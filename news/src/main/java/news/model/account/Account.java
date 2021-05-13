package news.model.account;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public abstract class Account {
	public final static int FULLNAME_MIN_LENGTH = 3,
			FULLNAME_MAX_LENGTH = 30,
			USERNAME_MIN_LENGTH = 4,
			USERNAME_MAX_LENGTH = 15,
			PASSWORD_MIN_LENGTH = 6,
			PASSWORD_MAX_LENGTH = 20;
	
	protected int id;
	protected String fullname, role;
}