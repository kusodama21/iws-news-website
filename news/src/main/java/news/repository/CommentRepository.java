package news.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import news.model.Comment;

@Component
public class CommentRepository extends Repository<Comment> {
	
	// GET ONE BY ID
	public Comment getOneById(int id) {
		String sql = "SELECT * FROM comment WHERE id = :id";
		return querySingle(sql, new MapSqlParameterSource("id", id));
	}
	
	// CHECK ONE BY ID
	public boolean checkOneById(int id) {
		String sql = "SELECT EXISTS (SELECT 1 FROM comment WHERE id = :id)";
		return template.queryForObject(sql, new MapSqlParameterSource("id", id), Boolean.class);
	}
	
	// GET ACCOUNT ID BY ID
	public int getAccountIdById(int id) {
		String sql = "SELECT accountId FROM comment WHERE id = :id";
		return template.queryForObject(sql, new MapSqlParameterSource("id", id), Integer.class);
	}
	
	// GET MANY BY ARTICLE SECTION
	public List<Comment> getManyByArticleId(int articleId, int page, int limit) {
		String sql = "SELECT * FROM comment WHERE articleId = :articleId ORDER BY dateCreated DESC, id ASC " 
				+ "LIMIT :limit OFFSET :offset";
		
		MapSqlParameterSource source = new MapSqlParameterSource("articleId", articleId);
		source.addValue("limit", limit).addValue("offset", (page - 1) * limit);
		
		return template.query(sql, source, mapper);
	}
	
	public int countByArticleId(int articleId) {
		String sql = "SELECT COUNT(id) FROM comment WHERE articleId = :articleId ";
		return template.queryForObject(sql, new MapSqlParameterSource("articleId", articleId), Integer.class);
	}
	
	// INSERT ONE RETRIEVE ID
	public int insertOneRetrieveId(Comment comment) {
		String sql = "INSERT INTO comment (content, dateCreated, accountId, articleId) VALUES "
				+ "(:content, :dateCreated, :accountId, :articleId)";
		
		final KeyHolder keyHolder = new GeneratedKeyHolder();
		
		MapSqlParameterSource source = new MapSqlParameterSource("content", comment.getContent())
				.addValue("dateCreated", comment.getDateCreated())
				.addValue("accountId", comment.getAccountId())
				.addValue("articleId", comment.getArticleId());
		
		try {
			template.update(sql, source, keyHolder, new String[] {"id"});
			return keyHolder.getKey().intValue();
		} catch (DataAccessException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	// UPDATE ONE
	public boolean updateOne(Comment comment) {
		String sql = "UPDATE comment SET content = :content WHERE id = :id";
		return update(sql, new MapSqlParameterSource("id", comment.getId()).addValue("content", comment.getContent()));
	}
	
	// DELETE ONE BY ID
	public boolean deleteOneById(int id) {
		String sql = "DELETE FROM comment WHERE id = :id";
		return update(sql, new MapSqlParameterSource("id", id));
	}
}