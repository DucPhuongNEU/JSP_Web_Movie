package servletAction;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CommentsModel;
import model.entity.Comments;

/**
 * Servlet implementation class AllCommentAction
 */
@WebServlet("/AllCommentAction")
public class AllCommentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllCommentAction() {
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
		String action = request.getParameter("Action");
		int idmovie = Integer.parseInt(request.getParameter("idmovie"));
		int idmoviedetail = Integer.parseInt(request.getParameter("idmoviedetail"));
		int idcomment = 0;
		String content = null;
		CommentsModel cmModel = new CommentsModel();
		List<Comments> cmList = new ArrayList<>();
		switch(action) {
		case "insert":
			HttpSession session = request.getSession();
			String username = (String) session.getAttribute("Username");
			content = request.getParameter("comment-area");
			System.out.println(">>> Comment content: " + content);
			
			Comments c = new Comments();
			c.setIdmovie(idmovie);
			c.setUsername(username); 
			c.setContent(content);
			
			try {
				cmModel.insertComments(c);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "edit":
			idcomment = Integer.parseInt(request.getParameter("idcomment"));
			content = request.getParameter("edit-comment-area");
			try {
				cmModel.updateComments(idcomment, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "delete":
			idcomment = Integer.parseInt(request.getParameter("idcomment"));
			try {
				cmModel.deleteComments(idcomment);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		default: break;
		}
		
//		try {
//			cmList = cmModel.getComments(idmovie);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		request.setAttribute("CommentsList", cmList);
//		RequestDispatcher rd = request.getRequestDispatcher("./comments.jsp");
//		rd.forward(request, response);
		
		if (idmoviedetail == -1) {
			response.sendRedirect("./singleMovie.jsp?id=" + idmovie);
		} else {
			response.sendRedirect("./singleMovieDetail.jsp?id=" + idmovie + "&idmoviedetail=" + idmoviedetail);
		}
			
	}

}
