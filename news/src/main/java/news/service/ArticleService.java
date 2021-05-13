package news.service;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import news.form.ArticleForm;
import news.model.Category;
import news.model.Tag;
import news.model.account.TruncatedAccount;
import news.model.article.DetailedArticle;
import news.model.article.TruncatedArticle;
import news.repository.CategoryRepository;
import news.repository.TagRepository;
import news.repository.account.TruncatedAccountRepository;
import news.repository.article.DetailedArticleRepository;
import news.repository.article.TruncatedArticleRepository;
import news.response.Page;
import news.sendover.article.DetailedArticleSendover;
import news.sendover.article.TruncatedArticleSendover;

@Component
public class ArticleService {

	@Autowired
	private DetailedArticleRepository detailedArticleRepository;

	@Autowired
	private TruncatedArticleRepository truncatedArticleRepository;

	@Autowired
	private TruncatedAccountRepository truncatedAccountRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private TagRepository tagRepository;

	// CONVERT DETAILED
	private DetailedArticleSendover convertDetailed(DetailedArticle t) {
		DetailedArticleSendover s = new DetailedArticleSendover();

		s.setId(t.getId());
		s.setTitle(t.getTitle());
		s.setImage(t.getImage());
		s.setShortIntro(t.getShortIntro());
		s.setContent(t.getContent());
		s.setDateCreated(t.getDateCreated());

		TruncatedAccount account = truncatedAccountRepository.getOneById(t.getAccountId());
		s.setAccount(account);

		Category category = categoryRepository.getOneById(t.getCategoryId());
		s.setCategory(category);

		List<Tag> tags = tagRepository.getManyByArticleId(t.getId());
		s.setTags(tags);

		return s;
	}

