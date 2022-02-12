package userdao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.service.spi.Startable;

import entites.product;
import entites.ratings;


public class ratingDao{

	
	private SessionFactory factory;

	public ratingDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	public boolean saveRating( ratings ratings) {
		
		boolean f=false;
		try {
			
			Session s = (Session) this.factory.openSession();
			Transaction tx = s.beginTransaction();
			
			s.save(ratings);
			
			tx.commit();
			
			s.close();
			
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public List<ratings> showRatingbyId(int proid) {
		
			Session s = this.factory.openSession();
			
			Query query = s.createQuery("from ratings where productID =: proid");
			 query.setParameter("proid",proid);
			 List<ratings> list = ((org.hibernate.Query<ratings>) query).list();
			
			s.close();

			
		return list;	
		
	}
	
	public List<ratings> showRatingBypage(int start,int end,int proid) {
		
		Session s = this.factory.openSession();
		
		Query query = s.createQuery("from ratings where productID =: proid");
		query.setFirstResult(start);
		query.setMaxResults(end);
		
		 query.setParameter("proid",proid);
		 List<ratings> list = ((org.hibernate.Query<ratings>) query).list();
		
		s.close();

		
	return list;	
	
}
	
	
			
	

}
