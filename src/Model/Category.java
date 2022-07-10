package Model;

import javax.persistence.Entity;
import javax.persistence.*;

@Entity
public class Category {

	@Id
	@GeneratedValue
	
	private int CAT_ID;
	@Column(unique=true)
	String CATEGORY;
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(int cAT_ID, String cATEGORY) {
		super();
		CAT_ID = cAT_ID;
		CATEGORY = cATEGORY;
	}
	public int getCAT_ID() {
		return CAT_ID;
	}
	public void setCAT_ID(int cAT_ID) {
		CAT_ID = cAT_ID;
	}
	public String getCATEGORY() {
		return CATEGORY;
	}
	public void setCATEGORY(String cATEGORY) {
		CATEGORY = cATEGORY;
	}
	
	}