	// CONVERT TRUNCATED - ACCOUNT IS LOADED BASED ON SITUATIONS
	private TruncatedArticleSendover convertTruncated(TruncatedArticle t,
			HashMap<Integer, TruncatedAccount> accountMap) {
		TruncatedArticleSendover s = new TruncatedArticleSendover();

		s.setId(t.getId());
		s.setTitle(t.getTitle());
		s.setImage(t.getImage());
		s.setShortIntro(t.getShortIntro());
		s.setDateCreated(t.getDateCreated());
		s.setCommentCount(t.getCommentCount());

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

	// CONVERT FORM INTO DETAILE
	private DetailedArticle convertFormToDetailedModel(ArticleForm form, boolean onCreate) {
		DetailedArticle article = new DetailedArticle();

		article.setTitle(form.getTitle().trim());
		article.setImage(form.getImage().trim());
		article.setShortIntro(form.getShortIntro().trim());
		article.setContent(form.getContent().trim());
		article.setCategoryId(form.getCategoryId());

		if (onCreate)
			article.setDateCreated(Timestamp.from(Instant.now()));

		return article;
	}

	// GET ONE BY ID - RETURN DETAILED
	public DetailedArticleSendover getOneById(int id) {
		DetailedArticle detailedArticle = detailedArticleRepository.getOneById(id);
		return detailedArticle == null ? null : convertDetailed(detailedArticle);
	}

	// INDEX - RETURN TRUNCATED
	public Page<TruncatedArticleSendover> index(int page, int limit) {
		final int count = truncatedArticleRepository.count(), total = count / limit + (count % limit == 0 ? 0 : 1);

		List<TruncatedArticleSendover> articleSendovers = null;
		if (page <= total) {
			HashMap<Integer, TruncatedAccount> accountMap = new HashMap<>();
			articleSendovers = truncatedArticleRepository.index(page, limit).stream()
					.map(a -> convertTruncated(a, accountMap)).collect(Collectors.toList());
		}

		return new Page<>(page, total, limit, count, articleSendovers);
	}

	// GET MANY BY CATEGORY ID - RETURN TRUNCATED
	public Page<TruncatedArticleSendover> getManyByCategoryId(int categoryId, int page, int limit) {
		final int count = truncatedArticleRepository.countByCategoryId(categoryId),
				total = count / limit + (count % limit == 0 ? 0 : 1);

		List<TruncatedArticleSendover> articleSendovers = null;
		if (page <= total) {
			HashMap<Integer, TruncatedAccount> accountMap = new HashMap<>();
			articleSendovers = truncatedArticleRepository.getManyByCategoryId(categoryId, page, limit).stream()
					.map(a -> convertTruncated(a, accountMap)).collect(Collectors.toList());
		}

		return new Page<>(page, total, limit, count, articleSendovers);
	}

	// GET MANY BY TAG ID - RETURN TRUNCATED
	public Page<TruncatedArticleSendover> getManyByTagId(int tagId, int page, int limit) {
		final int count = truncatedArticleRepository.countByTagId(tagId),
				total = count / limit + (count % limit == 0 ? 0 : 1);

		List<TruncatedArticleSendover> articleSendovers = null;
		if (page <= total) {
			HashMap<Integer, TruncatedAccount> accountMap = new HashMap<>();
			articleSendovers = truncatedArticleRepository.getManyByTagId(tagId, page, limit).stream()
					.map(a -> convertTruncated(a, accountMap)).collect(Collectors.toList());
		}

		return new Page<>(page, total, limit, count, articleSendovers);
	}

	// GET MANY BY ACCOUNT ID - RETURN TRUNCATED
	public Page<TruncatedArticleSendover> getManyByAccountId(int accountId, int page, int limit) {
		final int count = truncatedArticleRepository.countByAccountId(accountId),
				total = count / limit + (count % limit == 0 ? 0 : 1);

		List<TruncatedArticleSendover> articleSendovers = null;
		if (page <= total) {
			articleSendovers = truncatedArticleRepository.getManyByAccountId(accountId, page, limit).stream()
					.map(a -> convertTruncated(a, null)).collect(Collectors.toList());
			
			TruncatedAccount account = truncatedAccountRepository.getOneById(accountId);
			articleSendovers.forEach(s -> s.setAccount(account));
		}

		return new Page<>(page, total, limit, count, articleSendovers);
	}
	
	// GET MANY EXLUCDE ID RELATE CATEGORY ID
	public List<TruncatedArticleSendover> getManyExcludeIdRelateCategoryId(int articleId, int limit) {
		HashMap<Integer, TruncatedAccount> accountMap = new HashMap<>();
		return truncatedArticleRepository.getManyExcludeIdRelateCategoryId(articleId, limit)
				.stream()
				.map(a -> convertTruncated(a, accountMap))
				.collect(Collectors.toList());
	}

	// INSERT ONE BY FORM - RETURN DETAILED
	public DetailedArticleSendover insertOneByForm(int accountId, ArticleForm form) {
		DetailedArticle article = convertFormToDetailedModel(form, true);
		article.setAccountId(accountId);

		final int insertedId = detailedArticleRepository.insertOneRetrieveId(article);
		if (insertedId == -1)
			return null;

		List<Integer> tagIds = form.getTagIds();
		if (tagIds != null && !tagIds.isEmpty())
			tagRepository.insertCentralByArticleId(insertedId, tagIds);

		return getOneById(insertedId);
	}

	// UPDATE ONE BY FORM - RETURN DETAILED
	public DetailedArticleSendover updateOneByForm(int articleId, ArticleForm form) {
		DetailedArticle article = convertFormToDetailedModel(form, false);
		article.setId(articleId);

		boolean isUpdateSuccess = detailedArticleRepository.updateOne(article);
		if (!isUpdateSuccess)
			return null;

		List<Integer> tagIds = form.getTagIds();

		if (tagIds != null) {
			tagRepository.deleteCentralByArticleId(articleId);
			if (!tagIds.isEmpty())
				tagRepository.insertCentralByArticleId(articleId, tagIds);
		}

		return getOneById(articleId);
	}

	// DELETE ONE BY ID
	public DetailedArticleSendover deleteOneById(int articleId) {
		DetailedArticleSendover articleSendover = getOneById(articleId);
		return detailedArticleRepository.deleteOneById(articleId) ? articleSendover : null;
	}
}