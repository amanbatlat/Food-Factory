package Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Feedback {

	@Id
	@GeneratedValue
	private int Cid; 
	
	String NAME;
	String EMAIL;
	String PHONE;
	String GENDER;
	String COMMENTS;
	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Feedback(int id, String nAME, String eMAIL, String pHONE, String gENDER, String cOMMENTS) {
		super();
		this.Cid = id;
		NAME = nAME;
		EMAIL = eMAIL;
		PHONE = pHONE;
		GENDER = gENDER;
		COMMENTS = cOMMENTS;
	}
	public int getCid() {
		return Cid;
	}
	public void setCid(int id) {
		this.Cid = id;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getGENDER() {
		return GENDER;
	}
	public void setGENDER(String gENDER) {
		GENDER = gENDER;
	}
	public String getCOMMENTS() {
		return COMMENTS;
	}
	public void setCOMMENTS(String cOMMENTS) {
		COMMENTS = cOMMENTS;
	}
	
	
}
