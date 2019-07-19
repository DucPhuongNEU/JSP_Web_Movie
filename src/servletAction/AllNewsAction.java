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

import model.NewsModel;
import model.entity.News;

/**
 * Servlet implementation class AllNewsAction
 */
@WebServlet("/AllNewsAction")
public class AllNewsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllNewsAction() {
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
		
		String action = request.getParameter("Action");
		System.out.println(">>> News action: " + action);
		String title = null;
		String image = null;
		String content = null;
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			FileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);

			List newsList;
			try {
				newsList = servletFileUpload.parseRequest(request);
				FileItem fItem ;
				for(Object item : newsList){
					fItem = (FileItem) item;
					if(fItem.isFormField()){
						switch (fItem.getFieldName()) {
						case "Title":
							title = fItem.getString("UTF-8");
							break;
						case "Image":
							image = fItem.getString("UTF-8");
							break;
						case "Content":
							content = fItem.getString("UTF-8");
							break;
						default:
							break;
						}
					} else {
						if(fItem.getName() != null && fItem.getName().trim().length() > 0){
							//String filePath = getServletContext().getRealPath("/") + "/images/imagesNews"; //use for real Tomcat
							String filePath = "C:\\Users\\DELL\\eclipse-workspace\\JavaWebNiitGroupMovie\\WebContent\\images\\imagesNews";
							File uploadFolder = new File(filePath);
							if(uploadFolder.exists() == false) uploadFolder.mkdirs();
							filePath += "/" + fItem.getName();
							File uploadedFile = new File(filePath);
							fItem.write(uploadedFile);
							System.out.println(">>>>>> File:" + uploadedFile.getPath());
							image = fItem.getName();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		News n = new News();
		n.setTitle(title);
		n.setImage(image);
		n.setContent(content);
		
		switch (action) {
		case "insert":
			try {
				if (image == null) {
					n.setImage("./news.jpg");
				}
				new NewsModel().insertNews(n);
				
				response.sendRedirect("./admin.jsp?f=news");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "edit":
			int idnews = Integer.parseInt(request.getParameter("idnews"));
			n.setIdnews(idnews);
			if (image == null) {
				try {
					n.setImage(new NewsModel().getNewById(idnews).getImage());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			try {
				new NewsModel().updateNews(n);
				response.sendRedirect("./admin.jsp?f=news");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "increaseView":
			int idnews2 = Integer.parseInt(request.getParameter("idnews"));
			System.out.println("??Action is " + action + " and idnews is: " + idnews2);
			NewsModel nModel2 = new NewsModel();
			try {
				News n2 = nModel2.getNewById(idnews2);
				int oldView = n2.getView();
				n2.setView(oldView + 1);
				System.out.println("??New view is: " + (oldView + 1));
				nModel2.updateNewsView(n2);
				response.sendRedirect("../news-single.jsp?idnews=" + idnews2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
	}

}
