package com.energyzo.javaproject.model.vo;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class AgentVO {

	
	  private int agent_num;           // 중개사 번호
	  private String user_id;          // 사용자 ID
	  private String agent_office;     // 중개사무소 이름
	  private int agent_reg_num;       // 중개등록번호
	  private String agent_tel;        // 대표 전화번호
	  private String agent_name;       // 대표명
	  private String agent_addr;       // 중개사무소 주소
	  private int agent_reg_state;     // 등록 상태
	  private String power_date;
	  
	  
	  private String agent_rfname;     // 첨부파일 실제 이름(UPLOAD파일에 저장되는 이름)
	  private String agent_fname;      // 첨부파일 저장 이름(사용자가 넣은 이름)
	  
		private long b_fsize;		// 파일크기

	
		MultipartFile file;
		
		public MultipartFile getFile() {
			return file;
		}	
		
		
		
		public void setFile(MultipartFile file) {
			this.file = file; //멤버변수에다가 넘겨받은 애들을 지정할 거임. 
			
			//업로드 파일 있다면 
			if(!file.isEmpty()) {
				this.agent_fname = file.getOriginalFilename();
				this.b_fsize = file.getSize();
				
				UUID uuid = UUID.randomUUID();
				this.agent_rfname =uuid.toString(); 
				
				System.out.println("------------------------------------------------");
				System.out.println("업로드 파일" + agent_fname + "/" + agent_rfname + "/" + agent_rfname);
			
				//원래 File: 자바에서 파일과 디렉토리를 관리하는 클래스	
				File f = new File("D:\\workspaces\\spring\\Energyzo-Project-MyPage\\src\\main\\webapp\\resources\\upload\\" + agent_rfname);
			
				try {
					file.transferTo(f);
				} catch (Exception e) {
					System.out.println("파일업로드실패");
				}
			}
		}
		
		
		
}
