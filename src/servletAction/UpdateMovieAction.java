package servletAction;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.MovieDetailModel;
import model.MovieModel;
import model.entity.Movie;

/**
 * Servlet implementation class UpdateMovieAction
 */
@WebServlet("/UpdateMovieAction")
public class UpdateMovieAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMovieAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String title = null;
		String author = null;
		String country= null;
		String movieType = null;
		String genre = null;
		int releasedate = 0;
		int episode = 0;
		String status = null;
		String description = null;
		String imageLink = null;
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			FileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);

			List movies;
			try {
				movies = servletFileUpload.parseRequest(request);
				FileItem fItem ;
				for(Object item : movies){
					fItem = (FileItem) item;
					if(fItem.isFormField()){
						switch (fItem.getFieldName()) {
						case "Title":
							title = fItem.getString("UTF-8");
							break;
						case "Author":
							author = fItem.getString("UTF-8");
							break;
						case "Country":
							country = fItem.getString("UTF-8");
							break;
						case "MovieType":
							movieType = fItem.getString("UTF-8");
							break;
						case "Genre":
							genre = fItem.getString("UTF-8");
							break;
						case "Releasedate":
							releasedate = Integer.parseInt(fItem.getString());
							break;
						case "Episode":
							episode = Integer.parseInt(fItem.getString());
							break;
						case "Status":
							status = fItem.getString();
							break;
						case "Description":
							description = fItem.getString("UTF-8");
							break;
						case "ImageLink":
							imageLink = fItem.getString();
							break;	
						default:
							break;
						}
					} else {
						if(fItem.getName() != null && fItem.getName().trim().length() > 0){
							//String filePath = getServletContext().getRealPath("/") + "/images/testMovies";
							String filePath = "C:\\Users\\DELL\\eclipse-workspace\\JavaWebNiitGroupMovie\\WebContent\\images\\testMovies";
							File uploadFolder = new File(filePath);
							if(uploadFolder.exists() == false) uploadFolder.mkdirs();
							filePath += "/" + fItem.getName();
							File uploadedFile = new File(filePath);
							fItem.write(uploadedFile);
							System.out.println(">>>>>> File:" + uploadedFile.getPath());
							imageLink = fItem.getName();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		Movie m = new Movie(id, title, country, movieType, genre, releasedate, episode, status, description);
		m.setAuthor(author);
		m.setImageLink(imageLink);
		
		if (imageLink == null) {
			try {
				m.setImageLink(new MovieModel().getMovieById(id).getImageLink());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
		
		try {
			new MovieModel().updateMovie(m);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("./admin.jsp?f=movieManage");
	}

}
