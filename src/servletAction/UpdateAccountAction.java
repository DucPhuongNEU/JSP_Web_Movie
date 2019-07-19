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

import model.AccountModel;
import model.entity.Account;

/**
 * Servlet implementation class UpdateAccountAction
 */
@WebServlet("/UpdateAccountAction")
public class UpdateAccountAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAccountAction() {
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
		String username = request.getParameter("Username");
		String password = null;
		String email = null;
		String avatar = null;
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			FileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);

			List accounts;
			try {
				accounts = servletFileUpload.parseRequest(request);
				FileItem fItem ;
				for(Object item : accounts){
					fItem = (FileItem) item;
					if(fItem.isFormField()){
						switch (fItem.getFieldName()) {
						case "Password":
							password = fItem.getString("UTF-8");
							break;
						case "Email":
							email = fItem.getString("UTF-8");
							break;
						case "Avatar":
							avatar = fItem.getString("UTF-8");
							break;
						default:
							break;
						}
					} else {
						if(fItem.getName() != null && fItem.getName().trim().length() > 0){
							//String filePath = getServletContext().getRealPath("/") + "/images/testMovies";
							String filePath = "C:\\Users\\DELL\\eclipse-workspace\\JavaWebNiitGroupMovie\\WebContent\\images\\avatar";
							File uploadFolder = new File(filePath);
							if(uploadFolder.exists() == false) uploadFolder.mkdirs();
							filePath += "/" + fItem.getName();
							File uploadedFile = new File(filePath);
							fItem.write(uploadedFile);
							System.out.println(">>>>>> File:" + uploadedFile.getPath());
							avatar = fItem.getName();
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		Account acc = new Account();
		acc.setId(id);
		acc.setUsername(username);
		acc.setPass(password);
		acc.setEmail(email);
		acc.setAvatar(avatar);
		
		if (avatar == null) {
			try {
				acc.setAvatar(new AccountModel().getAccountByUsername(username).getAvatar());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		try {
			new AccountModel().updateAccountVer2(acc);;
			response.sendRedirect("./admin.jsp?Username=" + acc.getUsername() + "&f=accountEditing");
			System.out.println(">>>Update account successfully");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
