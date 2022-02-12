package servlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.criteria.From;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entites.category;
import entites.product;
import helper.factroy;
import userdao.categroyDao;
import userdao.productDao;

/**
 * Servlet implementation class Search
 */
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String search = request.getParameter("name");

			/*serach name From category*/
			
			categroyDao categroyDao = new categroyDao(factroy.gFactory());
			
			category category= categroyDao.SearchCate(search);
			
			
			if (category==null) {
				
				response.sendRedirect("NoResult.jsp");
			}else {
				

				/*category by name*/
				
			/*	category session*/
				
				HttpSession session = request.getSession();
				session.setAttribute("SearchResult", category);
				
				response.sendRedirect("SearchResult.jsp");
				
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
