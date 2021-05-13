package news.repository;

import java.util.List;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Component;

import news.model.Category;

@Component
public class CategoryRepository extends Repository<Category> {

	// GET ONE BY ID
	public Category getOneById(int id) {
		String sql = "SELECT * FROM category WHERE id = :id";
		return querySingle(sql, new MapSqlParameterSource("id", id));
	}
	
	// INDEX
	public List<Category> index() {
		String sql = "SELECT * FROM category";
		return template.query(sql, mapper);
	}
	
	// CHECK ONE BY ID
	public boolean checkOneById(int id) {
		String sql = "SELECT EXISTS (SELECT 1 FROM category WHERE id = :id)";
		return template.queryForObject(sql, new MapSqlParameterSource("id", id), Boolean.class);
	}
}
