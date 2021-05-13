package news.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import news.model.Category;
import news.repository.CategoryRepository;
import news.response.Messenger;

@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*", exposedHeaders = "*")
@RequestMapping("/test/categories")
public class CategoryController {
	
	@Autowired
	private CategoryRepository categoryRepository;

	// INDEX
	@GetMapping(value = "/basic/index", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Messenger> basicIndex() {
		List<Category> categories = categoryRepository.index();
		return new ResponseEntity<Messenger>(new Messenger(categories), HttpStatus.OK);
	}
}
