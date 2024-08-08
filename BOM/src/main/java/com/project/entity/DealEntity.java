package com.project.entity;


import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
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

    // JPA 기술 사용하기! => Id 어노테이션을 필수적으로 가지고 있어야 한다!
    // 게시판의 컬럼 : 글번호(pk), 제목, 작성자, 내용, 파일, 등록된 시간, 조회수

  
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO, generator="b_idx")
    private Double b_idx;
    
    @Column(length = 100, nullable = false)
    private String category;
    
    @Column(length = 100, nullable = false)
    private String b_title;

    @Column(length = 100, nullable = false)
    private String id;

    @Column(length = 1000, nullable = false)
    private String b_content;

    @Column(columnDefinition = "int default 0 ", insertable = false, name="b_view")
    private Integer count;
    
    public void incrementView() {
    	this.count++;
    }
    
    
    @Column(length =10, nullable=false)
    private String deal_status;
    
    @Column(length = 100)
    private String b_file;
    
    private LocalDateTime modifiedCreated_at;
    
    @Column(columnDefinition = "datetime default now()", insertable = false, updatable = false)
    private Date created_at;
    
    public Double getBIdx() {
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

    public String getBFile() {
        return b_file;
    }

    public void setBFile(String bFile) {
        this.b_file = b_file;
    }

    public Date getCreatedAt() {
        return created_at;
    }

    public void setCreatedAt() {
        this.created_at = created_at;
    }

    public Integer getBView() {
        return count;
    }

    public void setBView(Integer bView) {
        this.count = count;
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

    public void setDealStatus(String dealStatus) {
        this.deal_status = deal_status;
    }


    
    @ElementCollection
    private List<String> filenames = new ArrayList<>();
    
    // used_product_info 모델 복사
    public void DealEntity(DealEntity param)
    {
        this.b_idx = param.getBIdx();
        this.category = param.getCategory();
        this.b_title = param.getBTitle();
        this.b_content = param.getBContent();
        this.b_file = param.getBFile();
        this.created_at = param.getCreatedAt();
        this.count = param.getBView();
        this.id = param.getId();
        this.deal_status = param.getDealStatus();
    }
}