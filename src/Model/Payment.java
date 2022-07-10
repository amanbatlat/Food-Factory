package Model;

import javax.persistence.*;

@Entity
public class Payment {

	@Id
	@GeneratedValue
	private int Payment_id;
	private String Type;
	@ManyToOne
	@JoinColumn(name="CustId")
	Customer Custid;
	int total;
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getPayment_id() {
		return Payment_id;
	}
	public void setPayment_id(int payment_id) {
		Payment_id = payment_id;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	

	public Customer getCustid() {
		return Custid;
	}

	public void setCustid(Customer custid) {
		Custid = custid;
	}

	public Payment(int payment_id, String type, Customer custid, int total) {
		super();
		Payment_id = payment_id;
		Type = type;
		this.Custid = custid;
		this.total = total;
	}
	
}
