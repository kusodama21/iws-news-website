package news.sendover.article;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class TruncatedArticleSendover extends ArticleSendover{
	private int commentCount;
}
