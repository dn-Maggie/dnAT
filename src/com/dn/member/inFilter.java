package com.dn.member;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class inFilter extends HttpServlet implements Filter {

	private static final long serialVersionUID = 1L;

	@Override
	public void destroy() {
		System.out.println("logoutFilter destroy>>>>>>>>>>>>>>>>>>");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
	
		/*RequestDispatcher dispatcher = request
				.getRequestDispatcher("../index.jsp");*/
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
	    String path = req.getContextPath();
	    String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path;
		HttpSession session = req.getSession(true);
		String userid = (String) session.getAttribute(session.getId());
		//System.out.println(userid + "--2");
 		if (userid == null || "".equals(userid)) {
 			chain.doFilter(request, response);
		} else {
			resp.sendRedirect(basePath+"/static/KeyWords.html");
		}
	}
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("logoutFilter init>>>>>>>>>>>>>>>>>");
	}

}