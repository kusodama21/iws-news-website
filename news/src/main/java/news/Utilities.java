package news;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Base64;
import java.util.Date;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import news.repository.account.DetailedAccountRepository;

@Component
public class Utilities {
	
	@Autowired
	private DetailedAccountRepository detailedAccountRepository;
	
	private final byte[] SECRET_KEY = Base64.getDecoder().decode("UJg2WMznfWEcJC+xhi5JJ2Kzl0/vhRM6YbdeTnmCuHc=");

	public String parseAccountIdIntoJwt(int accountId) {
		Instant now = Instant.now();
		
		return Jwts.builder()
				.setSubject("IWS")
				.claim("accountId", accountId)
				.setIssuedAt(Date.from(now))
				.setExpiration(Date.from(now.plus(1, ChronoUnit.DAYS)))
				.signWith(Keys.hmacShaKeyFor(SECRET_KEY))
				.compact();
	}
	
	public int claimAccountIdFromJwt(String jwt) {
		try {
			return Jwts.parserBuilder()
				.requireSubject("IWS")
				.setSigningKey(Keys.hmacShaKeyFor(SECRET_KEY))
				.build()
				.parseClaimsJws(jwt)
				.getBody()
				.get("accountId", Integer.class);
		} catch (Exception e) {
			return -1;
		}
	}
	
	public String hash(String plain) {
		return BCrypt.hashpw(plain, BCrypt.gensalt());
	}
	
	public boolean compare(String plain, String hashed) {
		return BCrypt.checkpw(plain, hashed);
	}

	public int extractAccountIdFromAuthHeader(String authHeader) {
		if (authHeader == null || authHeader.indexOf("Bearer ") != 0)
			return -1;
		
		int accountId = claimAccountIdFromJwt(authHeader.substring(7));
		if (accountId == -1)
			return -1;
		
		if (!detailedAccountRepository.checkOneById(accountId))
			return -1;
		
		return accountId;
	}
}
