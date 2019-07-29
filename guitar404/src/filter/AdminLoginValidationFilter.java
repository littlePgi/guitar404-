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
import javax.servlet.http.HttpSession;

/**
 * ��¼��֤������
 */
@WebFilter(urlPatterns={""})
public class AdminLoginValidationFilter implements Filter{

	public void destroy() {
		System.out.println("����Ա��¼��֤������������...");
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("����Ա��¼��֤���������й��ˣ�������");
		//��ServletRequest��ServletResponseת��ΪHttpServletRequest��HttpServletResponse
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		//ͨ��request��ȡsession
		HttpSession session = request.getSession();
		//�ж�session���Ƿ񱣴��е�¼����Ա��Ϣ
		if(session.getAttribute("loginAdmin")!=null){
			//�����¼����Ա��Ϣ������������ԭ��Ҫ���ʵ���Դ
			chain.doFilter(request, response);
		}else{
			//���û�е�¼����Ա��Ϣ������ת������Ա��¼ҳ��
			response.sendRedirect(request.getContextPath()+"/admin_login.jsp");
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("����Ա��¼��֤��������ʼ��...");
	}
}
