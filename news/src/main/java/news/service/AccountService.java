package news.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import news.Utilities;
import news.form.AccountForm;
import news.form.LoginForm;
import news.model.account.DetailedAccount;
import news.repository.account.DetailedAccountRepository;

@Component
public class AccountService {
	
	@Autowired
	private DetailedAccountRepository detailedAccountRepository;
	
	@Autowired
	private Utilities utilities;
	
	// CONVERT FORM INTO MODEL
	private DetailedAccount convertFormIntoModel(AccountForm form) {
		DetailedAccount account = new DetailedAccount();
		
		account.setFullname(form.getFullname());
		account.setUsername(form.getUsername());
		account.setPassword(utilities.hash(form.getPassword()));
		
		return account;
	}

	// INSERT ONE BY FORM
	public DetailedAccount insertOneByForm(AccountForm form) {
		DetailedAccount account = convertFormIntoModel(form);
		final int insertedId = detailedAccountRepository.insertOne(account);
		
		if (insertedId == -1)
			return null;
		
		DetailedAccount insertedAccount = detailedAccountRepository.getOneById(insertedId);
		insertedAccount.setPassword(null);
		
		return insertedAccount;
	}
	
	// GET ONE BY LOGIN FORM
	public DetailedAccount getOneByLoginForm(LoginForm form) {
		DetailedAccount account = detailedAccountRepository.getOneByUsername(form.getUsername());
		if (account == null)
			return null;
		if (!utilities.compare(form.getPassword(), account.getPassword()))
			return null;
		
		account.setPassword(null);
		return account;
	}
}
