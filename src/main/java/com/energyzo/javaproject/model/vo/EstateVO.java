package com.energyzo.javaproject.model.vo;

import java.io.File;
import java.util.Arrays;
import java.util.Date;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EstateVO {

    private Integer est_id;           	// 상품번호 		- 사용 o
    private Integer agent_num;        	// 중개인 번호 	- 사용 o
    private Date 	est_reg_date;    	// 등록일 		- 사용 o
    private Date 	est_tra_com_date; 	// 거래완료일 		- 사용 o
    private String 	est_type;      		// 부동산 유형 	- 사용 o
    private String 	est_tra_type;  		// 거래유형 		- 사용 o
    private Integer est_tra_cond;     	// 가격(보증금)	- 사용 o
    private Integer est_monthpay;     	// 월세
    private Integer est_manage;       	// 관리비
    private String 	est_addr;      		// 주소 			- 사용 o
    private String 	est_lati;      		// 위도
    private String 	est_longi;     		// 경도
    private String 	est_direc;     		// 방향
    private String 	est_usage;     		// 용도
    private Integer est_m_area;       	// 관리면적 		- 사용 o
    private Integer est_t_area;       	// 총면적
    private Integer est_t_floor;      	// 총층
    private Integer est_m_floor;      	// 관리층 		- 사용 o
    private Integer est_elev_num;     	// 엘리베이터 수
    private Integer est_room_num;     	// 방 수
    private Integer est_bath_num;     	// 욕실 수
    private Integer est_gara_num;     	// 주차공간 수
    private Date 	est_gumsa;       	// 검사일자
    private Date 	est_sungin;      	// 성인날짜
    private Integer est_jungong;     	// 준공일자 		- 사용 o	
	
    
    // 태그관련
    private String tagArray;			// 태그 정보를 저장, 공백으로 구분
    
    
    // 이미지 파일처리 관련****************************************************
    private String rootPath;			// 현재 실행중인 프로젝트의 경로
    
    private String 	fname1;				// 1번 파일 파일명(실제)
    private String 	fname2;				// 2번 파일 파일명(실제)
    private String 	fname3;				// 3번 파일 파일명(실제)
    private String 	fname4;				// 4번 파일 파일명(실제)
    private String 	fname5;				// 5번 파일 파일명(실제)
    private String 	fname6;				// 6번 파일 파일명(실제)
    
	private String 	realfname1; 		// 1번 파일 파일명(암호화하여 저장할 이름)
	private String 	realfname2; 		// 2번 파일 파일명(암호화하여 저장할 이름)
	private String 	realfname3; 		// 3번 파일 파일명(암호화하여 저장할 이름)
	private String 	realfname4; 		// 4번 파일 파일명(암호화하여 저장할 이름)
	private String 	realfname5; 		// 5번 파일 파일명(암호화하여 저장할 이름)
	private String 	realfname6; 		// 6번 파일 파일명(암호화하여 저장할 이름)
	
	private MultipartFile file1;		// 1번 파일
	private MultipartFile file2;		// 2번 파일
	private MultipartFile file3;		// 3번 파일
	private MultipartFile file4;		// 4번 파일
	private MultipartFile file5;		// 5번 파일
	private MultipartFile file6;		// 6번 파일
	
	public void setRootPath(String rootPath) {
		this.rootPath = rootPath.substring(0, rootPath.indexOf("."))+"Energyzo-Project_copy";
	}
	
	public void setFile1(MultipartFile file) {
		this.file1 = file;
		
		if(!file.isEmpty()) {
			this.fname1 = file.getOriginalFilename();
			String fileType = this.fname1.substring(this.fname1.indexOf("."));
			
			UUID uuid = UUID.randomUUID();
			this.realfname1 = uuid.toString() + fileType;
			
			File f = new File(rootPath+"\\src\\main\\webapp\\resources\\static\\upload\\"+realfname1);
			
			try {
				file.transferTo(f);
			} catch (Exception e) {
				System.out.println("파일 업로드 실패");
				e.printStackTrace();
			}
			
		}
	}
	public void setFile2(MultipartFile file) {
		this.file2 = file;
		
		if(!file.isEmpty()) {
			this.fname2 = file.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			this.realfname2 = uuid.toString();
			
			File f = new File(rootPath+"\\src\\main\\webapp\\resources\\static\\upload\\"+realfname2);
			
			try {
				file.transferTo(f);
			} catch (Exception e) {
				System.out.println("파일 업로드 실패");
				e.printStackTrace();
			}
			
		}
	}
	public void setFile3(MultipartFile file) {
		this.file3 = file;
		
		if(!file.isEmpty()) {
			this.fname3 = file.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			this.realfname3 = uuid.toString();
			
			File f = new File(rootPath+"\\src\\main\\webapp\\resources\\static\\upload\\"+realfname3);
			
			try {
				file.transferTo(f);
			} catch (Exception e) {
				System.out.println("파일 업로드 실패");
				e.printStackTrace();
			}
			
		}
	}
	public void setFile4(MultipartFile file) {
		this.file4 = file;
		
		if(!file.isEmpty()) {
			this.fname4 = file.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			this.realfname4 = uuid.toString();
			
			File f = new File(rootPath+"\\src\\main\\webapp\\resources\\static\\upload\\"+realfname4);
			
			try {
				file.transferTo(f);
			} catch (Exception e) {
				System.out.println("파일 업로드 실패");
				e.printStackTrace();
			}
			
		}
	}
	public void setFile5(MultipartFile file) {
		this.file5 = file;
		
		if(!file.isEmpty()) {
			this.fname5 = file.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			this.realfname5 = uuid.toString();
			
			File f = new File(rootPath+"\\src\\main\\webapp\\resources\\static\\upload\\"+realfname5);
			
			try {
				file.transferTo(f);
			} catch (Exception e) {
				System.out.println("파일 업로드 실패");
				e.printStackTrace();
			}
			
		}
	}
	public void setFile6(MultipartFile file) {
		this.file6 = file;
		
		if(!file.isEmpty()) {
			this.fname6 = file.getOriginalFilename();
			
			UUID uuid = UUID.randomUUID();
			this.realfname6 = uuid.toString();
			
			File f = new File(rootPath+"\\src\\main\\webapp\\resources\\static\\upload\\"+realfname6);
			
			try {
				file.transferTo(f);
			} catch (Exception e) {
				System.out.println("파일 업로드 실패");
				e.printStackTrace();
			}
			
		}
	}
}
