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
@Table(name="community_info")
public class CommEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cb_idx;
	
	private String cb_title;
	
	private String cb_content;
	
	private String cb_file;
	
	private java.sql.Date created_at;
	
	@Column(columnDefinition = "int default 0")
	private Integer cb_views;
	
	private String id;
	
}
