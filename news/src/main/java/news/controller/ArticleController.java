package news.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import news.Utilities;
import news.form.ArticleForm;
import news.repository.CategoryRepository;
import news.repository.TagRepository;
import news.repository.account.DetailedAccountRepository;
import news.repository.article.DetailedArticleRepository;
import news.response.Messenger;
import news.response.Page;
import news.sendover.article.DetailedArticleSendover;
import news.sendover.article.TruncatedArticleSendover;
import news.service.ArticleService;
import news.validator.ArticleFormValidator;

@CrossOrigin(origins = "*", allowedHeaders = "*", exposedHeaders = "*")
@Controller
@RequestMapping("/test/articles")
public class ArticleController {
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private DetailedArticleRepository detailedArticleRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private DetailedAccountRepository detailedAccountRepository;
	
	@Autowired
	private TagRepository tagRepository;
	
	@Autowired
	private ArticleFormValidator articleFormValidator;
	
	@Autowired
	private Utilities utilities;
	
	// GET ONE BY ID - RETURN DETAILED
	@GetMapping(value = "/{id}/get", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> getOneById(@PathVariable(name = "id") int articleId) {
		
		DetailedArticleSendover articleSendover = articleService.getOneById(articleId);
		
		if (articleSendover == null)
			return new ResponseEntity<Messenger>(HttpStatus.NOT_FOUND);
		else
			return new ResponseEntity<Messenger>(new Messenger(articleSendover), HttpStatus.OK);
	}

	
	// INDEX - RETURN TRUNCATED
	@GetMapping(value = "/index", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> index(
			@RequestParam(name = "page", required = false, defaultValue = "1") int page,
			@RequestParam(name = "limit", required = false, defaultValue = "10") int limit) {
		
		if (page <= 0 || limit <= 0)
			return new ResponseEntity<Messenger>(HttpStatus.NOT_ACCEPTABLE);
		
		Page<TruncatedArticleSendover> articlePage = articleService.index(page, limit);		
		return new ResponseEntity<Messenger>(new Messenger(articlePage), 
				articlePage.getContent() == null ? HttpStatus.BAD_REQUEST : HttpStatus.OK);
	}
	
	// GET MANY BY CATEGORY ID - RETURN TRUNCATED
	@GetMapping(value = "/categories/{categoryId}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> getManyByCategoryId(
			@PathVariable(name = "categoryId") int categoryId,
			@RequestParam(name = "page", required = false, defaultValue = "1") int page,
			@RequestParam(name = "limit", required = false, defaultValue = "10") int limit) {
		
		if (page <= 0 || limit <= 0)
			return new ResponseEntity<Messenger>(HttpStatus.NOT_ACCEPTABLE);
		
		if (!categoryRepository.checkOneById(categoryId))
			return new ResponseEntity<Messenger>(HttpStatus.NOT_FOUND);
			
		Page<TruncatedArticleSendover> articlePage = articleService.getManyByCategoryId(categoryId, page, limit);
		return new ResponseEntity<Messenger>(new Messenger(articlePage), 
				articlePage.getContent() == null ? HttpStatus.BAD_REQUEST : HttpStatus.OK);
	}
	
	// GET MANY BY TAG ID - RETURN TRUNCATED
	@GetMapping(value = "/tags/{tagId}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> getManyByTagId(
			@PathVariable(name = "tagId") int tagId,
			@RequestParam(name = "page", required = false, defaultValue = "1") int page,
			@RequestParam(name = "limit", required = false, defaultValue = "10") int limit) {
		
		if (page <= 0 || limit <= 0)
			return new ResponseEntity<Messenger>(HttpStatus.NOT_ACCEPTABLE);
		
		if (!tagRepository.checkOneById(tagId))
			return new ResponseEntity<Messenger>(HttpStatus.NOT_FOUND);
		
		Page<TruncatedArticleSendover> articlePage = articleService.getManyByTagId(tagId, page, limit);
		return new ResponseEntity<Messenger>(new Messenger(articlePage), 
				articlePage.getContent() == null ? HttpStatus.BAD_REQUEST : HttpStatus.OK);
	}
	
	// GET MANY BY ACCOUNT ID - RETURN TRUNCATED
	@GetMapping(value = "/accounts/{accountId}") 
	public ResponseEntity<Messenger> getManyByAccountId(
			@PathVariable(name = "accountId") int accountId,
			@RequestParam(name = "page", required = false, defaultValue = "1") int page,
			@RequestParam(name = "limit", required = false, defaultValue = "10") int limit) {
		
		if (page <= 0 || limit <= 0)
			return new ResponseEntity<Messenger>(HttpStatus.NOT_ACCEPTABLE);
		
		if (!detailedAccountRepository.checkOneById(accountId))
			return new ResponseEntity<Messenger>(HttpStatus.NOT_FOUND);
		
		Page<TruncatedArticleSendover> articlePage = articleService.getManyByAccountId(accountId, page, limit);
		return new ResponseEntity<Messenger>(new Messenger(articlePage), 
				articlePage.getContent() == null ? HttpStatus.BAD_REQUEST : HttpStatus.OK);
	}
	
	// GET RELEVANT BY ACCOUNT ID (FOR: GET MANY EXCLUDE ID RELATE CATEGORY ID) - RETURN TRUNCATED
	@GetMapping(value = "/{id}/relevant", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> getManyExcludeIdRelateCategoryId(
			@PathVariable(name = "id") int articleId,
			@RequestParam(name = "limit", required = false, defaultValue = "3") int limit) {
		
		if (limit <= 0)
			return new ResponseEntity<Messenger>(HttpStatus.NOT_ACCEPTABLE);
		
		if (!detailedArticleRepository.checkOneById(articleId))
			return new ResponseEntity<Messenger>(HttpStatus.NOT_FOUND);
		
		List<TruncatedArticleSendover> articleList = articleService.getManyExcludeIdRelateCategoryId(articleId, limit);
		return new ResponseEntity<Messenger>(new Messenger(articleList), HttpStatus.OK);
	}
	
	
	// INSERT ONE BY FORM - RETURN DETAILED
	@PutMapping(value = "/insert", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> insertOneByForm(@RequestBody ArticleForm form, HttpServletRequest request) {
		final int accountId = utilities.extractAccountIdFromAuthHeader(request.getHeader("Authorization"));
		
		if (accountId == -1)
			return new ResponseEntity<Messenger>(HttpStatus.UNAUTHORIZED);
		
		String validateResult = articleFormValidator.validate(form);
		if (validateResult != null)
			return new ResponseEntity<Messenger>(new Messenger(validateResult), HttpStatus.BAD_REQUEST);
			
		DetailedArticleSendover articleSendover = articleService.insertOneByForm(accountId, form);
		if (articleSendover == null)
			return new ResponseEntity<Messenger>(HttpStatus.INTERNAL_SERVER_ERROR);
		else
			return new ResponseEntity<Messenger>(new Messenger(articleSendover), HttpStatus.CREATED);
	}
	
	// UPDATE ONE BY FORM - RETURN DETAILED
	@PatchMapping(value = "/{id}/edit", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> updateOneByForm (
			@PathVariable(name = "id") int articleId,
			HttpServletRequest request,
			@RequestBody ArticleForm form) {		
		final int accountId = utilities.extractAccountIdFromAuthHeader(request.getHeader("Authorization"));
		
		if (accountId == -1)
			return new ResponseEntity<Messenger>(HttpStatus.UNAUTHORIZED);
		
		if (!detailedArticleRepository.checkOneById(articleId))
			return new ResponseEntity<Messenger>(HttpStatus.NOT_FOUND);
		
		if (accountId != detailedArticleRepository.getAccountIdById(articleId))
			return new ResponseEntity<Messenger>(HttpStatus.FORBIDDEN);
					
		String validateResult = articleFormValidator.validate(form);
		if (validateResult != null)
			return new ResponseEntity<Messenger>(new Messenger(validateResult), HttpStatus.BAD_REQUEST);
		
		DetailedArticleSendover articleSendover = articleService.updateOneByForm(articleId, form);
		if (articleSendover == null)
			return new ResponseEntity<Messenger>(HttpStatus.INTERNAL_SERVER_ERROR);
		else
			return new ResponseEntity<Messenger>(new Messenger(articleSendover), HttpStatus.OK);
	}
	
	// DELETE ONE BY ID - RETURN MESSAGE
	@DeleteMapping(value = "/{id}/delete")
	public ResponseEntity<Messenger> deleteOneById(@PathVariable(name = "id") int articleId, HttpServletRequest request) {
		final int accountId = utilities.extractAccountIdFromAuthHeader(request.getHeader("Authorization"));
		
		if (accountId == -1)
			return new ResponseEntity<Messenger>(HttpStatus.UNAUTHORIZED);
		
		if (!detailedArticleRepository.checkOneById(articleId))
			return new ResponseEntity<Messenger>(HttpStatus.NOT_FOUND);
		
		if (accountId != detailedArticleRepository.getAccountIdById(articleId))
			return new ResponseEntity<Messenger>(HttpStatus.FORBIDDEN);
		
		DetailedArticleSendover articleSendover = articleService.deleteOneById(articleId);
		if (articleSendover == null)
			return new ResponseEntity<Messenger>(HttpStatus.INTERNAL_SERVER_ERROR);
		else
			return new ResponseEntity<Messenger>(new Messenger(articleSendover), HttpStatus.OK);
	}
}