package Model;

import javax.persistence.*;
@Entity
public class Orderd {

	@Id
	@GeneratedValue
	private int Order_id;
	int Total;
	@ManyToOne
	@JoinColumn(name="Cust_id")
	Customer custid;
	@ManyToOne
	@JoinColumn(name="Restau_id")
	Restaurant restid;
	String status;
	
	public Orderd() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Orderd(int order_id, int total, Customer custid, Restaurant restid, String status) {
		super();
		Order_id = order_id;
		Total = total;
		this.custid = custid;
		this.restid = restid;
		this.status = status;
	}

	public int getOrder_id() {
		return Order_id;
	}

	public void setOrder_id(int order_id) {
		Order_id = order_id;
	}

	public int getTotal() {
		return Total;
	}

	public void setTotal(int total) {
		Total = total;
	}

	public Customer getCustid() {
		return custid;
	}

	public void setCustid(Customer custid) {
		this.custid = custid;
	}

	public Restaurant getRestid() {
		return restid;
	}

	public void setRestid(Restaurant restid) {
		this.restid = restid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
}
