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
    private String deal_status = "판매중";

    @ElementCollection
    @Column(name = "b_file")
    private List<String> filenames = new ArrayList<>();

    @Column(columnDefinition = "datetime default now()", insertable = false, updatable = false)
    private Date created_at;

    @Column(length = 100, nullable = false)
    private Long how_much;

    public void copyFrom(DealEntity param) {
        this.category = param.getCategory();
        this.b_title = param.getB_title();
        this.b_content = param.getB_content();
        this.filenames = param.getFilenames();
        this.created_at = param.getCreated_at();
        this.b_views = param.getB_views();
        this.id = param.getId();
        this.deal_status = param.getDeal_status();
        this.how_much = param.getHow_much();
    }
}
