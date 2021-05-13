package news.config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

@Configuration
@PropertySource("classpath:app.properties")
public class DatabaseContext {

	@Autowired
	private Environment env;
	
	private DataSource dataSource() {
		DataSource ds = new DataSource();
		
		String driverClassName = env.getProperty("jdbc.driver-class");
		ds.setDriverClassName(driverClassName);
		
		String url = env.getProperty("jdbc.url");
		ds.setUrl(url);
		
		String username = env.getProperty("jdbc.username");
		ds.setUsername(username);
		
		String password = env.getProperty("jdbc.password");
		ds.setPassword(password);
		
		int initialSize = Integer.parseInt(env.getProperty("jdbc.init-size"));
		ds.setInitialSize(initialSize);
		
		int maxActive = Integer.parseInt(env.getProperty("jdbc.max-active"));
		ds.setMaxActive(maxActive);
		
		int minIdle = Integer.parseInt(env.getProperty("jdbc.min-idle"));
		ds.setMinIdle(minIdle);
		
		int maxIdle = Integer.parseInt(env.getProperty("jdbc.max-idle"));
		ds.setMaxIdle(maxIdle);
		
		int evictTime = Integer.parseInt(env.getProperty("jdbc.evict-time"));
		ds.setMinEvictableIdleTimeMillis(evictTime);
		
		String validQuery = env.getProperty("jdbc.valid-query");
		ds.setValidationQuery(validQuery);
		
		int validQueryTimeout = Integer.parseInt(env.getProperty("jdbc.valid-query-timeout"));
		ds.setValidationQueryTimeout(validQueryTimeout);
		
		boolean testBorrow = Boolean.parseBoolean(env.getProperty("jdbc.test-borrow"));
		ds.setTestOnBorrow(testBorrow);
		
		boolean testConnect = Boolean.parseBoolean(env.getProperty("jdbc.test-connect"));
		ds.setTestOnConnect(testConnect);
		
		boolean testIdle = Boolean.parseBoolean(env.getProperty("jdbc.test-idle"));
		ds.setTestWhileIdle(testIdle);
		
		boolean testReturn = Boolean.parseBoolean(env.getProperty("jdbc.test-return"));
		ds.setTestOnReturn(testReturn);
		
		return ds;
	}
	
	@Bean(name = "template")
	public NamedParameterJdbcTemplate template() {
		return new NamedParameterJdbcTemplate(dataSource());
	}
}