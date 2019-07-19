package servletAction;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MovieModel;
import model.entity.Movie;

/**
 * Servlet implementation class PaginationCountryAction
 */
@WebServlet("/PaginationCountryAction")
public class PaginationCountryAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaginationCountryAction() {
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
		String country = (String)request.getParameter("Country");
		if (actionP != 0) {
			pageId = oldPageId + actionP;
		}
		
		System.out.println(">>> Changing to page " + pageId + " of country: " + country);
		int countP = 12;
		int startP = (pageId-1)*countP + 1;
		request.setAttribute("CurrentPage", pageId);
		MovieModel mModel = new MovieModel();
		List<Movie> mList = null;
		try {
			mList = mModel.getCountryPage(startP - 1, countP, country, request);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("CountryList", mList);
		
		System.out.println(">>> Changing to view of page: " + pageId);
		RequestDispatcher rd = request.getRequestDispatcher("./show/ViewCountryList.jsp");
		rd.forward(request, response);
	}

}
