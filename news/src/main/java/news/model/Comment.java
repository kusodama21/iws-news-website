package news.model;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class Comment {
	private int id, articleId, accountId;
	private String content;
	private Timestamp dateCreated;
}
