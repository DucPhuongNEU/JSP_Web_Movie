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
import model.entity.MovieDetail;

/**
 * Servlet implementation class InsertMovieDetailAction
 */
@WebServlet("/InsertMovieDetailAction")
public class InsertMovieDetailAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMovieDetailAction() {
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
		String episode = null;
		String episodename = null;
		String episodelink = null;
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			FileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);

			List movieDetails;
			try {
				movieDetails = servletFileUpload.parseRequest(request);
				FileItem fItem ;
				for(Object item : movieDetails){
					fItem = (FileItem) item;
					if(fItem.isFormField()){
						switch (fItem.getFieldName()) {
						case "Episode":
							episode = fItem.getString();
							break;
						case "Episodename":
							episodename = fItem.getString("UTF-8"); 
							break;
						case "Episodelink":
							episodelink = fItem.getString();
							break;
						default:
							break;
						}
					} else {
						if(fItem.getName() != null && fItem.getName().trim().length() > 0){
							//String filePath = getServletContext().getRealPath("/") + "/images/testMovies";
							String filePath = "C:\\Users\\DELL\\eclipse-workspace\\JavaWebNiitGroupMovie\\WebContent\\movie";
							File uploadFolder = new File(filePath);
							if(uploadFolder.exists() == false) uploadFolder.mkdirs();
							filePath += "/" + fItem.getName();
							File uploadedFile = new File(filePath);
							fItem.write(uploadedFile);
							System.out.println(">>>>>> File:" + uploadedFile.getPath());
							episodelink = fItem.getName();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		MovieDetail md = new MovieDetail();
		md.setId(id);
		md.setEpisode(episode);
		md.setEpisodename(episodename);
		md.setEpisodelink(episodelink);
		
		try {
			new MovieDetailModel().insertMovieDetail(md);;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("./admin.jsp?id=" + id + "&f=movieDetailManage");
	}

}
