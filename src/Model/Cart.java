package Model;

import javax.persistence.*;

@Entity
public class Cart {

	@Id
	@GeneratedValue
	private int Cart_Id;
	@ManyToOne
	@JoinColumn(name="food_id")
	Food food_id;
	
	@ManyToOne
	@JoinColumn(name="Customer_id")
	Customer c_id;
	@ManyToOne
	@JoinColumn(name="Rest_id")
	Restaurant rest_id;
	int QUANTITY;

	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cart(int cart_Id, Food food_id, Customer c_id, Restaurant rest_id, int qUANTITY) {
		super();
		Cart_Id = cart_Id;
		this.food_id = food_id;
		this.c_id = c_id;
		this.rest_id = rest_id;
		QUANTITY = qUANTITY;
	}

	public int getCart_Id() {
		return Cart_Id;
	}

	public void setCart_Id(int cart_Id) {
		Cart_Id = cart_Id;
	}

	public Food getFood_id() {
		return food_id;
	}

	public void setFood_id(Food food_id) {
		this.food_id = food_id;
	}

	public Customer getC_id() {
		return c_id;
	}

	public void setC_id(Customer c_id) {
		this.c_id = c_id;
	}

	public Restaurant getRest_id() {
		return rest_id;
	}

	public void setRest_id(Restaurant rest_id) {
		this.rest_id = rest_id;
	}

	public int getQUANTITY() {
		return QUANTITY;
	}

	public void setQUANTITY(int qUANTITY) {
		QUANTITY = qUANTITY;
	}

	
}
