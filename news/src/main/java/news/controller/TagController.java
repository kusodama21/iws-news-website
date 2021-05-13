package news.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import news.model.Tag;
import news.repository.TagRepository;
import news.response.Messenger;

@CrossOrigin(origins = "*", allowedHeaders = "*", exposedHeaders = "*")
@Controller
@RequestMapping("/test/tags")
public class TagController {

	@Autowired
	private TagRepository tagRepository;
	
	@GetMapping(value = "/basic/index")
	public ResponseEntity<Messenger> basicIndex() {
		List<Tag> tags = tagRepository.index();
		return new ResponseEntity<Messenger>(new Messenger(tags), HttpStatus.OK);
	}
}
