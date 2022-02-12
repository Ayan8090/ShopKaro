package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import entites.category;
import entites.massage;
import entites.product;
import helper.factroy;
import helper.saveImage;
import userdao.categroyDao;
import userdao.productDao;

/**
 * Servlet implementation class upadateProfile
 */
@MultipartConfig
public class upadateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public upadateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	try {
		
		int probyid = Integer.parseInt(request.getParameter("proid"));
	
		productDao productDao = new productDao(factroy.gFactory());
		
		product product = productDao.proByID(probyid);
		
		String name = request.getParameter("pName");
		String Des = request.getParameter("pDes");
		int price = Integer.parseInt(request.getParameter("pPrice"));
		int qun = Integer.parseInt(request.getParameter("pQun"));
		int dis = Integer.parseInt(request.getParameter("pDis"));

		int cateID = Integer.parseInt(request.getParameter("pCate"));

		Part part1 = request.getPart("pPic1");
		String photo1 = part1.getSubmittedFileName();

		Part part2 = request.getPart("pPic2");
		String photo2 = part2.getSubmittedFileName();

		Part part3 = request.getPart("pPic3");
		String photo3 = part3.getSubmittedFileName();

		
		
	/*	get cate*/

		categroyDao categroyDao= new categroyDao(factroy.gFactory());
		category cate= categroyDao.getCateId(cateID);
		
		
		String path1 = request.getRealPath("/")+"product"+File.separator+product.getPhoto1();
		String path2 = request.getRealPath("/")+"product"+File.separator+product.getPhoto2();
		String path3 = request.getRealPath("/")+"product"+File.separator+product.getPhoto3();
		saveImage.deletepi(path1);
		saveImage.deletepi(path2);
		saveImage.deletepi(path3);
		saveImage.savepic(part1.getInputStream(), path1);
		saveImage.savepic(part2.getInputStream(), path2);
		saveImage.savepic(part3.getInputStream(), path3);
		
		
		
		product.setName(name);
		product.setDes(Des);
		product.setPrice(price);
		product.setDiscout(dis);
		product.setQuantity(qun);
		product.setCategory(cate);
        product.setPhoto1(photo1);
        product.setPhoto2(photo2);
        product.setPhoto3(photo3);
		
		
		
		System.out.println("Product Saved");
		
		massage massage1 = new massage("Product Updated", "Login error", "alert-success text-center");

		HttpSession session = request.getSession();
		session.setAttribute("msg", massage1);

		response.sendRedirect("adminProfile.jsp");
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
	}

}
