package news.form;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CommentForm {
	private String content;
	
	// Insert: id auto provided, accountId by header, article by path
	// Edit: id provided by path, accountId by header, not touching article
}
