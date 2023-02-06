package com.imbling.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.imbling.entity.BoardEntity;
import com.imbling.entity.ReviewEntity;
import com.imbling.entity.SalesChartData;

public interface MypageRepository extends JpaRepository<BoardEntity, ReviewEntity> {
	
	@Query(value = "SELECT * FROM imb_board WHERE (boardCategory=3 AND userId= :userId AND ROWNUM<6 ) ORDER BY boardRegDate DESC", nativeQuery = true)
	List<BoardEntity> findSomeByIdAndCategory(@Param("userId") String userId);

	@Query(value = "SELECT * FROM imb_board WHERE (boardCategory=3 AND userId= :userId) ORDER BY boardRegDate DESC", nativeQuery = true)
	List<BoardEntity> findAllByIdAndCategory(@Param("userId") String userId);

	@Query(value = "SELECT * FROM imb_review WHERE (userId= :userId AND ROWNUM<6 ) ORDER BY reviewRegDate DESC", nativeQuery = true)
	List<ReviewEntity> findSomeById(@Param("userId") String userId);

	@Query(value = "SELECT * FROM imb_review WHERE userId= :userId ORDER BY reviewRegDate DESC", nativeQuery = true)
	List<ReviewEntity> findAllById(@Param("userId") String userId);

	@Query(value = "select COUNT(*) from imb_user where usertype!='admin' ", nativeQuery = true)
	int findUserAmount();

	@Query(value = "select COUNT(*) from imb_product ", nativeQuery = true)
	int findProductAmount();

	@Query(value = "select COUNT(*) from imb_order where orderState='주문완료' ", nativeQuery = true)
	int findUnPreparedOrder();

	@Query(value = "select (select count(boardNo) from imb_board where boardcategory=3)-(select count(b.boardNo) from imb_board b inner join imb_comment c on b.boardNo = c.boardNo where b.boardcategory=3) a from imb_board  where rownum=1", nativeQuery = true)
	int findNeedReply();

	@Query(value = "select (select COUNT(*) from imb_user where userType = 'basic') orderDate, (select COUNT(*) from imb_user where userType = 'deniedDoc') OrderPrice from imb_user where rownum=1", nativeQuery = true)
	SalesChartData findValidUserData();

	@Query(value = "select (select count(*) from imb_user where userType = 'basic') orderDate, (select COUNT(DISTINCT userid) from imb_order) OrderPrice from dual", nativeQuery = true)
	SalesChartData findPurchaseData();

	@Query(value = "select (select count(*) from imb_product)orderDate, (select count(DISTINCT productNo) from imb_property where propertyNo in (select DISTINCT propertyNo from imb_orderDetail)) OrderPrice from dual", nativeQuery = true)
	SalesChartData findOrderData();
	
}


