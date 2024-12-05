package com.energyzo.javaproject.model.vo;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EstateImgDTO {

	private Integer pic_num;	// 사진번호
	private Integer est_id;		// 부동산정보
	
	private String fname;		// 1번 파일 파일명(실제)
	private String realfname; 	// 1번 파일 파일명(암호화하여 저장할 이름)
	
	
}