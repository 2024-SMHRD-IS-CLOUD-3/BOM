package com.project.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.project.entity.CommEntity;

@Repository
public interface CommRepository extends JpaRepository<CommEntity, Integer> {

	@Modifying
    @Query("UPDATE CommEntity cb SET cb.cb_views = cb.cb_views + 1 WHERE cb.id = :id")
    void incrementcount(@Param("id") String id);
	
}
