package com.project.repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.project.entity.DealEntity;


@Repository
public interface DealRepository extends JpaRepository<DealEntity, Long> {

	
	
	
	
	/*
	 * List<DealEntity>
	 * findByB_viewsAndB_titleAndCreated_atAndHow_muchAndFiles(Integer b_views,
	 * String b_title, Date created_at, Long how_much,List<String> filenames);
	 */


	
	// spring boot에서는 sql문장을 지양한다!
	// JPA를 사용하여 자바언어로 구성된 sql 실행 메소드 사용!
	
	@Query("SELECT d FROM DealEntity d ORDER BY d.b_idx DESC")
	List<DealEntity> findAllOrderByBIdxDesc();

		
}
	
	
	

