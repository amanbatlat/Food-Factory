
package Controller;



import java.util.Iterator;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import Model.Food;

public class FoodControl {

	SessionFactory sf;
	Session ss;
	Transaction tr;
	public void insert(Food obj) {
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.save(obj);
		tr.commit();
		ss.close();
		sf.close();
		
	}
	
	public void update(Food obj) {
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.update(obj);
		tr.commit();
		ss.close();
		sf.close();
		
	}
	
	public void Delete(Food obj) {
		
		sf = GetSession.getconnection();
		ss = sf.openSession();
		tr = ss.beginTransaction();
		ss.delete(obj);
		tr.commit();
		ss.close();
		sf.close();
	}
	
	public Food select(int id) {
		Food obj=null;
		sf = GetSession.getconnection();
		ss = sf.openSession();
		Criteria cr = ss.createCriteria(Food.class);		
		cr.add(Restrictions.eq("id", id));
		Iterator<Food> itr = cr.list().iterator();
		ss.close();
		sf.close();
		
		if(itr.hasNext()) {
			obj = itr.next();
			return obj;
		}
		return obj;
		
	}
	public Food selectRest(int id){
		Food obj=null;
		sf = GetSession.getconnection();
		ss = sf.openSession();
		Criteria cr = ss.createCriteria(Food.class);		
		cr.add(Restrictions.eq("Restaurant_id", id));
		Iterator<Food> itr = cr.list().iterator();
		ss.close();
		sf.close();
		
		if(itr.hasNext()) {
			obj = itr.next();
			return obj;
		}
		return obj;
		
	}
	
	
	public Iterator<Food> selectall() {
		Iterator<Food> itr = null;
		sf = GetSession.getconnection();
		ss = sf.openSession();
		Criteria cr = ss.createCriteria(Food.class);
		itr = cr.list().iterator();
		ss.close();
		sf.close();
		return itr;
	}
	
	
}
