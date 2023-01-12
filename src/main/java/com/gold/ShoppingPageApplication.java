package com.gold;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class ShoppingPageApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShoppingPageApplication.class, args);
	}

}
