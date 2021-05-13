package news.repository;

import java.util.List;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Component;

import news.model.Tag;

@Component
public class TagRepository extends Repository<Tag>{
	
	// GET ONE BY ID
	public Tag getOneById(int id) {
		String sql = "SELECT * FROM tag WHERE id = :id";
		return querySingle(sql, new MapSqlParameterSource("id", id));
	}
	
	// INDEX
	public List<Tag> index() {
		String sql = "SELECT * FROM tag";
		return template.query(sql, mapper);
	}
	
	// GET MANY BY ARTICLE SECTION
	public List<Tag> getManyByArticleId(int articleId) {
		String sql = "SELECT t.* FROM tag AS t "
				+ "INNER JOIN article_tag AS a_t ON t.id = a_t.tagId "
				+ "INNER JOIN article AS a ON a.id = a_t.articleId "
				+ "WHERE a.id = :articleId";
		return template.query(sql, new MapSqlParameterSource("articleId", articleId), mapper);
	}
	
	// CHECK ONE BY ID
	public boolean checkOneById(int id) {
		String sql = "SELECT EXISTS (SELECT 1 FROM tag WHERE id = :id)";
		return template.queryForObject(sql, new MapSqlParameterSource("id", id), Boolean.class);
	}
	
	// DELETE CENTRAL BY ARTICLE ID
	public boolean deleteCentralByArticleId(int articleId) {
		String sql = "DELETE FROM article_tag WHERE articleId = :articleId";
		return update(sql, new MapSqlParameterSource("articleId", articleId));
	}
	
	// INSERT CENTRAL BY ARTICLE ID AND ID LIST
	public int[] insertCentralByArticleId(int articleId, List<Integer> ids) {
		String sql = "INSERT INTO article_tag VALUES (:articleId, :tagId)";
		
		MapSqlParameterSource[] sources = ids.stream()
				.map(id -> new MapSqlParameterSource("articleId", articleId).addValue("tagId", id))
				.toArray(MapSqlParameterSource[]::new);
		
		return template.batchUpdate(sql, sources);
	}
}