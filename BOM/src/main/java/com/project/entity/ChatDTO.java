package com.project.entity;

public class ChatDTO {	
		// Table 생성 --> DTO를 만들자
		
		// DTO는 Table 과 같은 모양을 가져야 함
		// --> Table에 있는 컬럼과 DTO에 선언된 변수가 같아야함 
		
		private String id;
		private String chat;
		private String indate;
		
		// DTO는 "기본" 생성자가 있어야 함! 따로 선언 안함!
		
		// getter / setter 
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getChat() {
			return chat;
		}
		public void setChat(String chat) {
			this.chat = chat;
		}
		public String getIndate() {
			return indate;
		}
		public void setIndate(String indate) {
			this.indate = indate;
		}		

	}