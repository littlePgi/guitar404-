package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserLogin;
import service.impl.UserLoginImpl;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private UserLogin userLogin;
	public LoginServlet() {
		userLogin = new UserLoginImpl(); 
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		//����userService�ķ���
		Map<String, Object> resultMap = userLogin.userLogin(username, password);
		if((Boolean)resultMap.get("ok")){
			//�ж��Ƿ����Ա��¼
			if(resultMap.get("loginAdmin")!=null){
				//�жϳɹ��ͱ������Ա����session�У�����ת����ҳ
				HttpSession session = req.getSession();
				session.setAttribute("loginAdmin", resultMap.get("loginAdmin"));
				req.setAttribute("admin", "admin");
				req.getRequestDispatcher("indexServlet").forward(req, resp);
				//��ת����ҳ
//				resp.sendRedirect(req.getContextPath()+"/user/index.jsp");
			}
			//��ͨ�û�
			if (resultMap.get("loginUser")!=null) {
				//�жϳɹ��ͱ����û�����session�У�����ת����ҳ
				HttpSession session = req.getSession();
				session.setAttribute("loginUser", resultMap.get("loginUser"));
				req.setAttribute("user", "user");
				req.getRequestDispatcher("indexServlet").forward(req, resp);
				//��ת����ҳ
//				resp.sendRedirect(req.getContextPath()+"/user/index.jsp");
			}
		}else{
			//��¼ʧ�ܾ����ص�¼ҳ�棬������¼
			req.setAttribute("error", resultMap.get("error"));
			req.getRequestDispatcher("login-register.jsp").forward(req, resp);
			}
	}
}
