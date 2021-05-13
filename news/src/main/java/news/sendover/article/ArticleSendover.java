package news.sendover.article;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import news.model.account.TruncatedAccount;

@Getter
@Setter
public abstract class ArticleSendover {
	protected int id;
	protected String title, image, shortIntro;
	protected Timestamp dateCreated;
	protected TruncatedAccount account;
}
