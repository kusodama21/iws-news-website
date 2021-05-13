package news.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import news.model.Comment;

@Component
public class CommentMapper implements RowMapper<Comment>{

	@Override
	public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
		// Flow: id -> content -> dateCreated -> accountId -> articleId
		Comment comment = new Comment();
		
		// Set Id
		comment.setId(rs.getInt(1));
		
		// Set content
		comment.setContent(rs.getString(2));
		
		// Set dateCreated
		comment.setDateCreated(rs.getTimestamp(3));
		
		// Set accountId
		comment.setAccountId(rs.getInt(4));
		
		// Set articleId
		comment.setArticleId(rs.getInt(5));
		
		return comment;
	}
}