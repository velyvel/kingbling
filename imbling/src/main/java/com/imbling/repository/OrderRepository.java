package com.imbling.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.imbling.entity.OrderEntity;
import com.imbling.entity.SalesChartData;

public interface OrderRepository extends JpaRepository<OrderEntity, Integer	>{

	@Query(value="select hibernate_sequence.currval from dual", nativeQuery = true)
	int findRecentOrderNo();

	List<OrderEntity> findAllByUserId(String userId);

	@Query(value="select x.* from (select to_char(l.orderDate,'yyyy-mm-dd') orderDate, sum(d.orderDetailTotalPrice) orderPrice from imb_order l Inner Join imb_orderDetail d on l.orderNo = d.orderNo group by to_char(l.orderDate,'yyyy-mm-dd') order By orderDate) x where rownum<8", nativeQuery = true)
	List<SalesChartData> findSalesData();


}
