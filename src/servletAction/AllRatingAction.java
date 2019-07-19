package servletAction;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.RatingModel;
import model.entity.Rating;

/**
 * Servlet implementation class AllRatingAction
 */
@WebServlet("/AllRatingAction")
public class AllRatingAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllRatingAction() {
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
		HttpSession session = request.getSession();
		float rating = Float.parseFloat(request.getParameter("Rating"));
		int idmovie = Integer.parseInt(request.getParameter("idmovie"));
		int idmoviedetail = Integer.parseInt(request.getParameter("idmoviedetail"));
		String username = (String)session.getAttribute("Username");
		Rating r = new Rating();
		r.setIdmovie(idmovie);
		r.setUsername(username);
		r.setValuerating(rating);
		try {
			Rating r2 = new RatingModel().getRating(idmovie, username);
			if (r2.getIdrating() == 0) {
				new RatingModel().insertRating(r);
			} else {
				new RatingModel().updateRating(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("./singleMovieDetail.jsp?id=" + idmovie + "&idmoviedetail=" + idmoviedetail);
	}

}
