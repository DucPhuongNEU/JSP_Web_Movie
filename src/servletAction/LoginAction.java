package servletAction;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AccountModel;
import model.entity.Account;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet(urlPatterns = {"/LoginAction"}, 
		initParams = {
				@WebInitParam(name = "role", value = "admin"),
				@WebInitParam(name = "permission", value = "admit"),				
		})
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");
		
		
		AccountModel aModel = new AccountModel();
		Account acc = null;
		try {
			acc = aModel.getAccount(username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (acc != null) {
			HttpSession session = request.getSession();
			session.setAttribute("Username", username);
			
			// Create cookies and set value for username
//			Cookie userCookie = new Cookie("Username", username);
//			userCookie.setMaxAge(60*4);
//			response.addCookie(userCookie);
			
			response.sendRedirect("./index.jsp");
			System.out.println(">>>> Username: " + username);
		} else {
			response.sendRedirect("./index.jsp");
			System.out.println("Username or password is not typed correctly");
		}
		
	}

}
