package helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class factroy {

	
	private static SessionFactory factory;
	
	public static SessionFactory gFactory() {
		try {
			
		 if (factory==null) {
			
			 factory = new Configuration().configure("hibernate.xml").buildSessionFactory();
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return factory;
	}
}
