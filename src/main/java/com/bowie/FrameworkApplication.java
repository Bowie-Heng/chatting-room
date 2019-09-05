package com.bowie;


import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
public class FrameworkApplication {
	public static void main(String[] args) {
	    //如果弹出对话框的时候报错,在vm option中添加配置 -Djava.awt.headless=false
		SpringApplicationBuilder builder = new SpringApplicationBuilder(FrameworkApplication.class);
		builder.headless(false).web(WebApplicationType.SERVLET).run(args);
	}
}
