package kr.ca.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ca.domain.OrderDTO;
import kr.ca.service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {
	@Inject
	private OrderService service;

	@RequestMapping("checkout")
	public String checkOut(Model model, String id, HttpServletRequest request) {
		
		try {
			// 회원 주문
			if (request.getSession().getAttribute("login") != null) {
				OrderDTO order = getMemberOrder();
			} 
			// 비회원 주문(미구현!)
			else {
				getNonMemberOrder();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "checkout";
	}
	
	private OrderDTO getMemberOrder() {
		OrderDTO order = null;
		
		return order;
	}
	private OrderDTO getNonMemberOrder() {
		OrderDTO order = null;
		//getcookies로 쿠키받아서 shorppingcartdtoList를 만들고 넣어주면 됨
		return order;
	}
}
