package com.imbling.repository;

import com.imbling.dto.AdminProductDto;
import com.imbling.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;


public interface AdminProductRepository extends JpaRepository<ProductEntity,  Integer> {

//  @Transactional
//  @Modifying
//  @Query(value = "UPDATE imb_property d set d. boardCount = d.boardCount + 1 WHERE b.boardNo = :boardNo", nativeQuery = true)
//  void increaseBoardCount(int boardNo);
	
	
//	// 상품 삭제
//	@Transactional
//	@Modifying
//	@Query(value="delete from imb_product where (productNo=:productNo and categoryNo=:categoryNo and propertyNo=:propertyNo)", nativeQuery = true)
//	static
//	void deleteByProductNo(@Param("productNo") int productNo, @Param("categoryNo") int categoryNo, @Param("propertyNo") int propertyNo) {
//		// TODO Auto-generated method stub
	
		
	
}