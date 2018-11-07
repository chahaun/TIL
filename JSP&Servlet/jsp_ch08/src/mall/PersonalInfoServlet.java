package mall;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonalInfoServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PersonalInfo obj = new PersonalInfo();
		obj.setName("이정호");
		obj.setGender('남');
		obj.setAge(24);
		request.setAttribute("pinfo", obj);
		RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerInfoViewer.jsp");
		dispatcher.forward(request, response);
	}
}
