package com.project.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
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
@Table(name = "used_product_info")
public class DealEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "b_idx")
	@Column(length = 100, nullable = false)
	private Long b_idx;

	@Column(length = 100, nullable = false)
	private String category;

	@Column(length = 100, nullable = false)
	private String b_title = " ";

	@Column(length = 100, nullable = false)
	private String id = "";

	@Column(length = 1000)
	private String b_content = " ";

	@Column(columnDefinition = "int default 0", insertable = false, nullable = false)
	private Integer b_views = 0;

	public void incrementView() {
		this.b_views++;
	}

	@Column(length = 10, nullable = false)
	private String deal_status;

	@ElementCollection
	@Column(name = "b_file")
	private List<String> filenames = new ArrayList<>();

	@Column(columnDefinition = "datetime default now()", insertable = false, updatable = false)
	private Date created_at;

	@Column(length = 100, nullable = false)
	private Long how_much;

	public Long getBIdx() {
		return b_idx;
	}

	public void setBIdx(Double bIdx) {
		this.b_idx = b_idx;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBTitle() {
		return b_title;
	}

	public void setBTitle(String bTitle) {
		this.b_title = b_title;
	}

	public String getBContent() {
		return b_content;
	}

	public void setBContent(String bContent) {
		this.b_content = b_content;
	}

	public List<String> getFilenames() {
		return filenames;
	}

	public void setFilenames(ArrayList<String> filenames) {
		this.filenames = filenames;
	}

	public Date getCreatedAt() {
		return created_at;
	}

	public void setCreatedAt(Date created_at) {
		this.created_at = created_at;
	}

	public Integer getBViews() {
		return b_views;
	}

	public void setBViews(Integer b_views) {
		this.b_views = b_views;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDealStatus() {
		return deal_status;
	}

	public void setDealStatus(String deal_status) {
		this.deal_status = deal_status;
	}

	public Long getHowMuch() {
		return how_much;
	}

	public void setHowMuch(Long how_much) {
		this.how_much = how_much;
	}

	// used_product_info 모델 복사
	public void DealEntity(DealEntity param) {
		this.category = param.getCategory();
		this.b_title = param.getBTitle();
		this.b_content = param.getBContent();
		this.filenames = param.getFilenames();
		this.created_at = param.getCreatedAt();
		this.b_views = param.getBViews();
		this.id = param.getId();
		this.deal_status = param.getDealStatus();
		this.how_much = param.getHowMuch();
	}
}
