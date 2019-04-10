package kr.ca.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ca.domain.LoginDTO;
import kr.ca.domain.OrderDTO;
import kr.ca.domain.OrderDetailDTO;
import kr.ca.service.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {
	@Inject
	private OrderService service;

	@RequestMapping("checkout")
	public String checkOut(Model model, HttpServletRequest request) {
		OrderDTO order = new OrderDTO();

		try {
			Object oLogin = request.getSession().getAttribute("login");
			// 회원 주문
			if (oLogin != null) {
				LoginDTO login = (LoginDTO) oLogin;
				setMemberOrder(login.getId(), order);
			}
			// 비회원 주문(미구현!)
			else {
				getNonMemberOrder();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("order", order);
		return "checkout";
	}

	private void setMemberOrder(String id, OrderDTO order) {
		List<OrderDetailDTO> detailList = service.getDetailList(id);
		order.setDetailList(detailList);
		service.setOrderMemberInfo(id, order);
	}

	private List<OrderDetailDTO> getNonMemberOrder() {
		List<OrderDetailDTO> detailList = null;
		// getcookies로 쿠키받아서 DetailList를 만들고 넣어주면 됨
		return detailList;
	}
}
