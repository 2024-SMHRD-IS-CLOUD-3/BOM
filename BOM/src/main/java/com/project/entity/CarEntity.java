package com.project.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="baby_car_info")
public class CarEntity {
	//글식별자
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long car_idx ;
	
	// 글내용
	private String car_content;
	
	// 글 사진
	private String car_file;
	
	// 글 생성일자
	private java.util.Date card_at;
	
	
	// 작성자 id
	private String id;
	
	 
	// 수리진행척도
	private String car_cours;
	
	// 글 제목
	private String car_title;
	
	// 유모차 상태
	private String car_rank;
	
	// 유모차 가격
	private Long car_price;

	public Long getCar_idx() {
		return car_idx;
	}

	public void setCar_idx(Long car_idx) {
		this.car_idx = car_idx;
	}

	public String getCar_content() {
		return car_content;
	}

	public void setCar_content(String car_content) {
		this.car_content = car_content;
	}

	public String getCar_file() {
		return car_file;
	}

	public void setCar_file(String car_file) {
		this.car_file = car_file;
	}

	public java.util.Date getCard_at() {
		return card_at;
	}

	public void setCard_at(java.util.Date card_at) {
		this.card_at = card_at;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCar_cours() {
		return car_cours;
	}

	public void setCar_cours(String car_cours) {
		this.car_cours = car_cours;
	}

	public String getCar_title() {
		return car_title;
	}

	public void setCar_title(String car_title) {
		this.car_title = car_title;
	}

	public String getCar_rank() {
		return car_rank;
	}

	public void setCar_rank(String car_rank) {
		this.car_rank = car_rank;
	}

	public Long getCar_price() {
		return car_price;
	}

	public void setCar_price(Long car_price) {
		this.car_price = car_price;
	}

	
	}
	
	


