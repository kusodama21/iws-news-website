package news.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import news.interceptor.OpenInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "news")
public class ServletContext implements WebMvcConfigurer {
	
	@Autowired
	private OpenInterceptor openInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(openInterceptor).addPathPatterns("/test/articles/lock/**");
		registry.addInterceptor(openInterceptor).addPathPatterns("/test/comments/lock/**");
	}
}
