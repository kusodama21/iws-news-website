package news.validator;

import org.springframework.stereotype.Component;

import news.form.CommentForm;

@Component
public class CommentFormValidator {
	
	// Constraint
	public final String[] CONSTRAINTS = {
			"The content is missing",
			"The content must not be empty"
	};
	
	// Code matching index
	private final int CONTENT_MISSING = 0,
			CONTENT_LENGTH = 1;
	
	// Major-A: Validate content
	private String validateContent(String content) {
		if (content == null)
			return CONSTRAINTS[CONTENT_MISSING];
		
		return content.trim().isEmpty() ? CONSTRAINTS[CONTENT_LENGTH] : null;
	}
	
	// Validate
	public String validate(CommentForm form) {
		String contentResult = validateContent(form.getContent());
		if (contentResult != null)
			return contentResult;
		
		return null;
	}
}
