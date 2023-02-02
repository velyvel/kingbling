package com.imbling.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.imbling.entity.CategoryEntity;
import com.imbling.entity.ProductEntity;

public interface ProductRepository extends JpaRepository<ProductEntity, Long> {

	// 상품리스트
	ProductEntity findByProductNo(int productNo);

	// 인기상품순 정렬
	List<ProductEntity> findByCategoryCategoryNoOrderByProductCountDesc(int categoryNo);

	// 신상품순 정렬
	List<ProductEntity> findByCategoryCategoryNoOrderByProductRegdateDesc(int categoryNo);

	// 낮은가격순 정렬
	List<ProductEntity> findByCategoryCategoryNoOrderByProductPrice(int categoryNo);

	// 높은가격순 정렬
	List<ProductEntity> findByCategoryCategoryNoOrderByProductPriceDesc(int categoryNo);

	// 조회수 증가
	@Transactional
	@Modifying
	@Query(value = "update imb_product set PRODUCTCOUNT = PRODUCTCOUNT + 1 where PRODUCTNO = :productNo", nativeQuery = true)
	int updateProductCount(@Param("productNo") int productNo);

	// 장바구니
	// 장바구니에 넣을 상품 정보 조회
	@Query(value = "select * from imb_product where productNo=( select productNo from imb_property where propertyNo=:propertyNo ) ", nativeQuery = true)
	ProductEntity findByPropertyNo(@Param("propertyNo") int propertyNo);

}
