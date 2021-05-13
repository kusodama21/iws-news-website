package news.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import news.Utilities;
import news.form.CommentForm;
import news.repository.CommentRepository;
import news.repository.article.DetailedArticleRepository;
import news.response.Messenger;
import news.response.Page;
import news.sendover.CommentSendover;
import news.service.CommentService;
import news.validator.CommentFormValidator;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*", exposedHeaders = "*")
@RequestMapping("/test/comments")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@Autowired
	private DetailedArticleRepository detailedArticleRepository;
	
	@Autowired
	private CommentFormValidator commentFormValidator;
	
	@Autowired
	private Utilities utilities;
	
	// GET MANY BY ARTICLE ID
	@GetMapping(value = "/articles/{articleId}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> getManyByArticleId(
			@PathVariable(name = "articleId") int articleId,
			@RequestParam(name = "page", required = false, defaultValue = "1") int page,
			@RequestParam(name = "limit", required = false, defaultValue = "10") int limit) {
		
		if (page <= 0 || limit <= 0)
			return new ResponseEntity<Messenger>(HttpStatus.NOT_ACCEPTABLE);
		
		if (!detailedArticleRepository.checkOneById(articleId))
			return new ResponseEntity<Messenger>(HttpStatus.NOT_FOUND);
		
		Page<CommentSendover> commentPage = commentService.getManyByArticleId(articleId, page, limit);
		return new ResponseEntity<Messenger>(new Messenger(commentPage), 
				commentPage.getContent() == null ? HttpStatus.BAD_REQUEST : HttpStatus.OK);
	}
	
	// INSERT ONE BY FORM
	@PutMapping(value = "/articles/{articleId}/insert", consumes = MediaType.APPLICATION_JSON_VALUE, produces =  MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> insertOneByForm(
			@PathVariable(name = "articleId") int articleId,
			HttpServletRequest request,
			@RequestBody CommentForm form) {
		final int accountId = utilities.extractAccountIdFromAuthHeader(request.getHeader("Authorization"));
		
		if (accountId == -1)
			return new ResponseEntity<Messenger>(HttpStatus.UNAUTHORIZED);
		
		if (!detailedArticleRepository.checkOneById(articleId))
			return new ResponseEntity<Messenger>(HttpStatus.NOT_FOUND);
		
		String validateResult = commentFormValidator.validate(form);
		if (validateResult != null)
			return new ResponseEntity<Messenger>(new Messenger(validateResult), HttpStatus.BAD_REQUEST);
		
		CommentSendover commentSendover = commentService.insertOneByForm(accountId, articleId, form);
		if (commentSendover == null)
			return new ResponseEntity<Messenger>(HttpStatus.INTERNAL_SERVER_ERROR);
		else
			return new ResponseEntity<Messenger>(new Messenger(commentSendover), HttpStatus.CREATED);
	}
	
	// UPDATE ONE BY FORM
	@PatchMapping(value = "/{id}/edit", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> updateOneByForm(
			@PathVariable(name = "id") int commentId,
			HttpServletRequest request,
			@RequestBody CommentForm form) {
		final int accountId = utilities.extractAccountIdFromAuthHeader(request.getHeader("Authorization"));
		
		if (accountId == -1)
			return new ResponseEntity<Messenger>(HttpStatus.UNAUTHORIZED);
		
		if (!commentRepository.checkOneById(commentId))
			return new ResponseEntity<Messenger>(HttpStatus.NOT_FOUND);
		
		if (accountId != commentRepository.getAccountIdById(commentId))
			return new ResponseEntity<Messenger>(HttpStatus.FORBIDDEN);
		
		String validateResult = commentFormValidator.validate(form);
		if (validateResult != null)
			return new ResponseEntity<Messenger>(new Messenger(validateResult), HttpStatus.BAD_REQUEST);
		
		CommentSendover commentSendover = commentService.updateOneByForm(commentId, form);
		if (commentSendover == null)
			return new ResponseEntity<Messenger>(HttpStatus.INTERNAL_SERVER_ERROR);
		else
			return new ResponseEntity<Messenger>(new Messenger(commentSendover), HttpStatus.OK);
	}
	
	// DELETE ONE BY ID
	@DeleteMapping(value = "/{id}/delete")
	public ResponseEntity<Messenger> deleteOneById(
			@PathVariable(name = "id") int commentId,
			HttpServletRequest request) {
		final int accountId = utilities.extractAccountIdFromAuthHeader(request.getHeader("Authorization"));
		
		if (accountId == -1)
			return new ResponseEntity<Messenger>(HttpStatus.UNAUTHORIZED);
		
		
		if (!commentRepository.checkOneById(commentId))
			return new ResponseEntity<Messenger>(HttpStatus.NOT_FOUND);
		
		if (accountId != commentRepository.getAccountIdById(commentId))
			return new ResponseEntity<Messenger>(HttpStatus.FORBIDDEN);
		
		CommentSendover commentSendover = commentService.deleteOneById(commentId);
		if (commentSendover == null)
			return new ResponseEntity<Messenger>(HttpStatus.INTERNAL_SERVER_ERROR);
		else
			return new ResponseEntity<Messenger>(new Messenger(commentSendover), HttpStatus.OK);
	}
}