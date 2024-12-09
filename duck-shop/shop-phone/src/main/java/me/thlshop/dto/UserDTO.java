package me.thlshop.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserDTO {

	private Integer userId;
	private String password;
	private String fullName;
	private String email;
	private String phone;
	private String address;
	private Integer roleId;

}

