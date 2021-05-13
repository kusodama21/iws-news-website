package news.repository.article;

import java.util.List;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Component;

import news.model.article.TruncatedArticle;
import news.repository.Repository;

@Component
public class TruncatedArticleRepository extends Repository<TruncatedArticle> {

	// INDEX SECTION
	public int count() {
		String sql = "SELECT COUNT(id) FROM article";
		return template.getJdbcOperations().queryForObject(sql, Integer.class);
	}
	
	public List<TruncatedArticle> index(int page, int limit) {
		String sql = "SELECT a.id, a.title, a.image, a.shortIntro, a.dateCreated, a.accountId, COUNT(c.id) "
				+ "FROM article AS a LEFT JOIN comment AS c ON a.id = c.articleId "
				+ "GROUP BY a.id ORDER BY a.dateCreated DESC, a.id ASC "
				+ "OFFSET :offset LIMIT :limit";
		
		MapSqlParameterSource source = new MapSqlParameterSource();
		source.addValue("offset", (page - 1) * limit).addValue("limit", limit);
		
		return template.query(sql, source, mapper);
	}
	
	// GET MANY BY CATEGORY SECTION
	public int countByCategoryId(int categoryId) {
		String sql = "SELECT COUNT(id) FROM article WHERE categoryId = :categoryId";
		return template.queryForObject(sql, new MapSqlParameterSource("categoryId", categoryId), Integer.class);
	}
	
	public List<TruncatedArticle> getManyByCategoryId(int categoryId, int page, int limit) {
		String sql = "SELECT a.id, a.title, a.image, a.shortIntro, a.dateCreated, a.accountId, COUNT(c.id) "
				+ "FROM article AS a LEFT JOIN comment AS c ON a.id = c.articleId "
				+ "WHERE a.categoryId = :categoryId "
				+ "GROUP BY a.id ORDER BY a.dateCreated DESC, a.id ASC "
				+ "OFFSET :offset LIMIT :limit";
		
		MapSqlParameterSource source = new MapSqlParameterSource("categoryId", categoryId);
		source.addValue("offset", (page - 1) * limit).addValue("limit", limit);
		
		return template.query(sql, source, mapper);
	}
	
	// GET MANY BY TAG SECTION
	public int countByTagId(int tagId) {
		String sql = "SELECT COUNT(a.id) FROM article AS a "
				+ "INNER JOIN article_tag AS a_t ON a.id = a_t.articleId "
				+ "INNER JOIN tag AS t ON a_t.tagId = t.id "
				+ "WHERE t.id = :tagId";
		
		return template.queryForObject(sql, new MapSqlParameterSource("tagId", tagId), Integer.class);
	}
	
	public List<TruncatedArticle> getManyByTagId(int tagId, int page, int limit) {
		String sql = "SELECT a.id, a.title, a.image, a.shortIntro, a.dateCreated, a.accountId, COUNT(c.id) "
				+ "FROM article AS a "
				+ "INNER JOIN article_tag AS a_t ON a_t.articleId = a.id "
				+ "INNER JOIN tag AS t ON a_t.tagId = t.id "
				+ "LEFT JOIN comment AS c ON a.id = c.articleId "
				+ "	WHERE t.id = :tagId "
				+ "GROUP BY a.id ORDER BY a.dateCreated DESC, a.id ASC "
				+ "OFFSET :offset LIMIT :limit";
		
		MapSqlParameterSource source = new MapSqlParameterSource("tagId", tagId);
		source.addValue("offset", (page - 1) * limit).addValue("limit", limit);
		
		return template.query(sql, source, mapper);
	}
	
	// GET MANY BY ACCOUNT SECTION
	public int countByAccountId(int accountId) {
		String sql = "SELECT COUNT(id) FROM article WHERE accountId = :accountId";
		return template.queryForObject(sql, new MapSqlParameterSource("accountId", accountId), Integer.class);
	}
	
	public List<TruncatedArticle> getManyByAccountId(int accountId, int page, int limit) {
		String sql = "SELECT a.id, a.title, a.image, a.shortIntro, a.dateCreated, a.accountId, COUNT(c.id) "
				+ "FROM article AS a LEFT JOIN comment AS c ON a.id = c.articleId "
				+ "WHERE a.accountId = :accountId "
				+ "GROUP BY a.id ORDER BY a.dateCreated DESC, a.id ASC "
				+ "OFFSET :offset LIMIT :limit";
		
		MapSqlParameterSource source = new MapSqlParameterSource("accountId", accountId);
		source.addValue("offset", (page - 1) * limit).addValue("limit", limit);
		
		return template.query(sql, source, mapper);
	}
	
	// GET RELEVANT BY ARTICLE ID
	public List<TruncatedArticle> getManyExcludeIdRelateCategoryId(int id, int limit) {
		String sql = "SELECT a.id, a.title, a.image, a.shortIntro, a.dateCreated, a.accountId, COUNT(c.id) "
				+ "FROM article AS a LEFT JOIN comment AS c ON a.id = c.articleId "
				+ "WHERE a.categoryId = (SELECT categoryId FROM article WHERE id = :id) AND a.id != :id "
				+ "GROUP BY a.id LIMIT :limit";
		
		MapSqlParameterSource source = new MapSqlParameterSource("id", id);
		source.addValue("limit", limit);
		
		return template.query(sql, source, mapper);
	}
}