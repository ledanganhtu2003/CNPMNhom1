package me.thlshop.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="information")
@Setter
@Getter
public class InformationEntity implements Serializable {

	@Id
	@Column(name="info_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer infoId;
	
	@Column(name="screen")
	private String screen;
	
	@Column(name="camera_selfie")
	private String cameraSelfie;
	
	@Column(name="ram")
	private String ram;
	
	@Column(name="camera")
	private String camera;
	
	@Column(name="cpu")
	private String cpu;
	
	@Column(name="memory")
	private String memory;
	
	@Column(name="gpu")
	private String gpu;
	
	@Column(name="cell")
	private String cell;
	
	@Column(name="sim")
	private String sim;
	
	@Column(name="os")
	private String os;

}
