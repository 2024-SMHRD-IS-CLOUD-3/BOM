package com.project.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "chat_info")
public class ChatEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long chat_idx;
	private Long croom_idx;
	private String chatter;
	private String chat;
	private String emoticon;
	private java.util.Date created_at;
	
}
