package news.sendover;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import news.model.account.TruncatedAccount;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CommentSendover {
	
	// Article ID will be included but not article object itself, to avoid unnecessary overhead query
	private int id, articleId;
	
	// Account ID will be reflect by Account
	private TruncatedAccount account;
	
	// Content stays still
	private String content;
	
	// dateCreated as Timestamp, cast back to long
	private Timestamp dateCreated;
}
