package news.model.article;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public abstract class Article {
	public final static int TITLE_MAX_LENGTH = 100,
			IMAGE_MAX_LENGTH = 255,
			SHORT_INTRO_MAX_LENGTH = 500;
	
	protected int id;
	protected String title, image, shortIntro;
	protected Timestamp dateCreated;
	protected int accountId;
}
