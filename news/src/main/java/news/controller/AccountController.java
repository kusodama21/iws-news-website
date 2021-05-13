package news.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import news.Utilities;
import news.form.AccountForm;
import news.form.LoginForm;
import news.model.account.DetailedAccount;
import news.repository.account.DetailedAccountRepository;
import news.response.Messenger;
import news.service.AccountService;
import news.validator.AccountFormValidator;

@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*", exposedHeaders = "*")
@RequestMapping("/test/accounts")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private DetailedAccountRepository detailedAccountRepository;
	
	@Autowired
	private AccountFormValidator accountFormValidator;
	
	@Autowired
	private Utilities utilities;
	
	// GET ONE BY ID
	@GetMapping(value = "/basic/{id}/get", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> getOneById(@PathVariable(name = "id") int accountId) {
		DetailedAccount account = detailedAccountRepository.getOneById(accountId);
		
		if (account == null)
			return new ResponseEntity<Messenger>(HttpStatus.NOT_FOUND);
		
		account.setPassword(null);
		return new ResponseEntity<Messenger>(new Messenger(account), HttpStatus.OK);
	}
	
	// INSERT ONE BY FORM
	@PutMapping(value = "/insert", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> insertOneByForm(@RequestBody AccountForm form) {
		String validateResult = accountFormValidator.validate(form);
		if (validateResult != null)
			return new ResponseEntity<Messenger>(new Messenger(validateResult), HttpStatus.BAD_REQUEST);
		
		DetailedAccount account = accountService.insertOneByForm(form);
		if (account == null)
			return new ResponseEntity<Messenger>(HttpStatus.INTERNAL_SERVER_ERROR);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + utilities.parseAccountIdIntoJwt(account.getId()));
		
		return new ResponseEntity<Messenger>(new Messenger(account), headers, HttpStatus.CREATED);
	}
	
	// GET ONE BY LOGIN FORM - AUTH
	@PostMapping(value = "/auth", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> getOneByLoginForm(@RequestBody LoginForm form) {
		DetailedAccount account = accountService.getOneByLoginForm(form);
		if (account == null)
			return new ResponseEntity<Messenger>(HttpStatus.BAD_REQUEST);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + utilities.parseAccountIdIntoJwt(account.getId()));
		
		return new ResponseEntity<Messenger>(new Messenger(account), headers, HttpStatus.OK);
	}
}
