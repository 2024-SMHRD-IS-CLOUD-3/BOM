package com.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.project.entity.CarEntity;
import com.project.entity.DealEntity;

@Repository
public interface CarRepository extends JpaRepository<CarEntity, Long> {


	
	@Query("SELECT d FROM CarEntity d ORDER BY d.car_idx DESC")
	List<CarEntity> findAllOrderByCarIdxDesc();

}