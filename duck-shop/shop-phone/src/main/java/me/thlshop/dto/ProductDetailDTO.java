package me.thlshop.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDetailDTO {
	private Integer productId;
	private String productName;
	private Integer categoryId;
	private Integer infoId;
	private String description;
	private Long price;
	private String screen;
	private String camera;
	private String cameraSelfie;
	private String ram;
	private String cpu;
	private String memory;
	private String gpu;
	private String cell;
	private String sim;
	private String os;
	private String imageBig;
	private String imageSmall;
}
