package news.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import news.form.AccountForm;
import news.model.account.Account;
import news.repository.account.DetailedAccountRepository;

@Component
public class AccountFormValidator {
	
	@Autowired
	private DetailedAccountRepository detailedAccountRepository;
	
	// Constraints
	public final String[] CONSTRAINTS = {
		"The fullname is missing",
		"The fullname's length must be between " + Account.FULLNAME_MIN_LENGTH + " and " + Account.FULLNAME_MAX_LENGTH + " characters",
		"The username is missing",
		"The username's length must be between " + Account.USERNAME_MIN_LENGTH + " and " + Account.USERNAME_MAX_LENGTH + " characters",
		"The first character in username must be a lowercase letter",
		"Only English-alphabet lowercase letters and numbers are allowed in username",
		"The username must be unique",
		"The password is missing",
		"The password's length must be between " + Account.PASSWORD_MIN_LENGTH + " and " + Account.PASSWORD_MAX_LENGTH + " characters",
		"The first character in password can not be a special character",
		"The password must contains at least one lowercase, one uppercase characters, one digit, and one special character"
	};
	
	// Code matching index
	private final int FULLNAME_MISSING = 0,
			FULLNAME_LENGTH = 1,
			USERNAME_MISSING = 2,
			USERNAME_LENGTH = 3,
			USERNAME_FIRSTCHAR = 4,
			USERNAME_CONTENT = 5,
			USERNAME_UNIQUE = 6,
			PASSWORD_MISSING = 7,
			PASSWORD_LENGTH = 8,
			PASSWORD_FIRSTCHAR = 9,
			PASSWORD_CONTENT = 10;
	
	// Major-A: Validate fullname
	private String validateFullname(String fullname) {
		if (fullname == null)
			return CONSTRAINTS[FULLNAME_MISSING];
		
		final int len = fullname.length();
		return Account.FULLNAME_MIN_LENGTH <= len && len <= Account.FULLNAME_MAX_LENGTH ? null : CONSTRAINTS[FULLNAME_LENGTH];
	}
	
	// Major-A: Validate username
	private String validateUsername(String username) {
		if (username == null)
			return CONSTRAINTS[USERNAME_MISSING];
		
		final int len = username.length();
		if (len < Account.USERNAME_MIN_LENGTH || len > Account.USERNAME_MAX_LENGTH)
			return CONSTRAINTS[USERNAME_LENGTH];
		
		if (!Character.isLowerCase(username.charAt(0)))
			return CONSTRAINTS[USERNAME_FIRSTCHAR];
		
		if (!username.chars().allMatch(c -> Character.isLowerCase(c) || Character.isDigit(c)))
			return CONSTRAINTS[USERNAME_CONTENT];
		
		if (detailedAccountRepository.checkOneByUsername(username))
			return CONSTRAINTS[USERNAME_UNIQUE];
		
		return null;
	}
	
	// Major-A: Validate password
	private String validatePassword(String password) {
		if (password == null)
			return CONSTRAINTS[PASSWORD_MISSING];
		
		final int len = password.length();
		if (len < Account.PASSWORD_MIN_LENGTH || len > Account.PASSWORD_MAX_LENGTH)
			return CONSTRAINTS[PASSWORD_LENGTH];
		
		if (!Character.isLetterOrDigit(password.charAt(0)))
			return CONSTRAINTS[PASSWORD_FIRSTCHAR];
		
		boolean hasLower = false, hasUpper = false, hasDigit = false, hasSpecial = false;
		for (int i = 0; i < len; ++i) {
			final char c = password.charAt(i);
			
			if (Character.isLowerCase(c))
				hasLower = true;
			else if (Character.isUpperCase(c))
				hasUpper = true;
			else if (Character.isDigit(c))
				hasDigit = true;
			else
				hasSpecial = true;
		}
		if (!(hasLower && hasUpper && hasDigit && hasSpecial))
			return CONSTRAINTS[PASSWORD_CONTENT];
		
		return null;
	}
	
	// Validate account
	public String validate(AccountForm form) {
		String fullnameResult = validateFullname(form.getFullname());
		if (fullnameResult != null)
			return fullnameResult;
		
		String usernameResult = validateUsername(form.getUsername());
		if (usernameResult != null)
			return usernameResult;
		
		String passwordResult = validatePassword(form.getPassword());
		if (passwordResult != null)
			return passwordResult;
		
		return null;
	}
}
