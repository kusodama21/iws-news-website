package news.service;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import news.form.CommentForm;
import news.model.Comment;
import news.model.account.TruncatedAccount;
import news.repository.CommentRepository;
import news.repository.account.TruncatedAccountRepository;
import news.response.Page;
import news.sendover.CommentSendover;

@Component
public class CommentService {

	@Autowired
	private CommentRepository commentRepository;

	@Autowired
	private TruncatedAccountRepository truncatedAccountRepository;

	// CONVERT - USED FOR MULTIPLE
	private CommentSendover convert(Comment t, HashMap<Integer, TruncatedAccount> accountMap) {
		CommentSendover s = new CommentSendover();

		s.setId(t.getId());
		s.setArticleId(t.getArticleId());
		s.setContent(t.getContent());
		s.setDateCreated(t.getDateCreated());

		if (accountMap != null) {
			final int accountId = t.getAccountId();
			if (accountMap.containsKey(accountId))
				s.setAccount(accountMap.get(accountId));
			else {
				TruncatedAccount account = truncatedAccountRepository.getOneById(accountId);
				accountMap.put(accountId, account);
				s.setAccount(account);
			}
		}

		return s;
	}

	// CONVERT - USED FOR SINGLE
	private CommentSendover convert(Comment t) {
		CommentSendover s = new CommentSendover();

		s.setId(t.getId());
		s.setArticleId(t.getArticleId());
		s.setContent(t.getContent());
		s.setDateCreated(t.getDateCreated());
		
		TruncatedAccount account = truncatedAccountRepository.getOneById(t.getAccountId());
		s.setAccount(account);
		
		return s;
	}

	// CONVERT FORM INTO MODEL
	private Comment convertFormIntoModel(CommentForm form, boolean onCreate) {
		Comment comment = new Comment();

		comment.setContent(form.getContent());
		
		if (onCreate)
			comment.setDateCreated(Timestamp.from(Instant.now()));

		return comment;
	}
	
	public CommentSendover getOneById(int id) {
		Comment comment = commentRepository.getOneById(id);
		return convert(comment);
	}

	// GET MANY BY ARTICLE ID
	public Page<CommentSendover> getManyByArticleId(int articleId, int page, int limit) {
		final int count = commentRepository.countByArticleId(articleId),
				total = count / limit + (count % limit == 0 ? 0 : 1);

		List<CommentSendover> commentSendovers = null;

		if (page <= total) {
			HashMap<Integer, TruncatedAccount> accountMap = new HashMap<>();
			commentSendovers = commentRepository.getManyByArticleId(articleId, page, limit).stream()
					.map(t -> convert(t, accountMap)).collect(Collectors.toList());
		}

		return new Page<>(count, total, limit, count, commentSendovers);
	}

	// INSERT ONE BY FORM
	public CommentSendover insertOneByForm(int accountId, int articleId, CommentForm form) {
		Comment comment = convertFormIntoModel(form, true);
		comment.setAccountId(accountId);
		comment.setArticleId(articleId);
		
		final int insertedId = commentRepository.insertOneRetrieveId(comment);
		return insertedId == -1 ? null : convert(commentRepository.getOneById(insertedId));
	}
	
	// UPDATE ONE BY FORM
	public CommentSendover updateOneByForm(int id, CommentForm form) {
		Comment comment = convertFormIntoModel(form, false);
		comment.setId(id);
		
		return commentRepository.updateOne(comment) ? getOneById(id) : null;
	}
	
	// DELETE ONE BY ID
	public CommentSendover deleteOneById(int commentId) {
		CommentSendover commentSendover = getOneById(commentId);
		return commentRepository.deleteOneById(commentId) ? commentSendover : null;
	}
}