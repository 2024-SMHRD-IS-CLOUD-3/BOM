package com.project.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "chat_info")
public class ChatEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "chat_idx")
	private Long chatIdx;
	
	private Long croom_idx;
	private String chatter;
	private String chat;
	private String emoticon;
	private java.time.LocalDateTime created_at;
	
}
