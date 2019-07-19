package servletAction;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AccountModel;
import model.entity.Account;

/**
 * Servlet implementation class RegisterAction
 */
@WebServlet("/RegisterAction")
public class RegisterAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAction() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");
		String email = request.getParameter("Email");

		//System.out.println("infomation: " + username + "    email: " + email);
		//AccountModel am = new AccountModel();
		//System.out.println("register");

		AccountModel aModel = new AccountModel();
		Account acc = null;
		
		try {
			acc = aModel.getAccount(username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (acc == null) {
			try {
				aModel.registAccount(username, password, email);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("./LoginAction?Username=" + username + "&Password=" + password);
		} else {
			System.out.println("Your account creation request failed. Please try again later.");
			response.sendRedirect("./index.jsp");
		}
	}

}
