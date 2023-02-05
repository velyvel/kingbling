package com.imbling.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imbling.dto.CartDto;
import com.imbling.dto.OrderDetailDto;
import com.imbling.dto.OrderDto;
import com.imbling.dto.ProductDto;
import com.imbling.dto.PropertyDto;
import com.imbling.entity.AccountDtoEntity;
import com.imbling.entity.CartEntity;
import com.imbling.entity.OrderDetailEntity;
import com.imbling.entity.OrderEntity;
import com.imbling.entity.ProductEntity;
import com.imbling.entity.PropertyEntity;
import com.imbling.entity.SalesChartData;
import com.imbling.repository.AccountRepository;
import com.imbling.repository.CartRepository;
import com.imbling.repository.OrderDetailRepository;
import com.imbling.repository.OrderRepository;
import com.imbling.repository.PropertyRepository;
import com.imbling.repository.UserProductRepository;

@Service("userOrderService")
public class UserOrderServiceImpl implements UserOrderService{
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private UserProductRepository userProductRepository;
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private PropertyRepository propertyRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	
	@Override
	public ProductDto getProductInfo(int productNo) {
		
		ProductEntity product = userProductRepository.findByProductNo(productNo);
		return productEntityToDto(product);
	}

	@Override
	public int getPropertyNo(int productNo) {
		int propertyNo = userProductRepository.findPropertyNo(productNo);
		return propertyNo;
	}
	
	@Override
	public void addProductToCart(CartDto cart) {
		
		AccountDtoEntity userEntity = accountRepository.findByUserId(cart.getUserId());
		PropertyEntity propertyEntity = propertyRepository.findById(cart.getPropertyNo()).orElse(null);
		
		CartEntity cartEntity = CartEntity.builder().cartEA(cart.getCartEA()).cartTotalPrice(cart.getCartTotalPrice())
								.cartChk(cart.isCartChk()).user(userEntity).property(propertyEntity).build();
		
		cartRepository.save(cartEntity);
		
	}

	@Override
	public void deleteFromCart(String userId, int propertyNo) {
		cartRepository.deleteById(userId,propertyNo);
	}

	@Override
	public void updateCartInfo(CartDto cart) {
		
		CartEntity updatedCart=cartRepository.findByKeys(cart.getUserId(),cart.getPropertyNo());
		updatedCart.setCartEA(cart.getCartEA());
		updatedCart.setCartTotalPrice(cart.getCartTotalPrice());
		
		cartRepository.save(updatedCart);
		
	}

	@Override
	public void insertCartOrderInfo(OrderDto order) {

		OrderEntity orderEntity = orderDtoToEntity(order);
		
		List<CartEntity> cartEntity = cartRepository.findAllByUserId(order.getUserId());
		HashSet<OrderDetailEntity> orderDetailEntity = new HashSet<>();
		for(CartEntity cart : cartEntity ) {
			PropertyEntity propertyEntity = propertyRepository.findById(cart.getProperty().getPropertyNo()).orElse(null);
			OrderDetailEntity orderDetail = new OrderDetailEntity();
			orderDetail.setOrderDetailEA(cart.getCartEA());
			orderDetail.setOrderDetailTotalPrice(cart.getCartTotalPrice());
			orderDetail.setOrder(orderEntity);
			orderDetail.setProperty(propertyEntity);
			orderDetailEntity.add(orderDetail);
		}
		orderEntity.setOrderDate(new Date());
		orderEntity.setOrderState("주문완료");
		orderEntity.setOrderDetails(orderDetailEntity);
		
		for(OrderDetailEntity od : orderDetailEntity) {
			PropertyEntity property = propertyRepository.findById(od.getProperty().getPropertyNo()).orElse(null);
			property.setProductEA(property.getProductEA()-od.getOrderDetailEA());
			propertyRepository.save(property);
		}
		orderRepository.save(orderEntity);
		int orderNo = orderRepository.findRecentOrderNo();
		for(OrderDetailEntity o : orderEntity.getOrderDetails()) {
			o.getOrder().setOrderNo(orderNo);
			orderDetailRepository.save(o);////////////ㅇㅅㅠ
		}
		
		cartRepository.deleteAllById(order.getUserId());
	}

	@Override
	public void updateCartChk(CartDto cart) {
		CartEntity updatedCart=cartRepository.findByKeys(cart.getUserId(),cart.getPropertyNo());
		updatedCart.setCartChk(updatedCart.isCartChk()? false : true);
		
		cartRepository.save(updatedCart);
	}

	@Override
	public List<CartDto> getCheckedCartInfo(String userId) {
		List<CartEntity> carts = cartRepository.findCheckedByUserId(userId);
		List<CartDto> cartDtos = new ArrayList<>();
		for(CartEntity cart : carts) {
			CartDto cartDto = new CartDto();
			cartDto.setCartChk(cart.isCartChk());
			cartDto.setCartEA(cart.getCartEA());
			cartDto.setCartRegDate(cart.getCartRegDate());
			cartDto.setCartTotalPrice(cart.getCartTotalPrice());
			cartDto.setProperty(propertyEntityToDto(propertyRepository.findById(cart.getProperty().getPropertyNo()).orElse(null)));
			cartDto.setProduct(productEntityToDto(userProductRepository.findById(
					userProductRepository.findProductNo(cartDto.getProperty().getPropertyNo())
					).orElse(null)));
			
			cartDtos.add(cartDto);
		}
		return cartDtos;
	}

	@Override
	public void deleteCheckedFromCart(String userId) {
		cartRepository.deleteCheckedById(userId);
		
	}

