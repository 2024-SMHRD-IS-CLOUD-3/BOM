package com.project.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.project.converter.StringListConverter;

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
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(length = 100)
    private Long b_idx;

    @Column(length = 100, nullable = false)
    private String category;

    @Column(length = 100, nullable = false)
    private String b_title;

    @Column(length = 100, nullable = false)
    private String id;

    @Column(length = 1000)
    private String b_content;

    @Column(columnDefinition = "int default 0", insertable = false, nullable = false)
    private Integer b_views = 0;

    public void incrementView() {
        this.b_views++;
    }

    @Column(length = 10, nullable = false)
    private String deal_status = "판매중";


    @Column(name = "b_file")
    private String filenames;

    @Column(columnDefinition = "datetime default now()", insertable = false, updatable = false)
    private Date created_at;

    @Column(length = 100, nullable = false)
    private Long how_much;







   public DealEntity(Long resultidx, String resultb_title, String resultb_content, Integer resultb_views,
         String resultcategory, Date resultcreated_at, String resultdeal_status, String resultfilenames,
         Long resulthow_much, String resultid) {
   }


}
