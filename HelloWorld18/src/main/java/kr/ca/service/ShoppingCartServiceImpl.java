package kr.ca.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ca.dao.ShoppingCartDAO;
import kr.ca.domain.ShoppingCartDTO;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

	@Autowired
	private ShoppingCartDAO dao;

//	장바구니에 담기 insertShoppingCart
	@Override
	public void insertShoppingCart(ShoppingCartDTO dto) {
		dao.insertShoppingCart(dto);
	}

//	장바구니 id로 select
	@Override
	public ShoppingCartDTO selectShoppingCart(ShoppingCartDTO dto) {
		return dao.selectShoppingCart(dto);
	}

//	장바구니 list
	@Override
	public List<ShoppingCartDTO> listShoppingCart(ShoppingCartDTO dto) {

		return dao.listShoppingCart(dto);
	}

//	장바구니 물건 delete
	@Override
	public void deleteShoppingCart(ShoppingCartDTO dto) {

		dao.deleteShoppingCart(dto);
	}

//	장바구니 물건 개수 update
	@Override
	public void updateShoppingCart(ShoppingCartDTO dto) {

		dao.updateShoppingCart(dto);
	}

}