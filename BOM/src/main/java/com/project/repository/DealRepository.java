package com.project.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.project.entity.DealEntity;


@Repository
public interface DealRepository extends JpaRepository<DealEntity, Long> {

	
	
	

	


	
	// spring boot에서는 sql문장을 지양한다!
	// JPA를 사용하여 자바언어로 구성된 sql 실행 메소드 사용!
	

	    @Modifying
	    @Query("UPDATE DealEntity b SET b.count = b.count + 1 WHERE b.id = :id")
	    void incrementcount(@Param("id") Long id);
	}
	
	
	
