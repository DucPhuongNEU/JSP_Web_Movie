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
 * Servlet implementation class SearchTitleAction
 */
@WebServlet("/SearchTitleAction")
public class SearchTitleAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTitleAction() {
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
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		MovieModel mModel = new MovieModel();
		List<Movie> mList = null;
		try {
			mList = mModel.getSearchMovie(request, name);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("movielist", mList);
		RequestDispatcher rd = request.getRequestDispatcher("./show/ViewSearch.jsp");
		rd.forward(request, response);
				
	}

}
