package news.mapper.article;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import news.model.article.TruncatedArticle;

@Component
public class TruncatedArticleMapper implements RowMapper<TruncatedArticle> {

	@Override
	public TruncatedArticle mapRow(ResultSet rs, int rowNum) throws SQLException {
		// Flow: id -> title -> image -> shortIntro -> dateCreated -> accountId -> commentCount
		TruncatedArticle truncatedArticle = new TruncatedArticle();
		
		// Set Id
		truncatedArticle.setId(rs.getInt(1));
		
		// Set title
		truncatedArticle.setTitle(rs.getString(2));
		
		// Set image
		truncatedArticle.setImage(rs.getString(3));
		
		// Set shortIntro
		truncatedArticle.setShortIntro(rs.getString(4));
		
		// Set dateCreated
		truncatedArticle.setDateCreated(rs.getTimestamp(5));
		
		// Set accountId
		truncatedArticle.setAccountId(rs.getInt(6));
		
		// Set commentCount
		truncatedArticle.setCommentCount(rs.getInt(7));
		
		return truncatedArticle;
	}
}