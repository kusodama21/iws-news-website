package news.sendover.article;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import news.model.Category;
import news.model.Tag;

@NoArgsConstructor
@Getter
@Setter
public class DetailedArticleSendover extends ArticleSendover {
	private String content;
	private Category category;
	private List<Tag> tags;
}
