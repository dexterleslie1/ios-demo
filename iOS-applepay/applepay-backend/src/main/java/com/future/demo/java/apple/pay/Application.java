package com.future.demo.java.apple.pay;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 * @author dexterleslie@gmail.com
 */
@SpringBootApplication
@EnableJpaRepositories(basePackages={"com.future.demo"})
public class Application {
    /**
     *
     * @param args
     */
    public static void main(String []args){
        SpringApplication.run(Application.class, args);
    }
}
