package com.nfc.wordpress.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nfc.wordpress.domain.Post;
import com.nfc.wordpress.repository.PostRepository;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	PostRepository repo;
	@GetMapping("/")
	ModelAndView GetAll(){
		ModelAndView mav = new ModelAndView();  
        mav.setViewName("posts");  
        List<Post> list = GetAllData();  
        mav.addObject("posts", list);
        return mav;
	}
	@GetMapping("/data")
	@ResponseBody 
	List<Post> GetAllData(){
		return (List<Post>) repo.findAll();
	}
	@GetMapping("/author/{author}/data")
	@ResponseBody 
	List<Post> GetPostByAuthorData(@PathVariable("author") String author)
	{
		return (List<Post>) repo.findByPostAuthor(author);
	}
}
