package news.mapper.article;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import news.model.article.DetailedArticle;

@Component
public class DetailedArticleMapper implements RowMapper<DetailedArticle> {

	@Override
	public DetailedArticle mapRow(ResultSet rs, int rowNum) throws SQLException {
		// Flow: id -> title -> image -> shortIntro -> content -> dateCreated -> accountId -> categoryId
		DetailedArticle detailedArticle = new DetailedArticle();
		
		// Set Id
		detailedArticle.setId(rs.getInt(1));
		
		// Set title
		detailedArticle.setTitle(rs.getString(2));
		
		// Set image
		detailedArticle.setImage(rs.getString(3));
		
		// Set shortIntro
		detailedArticle.setShortIntro(rs.getString(4));
		
		// Set content
		detailedArticle.setContent(rs.getString(5));
		
		// Set dateCreated
		detailedArticle.setDateCreated(rs.getTimestamp(6));
		
		// Set accountId
		detailedArticle.setAccountId(rs.getInt(7));
		
		// Set categoryId
		detailedArticle.setCategoryId(rs.getInt(8));
		
		return detailedArticle;
	}
}