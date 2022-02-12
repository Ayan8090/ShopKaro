package userdao;



import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


import entites.user;

public class userdao {

	private SessionFactory factory;

	public userdao(SessionFactory factory) {
		this.factory = factory;
	}
	public user getUser(String email,String password) {
		
	user user = null;
	try {
		
		String query = "from user where  email =: e and password =:p ";
	Session session =	this.factory.openSession();
	Query q =session.createQuery(query);
	q.setParameter("e",email);
	q.setParameter("p",password);
	
	user=(user)q.uniqueResult();
	
	
	session.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	return user;
	}
	
	public List<user> getuserList()
	{
		Session s = this.factory.openSession();
	Query query = s.createQuery("from user");
	 
	List<user> list = ((org.hibernate.Query) query).list();
		s.close();
		
		return list;
		}
}
