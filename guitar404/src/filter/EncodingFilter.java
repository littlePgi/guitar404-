package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 编码过滤器
 */
@WebFilter("/*")
public class EncodingFilter implements Filter{

	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("编码过滤器初始化...");
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		//System.out.println("编码过滤器进行过滤...");
		
		//把ServletRequest和ServletResponse转换为HttpServletRequest和HttpServletResponse
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		if (request.getRequestURL().indexOf("static")==-1) {
		//设置request和response的编码
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		}
		//继续进行下一个链chain
		chain.doFilter(request, response);
	}
	
	public void destroy() {
		System.out.println("编码过滤器已销毁...");
	}
}
