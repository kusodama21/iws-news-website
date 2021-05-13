package news.repository.article;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import news.model.article.DetailedArticle;
import news.repository.Repository;

@Component
public class DetailedArticleRepository extends Repository<DetailedArticle> {
	
	// GET ONE BY ID
	public DetailedArticle getOneById(int id) {
		String sql = "SELECT * FROM article WHERE id = :id";	
		return querySingle(sql, new MapSqlParameterSource("id", id));
	}
	
	// CHECK ONE BY ID
	public boolean checkOneById(int id) {
		String sql = "SELECT EXISTS (SELECT 1 FROM article WHERE id = :id)";
		return template.queryForObject(sql, new MapSqlParameterSource("id", id), Boolean.class);
	}
	
	// GET ACCOUNT ID BY ID
	public int getAccountIdById(int id) {
		String sql = "SELECT accountId FROM article WHERE id = :id";
		return template.queryForObject(sql, new MapSqlParameterSource("id", id), Integer.class);
	}
	
	// INSERT ONE RETRIEVE ID
	public int insertOneRetrieveId(DetailedArticle article) {
		String sql = "INSERT INTO article "
				+ "(title, image, shortIntro, content, dateCreated, accountId, categoryId) "
				+ "VALUES "
				+ "(:title, :image, :shortIntro, :content, :dateCreated, :accountId, :categoryId)";
		
		final KeyHolder keyHolder = new GeneratedKeyHolder();
		
		MapSqlParameterSource source = new MapSqlParameterSource();
		source.addValue("title", article.getTitle())
			.addValue("image", article.getImage())
			.addValue("shortIntro", article.getShortIntro())
			.addValue("content", article.getContent())
			.addValue("dateCreated", article.getDateCreated())
			.addValue("accountId", article.getAccountId())
			.addValue("categoryId", article.getCategoryId());
		
		try {
			template.update(sql, source, keyHolder, new String[] {"id"});
			return keyHolder.getKey().intValue();
		} catch (DataAccessException e) {
			return -1;
		}
	}
	
	// UPDATE ONE
	public boolean updateOne(DetailedArticle article) {
		String sql = "UPDATE article SET "
				+ "title = :title, image = :image, shortIntro = :shortIntro, content = :content, categoryId = :categoryId "
				+ "WHERE id = :id";
		
		MapSqlParameterSource source = new MapSqlParameterSource("id", article.getId());
		source.addValue("title", article.getTitle())
			.addValue("image", article.getImage())
			.addValue("shortIntro", article.getShortIntro())
			.addValue("shortIntro", article.getShortIntro())
			.addValue("content", article.getContent())
			.addValue("categoryId", article.getCategoryId());
		
		return update(sql, source);
	}

	// DELETE ONE BY ID
	public boolean deleteOneById(int id) {
		String sql = "DELETE FROM article WHERE id = :id";
		return update(sql, new MapSqlParameterSource("id", id));
	}
}