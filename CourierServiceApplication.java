package com.example.courierservice;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.beans.factory.annotation.Value;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SpringBootApplication
public class CourierServiceApplication implements CommandLineRunner {

	private static final Logger logger = LoggerFactory.getLogger(CourierServiceApplication.class);

	@Value("${server.port}")
	private String serverPort;

	public static void main(String[] args) {
		SpringApplication.run(CourierServiceApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		logger.info("Server is running on port: " + serverPort);
	}
}
