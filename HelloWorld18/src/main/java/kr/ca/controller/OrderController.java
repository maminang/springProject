package kr.ca.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ca.domain.LoginDTO;
import kr.ca.domain.MemberDTO;
import kr.ca.domain.OrderDTO;
import kr.ca.domain.OrderDetailDTO;
import kr.ca.service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {
	@Inject
	private OrderService service;

	@RequestMapping("checkout")
	public String checkOut(HttpServletRequest request) {
		OrderDTO order = new OrderDTO();
		HttpSession session = request.getSession();
		try {
			Object oLogin = session.getAttribute("login");

			// 회원 주문
			if (oLogin != null) {
				LoginDTO login = (LoginDTO) oLogin;
				setMemberOrder(login.getId(), order);
			}
			// 비회원 주문(미구현!)
			else {
				setNonMemberOrder(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("order", order);

		return "order/checkout";
	}

	private void setMemberOrder(String id, OrderDTO order) {
		List<OrderDetailDTO> detailList = service.getDetailList(id);
		order.setDetailList(detailList);
		service.setOrderMemberInfo(id, order);
	}

	private void setNonMemberOrder(OrderDTO order) {
	}

	@RequestMapping("review")
	public String review(String shipping_memo, HttpServletRequest request) {
		HttpSession session = request.getSession();

		Object oOrder = session.getAttribute("order");
		OrderDTO order = (OrderDTO) oOrder;

		if (shipping_memo != null) {
			order.setShipping_memo(shipping_memo);
		}
		session.setAttribute("order", order);

		return "order/review";
	}

	@RequestMapping("payment")
	public String payment(HttpServletRequest request) {
		HttpSession session = request.getSession();

		Object oLogin = session.getAttribute("login");
		if (oLogin != null) {
			LoginDTO login = (LoginDTO) oLogin;
			MemberDTO mdto = service.getPoint(login.getId());
			session.setAttribute("point", mdto.getPoint());
		}

		Object oOrder = session.getAttribute("order");
		OrderDTO order = (OrderDTO) oOrder;
		session.setAttribute("order", order);
		return "order/payment";
	}

	@ResponseBody
	@RequestMapping("checkPoint/{id}/{total_price}")
	public boolean checkPoint(@PathVariable("id") String id, @PathVariable("total_price") int total_price) {
		return service.checkPoint(id, total_price);
	}
	
	@RequestMapping("complete")
	public String complete(HttpSession session) {
		Object oOrder = session.getAttribute("order");
		OrderDTO order = (OrderDTO) oOrder;
		service.complete(order);
		return "";
	}
}
