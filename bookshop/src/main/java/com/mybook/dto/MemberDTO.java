package com.mybook.dto;

import java.util.List;
import lombok.Data;

@Data
public class MemberDTO {
	private String userid;
	private String userpw;
	private String username;
	private String useremail;
	private String address1;
	private String address2;
	private String tel;
	private boolean enabled;

	private String regDate;
	private String updateDate;
	private List<AuthDTO> authList;
}
