package news.model.article;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class DetailedArticle extends Article {
	private String content;
	private int categoryId;
}