	@Override
	public void insertcheckedCartOrderInfo(OrderDto order) {

		OrderEntity orderEntity = orderDtoToEntity(order);
		
		List<CartEntity> cartEntity = cartRepository.findCheckedByUserId(order.getUserId());
		HashSet<OrderDetailEntity> orderDetailEntity = new HashSet<>();
		for(CartEntity cart : cartEntity ) {
			PropertyEntity propertyEntity = propertyRepository.findById(cart.getProperty().getPropertyNo()).orElse(null);
			OrderDetailEntity orderDetail = new OrderDetailEntity();
			orderDetail.setOrderDetailEA(cart.getCartEA());
			orderDetail.setOrderDetailTotalPrice(cart.getCartTotalPrice());
			orderDetail.setOrder(orderEntity);
			orderDetail.setProperty(propertyEntity);
			orderDetailEntity.add(orderDetail);
		}
		orderEntity.setOrderDate(new Date());
		orderEntity.setOrderState("주문완료");
		orderEntity.setOrderDetails(orderDetailEntity);
		
		for(OrderDetailEntity od : orderDetailEntity) {
			PropertyEntity property = propertyRepository.findById(od.getProperty().getPropertyNo()).orElse(null);
			property.setProductEA(property.getProductEA()-od.getOrderDetailEA());
			propertyRepository.save(property);
		}
		orderRepository.save(orderEntity);
		int orderNo = orderRepository.findRecentOrderNo();
		for(OrderDetailEntity o : orderEntity.getOrderDetails()) {
			o.getOrder().setOrderNo(orderNo);
			orderDetailRepository.save(o);
		}
		cartRepository.deleteCheckedById(order.getUserId());
	}

	@Override
	public List<OrderDto> getUserOrderList(String userId) {
		
		List<OrderEntity> orderEntities = orderRepository.findAllByUserId(userId);
		//오더리스트+오더 디테일들 조회함
		//오더 한건 마다 
		List<OrderDto> orders = new ArrayList<>();
		List<OrderDetailDto> orderDetails = new ArrayList<>();
		for(OrderEntity orderEntity : orderEntities) {
			OrderDto orderDto = new OrderDto();
			orderDto = orderEntityToDto(orderEntity);
			for(OrderDetailEntity od : orderEntity.getOrderDetails()) {
				OrderDetailDto odd = new OrderDetailDto();
				odd.setOrderDetailEA(od.getOrderDetailEA());
				odd.setOrderDetailTotalPrice(od.getOrderDetailTotalPrice());
				odd.setOrderNo(od.getOrder().getOrderNo());
				odd.setPropertyNo(od.getProperty().getPropertyNo());
				orderDetails.add(odd);
				orderDto.setOrders(orderDetails);
			}
			orders.add(orderDto);
			
		}
		return orders;
	}

	@Override
	public OrderDto getOrderInfo(int orderNo) {
		OrderEntity orderentity = orderRepository.findById(orderNo).orElse(null);
		OrderDto order = orderEntityToDto(orderentity);
		List<OrderDetailDto> ods = new ArrayList<>(); 
		for(OrderDetailEntity oe : orderentity.getOrderDetails()) {
			OrderDetailDto odd = new OrderDetailDto();
			odd = orderDetailEntityToDto(oe);
			odd.setProductName(oe.getProperty().getProduct().getProductName());
			ods.add(odd);
		}
		order.setOrders(ods);
		
		return order;
	}

	@Override
	public void cancelOrder(int orderNo) {
		OrderEntity order = orderRepository.findById(orderNo).orElse(null);
		order.setOrderState("주문취소");
		orderRepository.save(order);
		for(OrderDetailEntity ode : order.getOrderDetails()) {
			PropertyEntity property = propertyRepository.findById(ode.getProperty().getPropertyNo()).orElse(null);
			property.setProductEA(property.getProductEA()+ode.getOrderDetailEA());
			propertyRepository.save(property);
		}
	}

	@Override
	public void updateOrderInfo(OrderDto order) {
		OrderEntity orderEntity = orderRepository.findById(order.getOrderNo()).orElse(null);
		orderEntity.setOrderAddr(order.getOrderAddr());
		orderEntity.setOrderDeliveryRequire(order.getOrderDeliveryRequire());
		orderRepository.save(orderEntity);
		
	}

	public PropertyDto getPropertyInfoByProductNo(int productNo,String productSize,String productColor) {
		PropertyEntity propertyEntity = propertyRepository.findPropertyByOptions(productNo,productSize,productColor);
		return propertyEntityToDto(propertyEntity);
	}

	@Override
	public void insertOrder(OrderDto order, OrderDetailDto orderDetail) {
		
		List<OrderDetailEntity> ode = new ArrayList<>();
		ode.add(orderDetailDtoToEntity(orderDetail));
		OrderEntity orderEntity = orderDtoToEntity(order);
		orderEntity.setOrderDetails(ode);
		orderEntity.setOrderDate(new Date());
		orderEntity.setOrderState("주문완료");
		orderRepository.save(orderEntity);
		int orderNo = orderRepository.findRecentOrderNo();
		for(OrderDetailEntity o : ode) {
			o.getOrder().setOrderNo(orderNo);
			orderDetailRepository.save(o);
		}
		
		PropertyEntity property = propertyRepository.findById(orderDetail.getPropertyNo()).orElse(null); 
		property.setProductEA(property.getProductEA()-orderDetail.getOrderDetailEA());
		propertyRepository.save(property);
	}


	

	
	
	
	
	
	
	
	

}
