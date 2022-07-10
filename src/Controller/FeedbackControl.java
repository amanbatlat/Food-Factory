
package Controller;



import java.util.Iterator;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import Model.Feedback;

public class FeedbackControl {

	SessionFactory sf;
	Session ss;
	Transaction tr;
	public void insert(Feedback obj) {
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.save(obj);
		tr.commit();
		ss.close();
		sf.close();
		
	}
	
	public void update(Feedback obj) {
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.update(obj);
		tr.commit();
		ss.close();
		sf.close();
		
	}
	
	public void Delete(Feedback obj) {
		
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.delete(obj);
		tr.commit();
		ss.close();
		sf.close();
	}
	
	public Feedback select(int id) {
		Feedback obj=null;
		sf = GetSession.getconnection();
		ss = sf.openSession();
		Criteria cr = ss.createCriteria(Feedback.class);		
		cr.add(Restrictions.eq("id", id));
		Iterator<Feedback> itr = cr.list().iterator();
		ss.close();
		sf.close();
		
		if(itr.hasNext()) {
			obj = itr.next();
			return obj;
		}
		return obj;
		
	}
	
	
	
	public Iterator<Feedback> selectall() {
		Iterator<Feedback> itr = null;
		sf = GetSession.getconnection();
		ss = sf.openSession();
		Criteria cr = ss.createCriteria(Feedback.class);
		itr = cr.list().iterator();
		ss.close();
		sf.close();
		return itr;
	}
	
	
}
