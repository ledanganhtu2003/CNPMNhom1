package me.thlshop.entity;

import java.io.Serializable;
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

@Entity
@Table(name = "product")
@Setter
@Getter
public class ProductEntity implements Serializable {

	@Id
	@Column(name = "product_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;

	@ManyToOne
	@JoinColumn(name = "category_id")
	@JsonIgnore
	private CategoryEntity category;

	@ManyToOne
	@JoinColumn(name = "info_id")
	@JsonIgnore
	private InformationEntity infoId;

	@Column(name = "product_name")
	private String productName;

	@Column(name="image_small")
	private String imageSmall;

	@Column(name="image_big")
	private String imageBig;

	@Column(name="description")
	private String description;
	
	@Column(name="price")
	private Long price;

}
