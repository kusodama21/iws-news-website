package news.validator;

import java.util.HashSet;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import news.form.ArticleForm;
import news.model.article.Article;
import news.repository.CategoryRepository;
import news.repository.TagRepository;

@Component
public class ArticleFormValidator {
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private TagRepository tagRepository;

	// Constraints
	public final String[] CONSTRAINTS = {
			"The title is missing",
			"The title\'s maximum is at " + Article.TITLE_MAX_LENGTH + " characters and not empty",
			"The image link is missing",
			"The image link\'s maximum is at " + Article.IMAGE_MAX_LENGTH + " characters and not empty",
			"The short intro is missing",
			"The short intro\'s maximum is at " + Article.SHORT_INTRO_MAX_LENGTH + " characters and not empty",
			"The content is missing",
			"The content must be empty, maximum length not specified"
	};
	
	// Code matching index
	private final int TITLE_MISSING = 0,
			TITLE_LENGTH = 1,
			IMAGE_MISSING = 2,
			IMAGE_LENGTH = 3,
			INTRO_MISSING = 4,
			INTRO_LENGTH = 5,
			CONTENT_MISSING = 6,
			CONTENT_LENGTH = 7;
	
	// MINOR-A: VALIDATE TITLE
	private String validateTitle(String title) {
		if (title == null)
			return CONSTRAINTS[TITLE_MISSING];
		
		final int len = title.trim().length();
		return 0 < len && len <= Article.TITLE_MAX_LENGTH ? null : CONSTRAINTS[TITLE_LENGTH];
	}
	
	// MINOR-A: VALIDATE IMAGE
	private String validateImage(String image) {
		if (image == null)
			return CONSTRAINTS[IMAGE_MISSING];
		
		final int len = image.trim().length();
		return 0 < len && len <= Article.IMAGE_MAX_LENGTH ? null : CONSTRAINTS[IMAGE_LENGTH];
	}
	
	// MINOR-A: VALIDATE SHORT INTRO
	private String validateShortIntro(String shortIntro) {
		if (shortIntro == null)
			return CONSTRAINTS[INTRO_MISSING];
		
		final int len = shortIntro.trim().length();
		return 0 < len && len <= Article.SHORT_INTRO_MAX_LENGTH ? null : CONSTRAINTS[INTRO_LENGTH];
	}
	
	// MINOR-A: VALIDATE CONTENT
	private String validateContent(String content) {
		if (content == null)
			return CONSTRAINTS[CONTENT_MISSING];
		else
			return content.trim().isEmpty() ? CONSTRAINTS[CONTENT_LENGTH] : null;
	}
	
	// MINOR-A: VALIDATE CATEGORY ID
	private String validateCategoryId(int categoryId) {
		return categoryRepository.checkOneById(categoryId) ? null : "The category for id \"" + categoryId + "\" can not be found";
	}
	
	// MINOR-A: VALIDATE TAG IDS
	private String validateTagIds(List<Integer> tagIds) {
		if (tagIds == null || tagIds.isEmpty())
			return null;
		
		HashSet<Integer> duplicatedTagIds = new HashSet<>();
		if (tagIds.stream().anyMatch(id -> !duplicatedTagIds.add(id)))
			return "There are duplicated entries in tag id list, please check again";
				
		String nonexistentTagIds = tagIds.stream()
				.filter(id -> !tagRepository.checkOneById(id))
				.map(id -> "\"" + id + "\"")
				.collect(Collectors.joining(", "));;
		
		return nonexistentTagIds.isEmpty() ? null : "The tag(s) for id(s) " + nonexistentTagIds + " can not be found";
	}
	
	// VALIDATE
	public String validate(ArticleForm form) {
		String titleResult = validateTitle(form.getTitle());
		if (titleResult != null)
			return titleResult;
		
		String imageResult = validateImage(form.getImage());
		if (imageResult != null)
			return imageResult;
		
		String shortIntroResult = validateShortIntro(form.getShortIntro());
		if (shortIntroResult != null)
			return shortIntroResult;
		
		String contentResult = validateContent(form.getContent());
		if (contentResult != null)
			return contentResult;
		
		String categoryIdResult = validateCategoryId(form.getCategoryId());
		if (categoryIdResult != null)
			return categoryIdResult;
		
		String tagIdsResult = validateTagIds(form.getTagIds());
		if (tagIdsResult != null)
			return tagIdsResult;
		
		return null;
	}
}