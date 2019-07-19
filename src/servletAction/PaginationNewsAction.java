package servletAction;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NewsModel;
import model.entity.News;

/**
 * Servlet implementation class PaginationNewsAction
 */
@WebServlet("/PaginationNewsAction")
public class PaginationNewsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaginationNewsAction() {
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
		int pageId = Integer.parseInt(request.getParameter("Page"));
		int oldPageId = Integer.parseInt(request.getParameter("OldPage"));
		int actionP = Integer.parseInt(request.getParameter("ActionP"));
		if (actionP != 0) {
			pageId = oldPageId + actionP;
		}
		
		System.out.println(">>> Changing to page " + pageId);
		int countP = 6;
		int startP = (pageId-1)*countP + 1;
		NewsModel nModel = new NewsModel();
		List<News> nList = null;
		try {
			nList = nModel.getNewPage(startP - 1, countP);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("NewsList", nList);
		request.setAttribute("CurrentPage", pageId);
		
//		Cookie pageCookie = new Cookie("CurrentPage", String.valueOf(pageId));
//		response.addCookie(pageCookie);
		
		System.out.println(">>> Changing to view of page: " + pageId);
		RequestDispatcher rd = request.getRequestDispatcher("./show/ViewNewsList.jsp");
		rd.forward(request, response);
	}

}
