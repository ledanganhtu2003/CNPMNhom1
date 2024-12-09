package me.thlshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Entity
@Table(name = "order_details")
@Setter
@Getter
public class OrderDetailEntity implements Serializable {

	@Id
	@Column(name = "order_detail_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderDetailId;
	
	@ManyToOne
	@JoinColumn(name = "order_id")
	@JsonIgnore
	private OrderEntity orderId;
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	@JsonIgnore
	private ProductEntity productId;
	
	@Column(name="price")
	private Long price;
	
	@Column(name="quantity")
	private Integer quantity;
	
}
