package news.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.servlet.HandlerInterceptor;

import com.fasterxml.jackson.databind.ObjectMapper;

import news.Utilities;
import news.repository.account.DetailedAccountRepository;
import news.response.Messenger;

@Component
public class OpenInterceptor implements HandlerInterceptor {
	
	@Autowired
	private DetailedAccountRepository detailedAccountRepository;
	
	@Autowired
	private Utilities utilities;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		response.addHeader(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN, "*");
		response.addHeader(HttpHeaders.ACCESS_CONTROL_ALLOW_HEADERS, "*");
		response.addHeader(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, "*");
		response.addHeader(HttpHeaders.ACCESS_CONTROL_ALLOW_METHODS, "*");

		// Check Authorization header
		String authHeader = request.getHeader("Authorization");
		if (authHeader == null || authHeader.indexOf("Bearer ") != 0) {
			String msg = "The \"Authorization\" header is missing or \"Bearer\" tolen is invalid";

			response.setContentType(MediaType.APPLICATION_JSON_VALUE);
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			response.getWriter().write(new ObjectMapper().writeValueAsString(new Messenger(msg)));
			return false;
		}

		// Check parsing token
		int accountId = utilities.claimAccountIdFromJwt(authHeader.substring(7));
		if (accountId == -1) {
			String msg = "The token is either illegal or expired";
			
			response.setContentType(MediaType.APPLICATION_JSON_VALUE);
			response.setStatus(HttpServletResponse.SC_PRECONDITION_FAILED);
			response.getWriter().write(new ObjectMapper().writeValueAsString(new Messenger(msg)));
			return false;
		}

		// Check the existence of this accountId
		if (!detailedAccountRepository.checkOneById(accountId)) {
			String msg = "The information encoded in the token is not available on the server";
			
			response.setContentType(MediaType.APPLICATION_JSON_VALUE);
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			response.getWriter().write(new ObjectMapper().writeValueAsString(new Messenger(msg)));
			return false;
		}
		
		// Success
		request.setAttribute("accountId", accountId);
		return true;
	}
}
