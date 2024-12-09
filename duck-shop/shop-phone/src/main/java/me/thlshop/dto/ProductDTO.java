package me.thlshop.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProductDTO {
	private Integer productId;
	private String productName;
	private Integer categoryId;
	private String imageSmall;
	private String imageBig;
	private Integer infoId;
	private String description;
	private Long price;
}
