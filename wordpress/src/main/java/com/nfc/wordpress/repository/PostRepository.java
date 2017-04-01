package com.nfc.wordpress.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nfc.wordpress.domain.Post;

public interface PostRepository extends CrudRepository<Post, Long> {

	List<Post> findByPostAuthor(String post_author);
}
