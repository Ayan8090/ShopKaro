package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entites.massage;
import entites.user;

/**
 * Servlet implementation class logout
 */
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			HttpSession s = request.getSession();
			s.removeAttribute("user");
			
			massage msg = new massage("You have logout...", "logout","Smsg");
			HttpSession s1 = request.getSession();
			s1.setAttribute("msg",msg);
					
			response.sendRedirect("Homepage.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
