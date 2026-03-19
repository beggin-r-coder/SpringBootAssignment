package com.capgemini.training;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class UemSpringBootMvcApplication {

    public static void main(String[] args) {

        // Get PORT from environment (Railway)
        String port = System.getenv("PORT");

        // If not present (local), use 8080
        if (port == null || port.isEmpty()) {
            port = "8080";
        }

        // Set server port dynamically
        System.setProperty("server.port", port);

        SpringApplication.run(UemSpringBootMvcApplication.class, args);
    }
}