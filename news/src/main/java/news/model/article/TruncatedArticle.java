package news.model.article;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class TruncatedArticle extends Article {
	private int commentCount;
}
