package Controller;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class GetSession {

	public static SessionFactory getconnection() {
		SessionFactory sf=new Configuration().configure().buildSessionFactory();
		return sf;
		
	}
	
}
