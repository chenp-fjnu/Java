package com.nfc.wordpress;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableAutoConfiguration
public class WordpressApplication {

	public static void main(String[] args) {
		SpringApplication.run(WordpressApplication.class, args);
	}
}
