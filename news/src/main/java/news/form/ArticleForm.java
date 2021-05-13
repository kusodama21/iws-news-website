package news.form;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class ArticleForm {
	private String title, image, shortIntro, content;
	private int categoryId;
	List<Integer> tagIds;
	
	// Add Form Capture: id auto at server side, accountId sent by header
	// Edit Form Capture: id sent by Path, accountId sent by header
}