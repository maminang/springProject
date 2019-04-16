package kr.ca.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String checkOut(HttpSession session) {
		OrderDTO order = new OrderDTO();
		try {
			Object oLogin = session.getAttribute("login");

			// 회원 주문
			if (oLogin != null) {
				LoginDTO login = (LoginDTO) oLogin;
				order.setId(login.getId());
				setMemberOrder(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("order", order);

		return "order/checkout";
	}

	private void setMemberOrder(OrderDTO order) {
		List<OrderDetailDTO> detailList = service.getDetailList(order.getId());
		order.setDetailList(detailList);
		service.setOrderMemberInfo(order);
	}

	@RequestMapping("review")
	public String review(String shipping_memo, HttpSession session) {
		Object oOrder = session.getAttribute("order");
		OrderDTO order = (OrderDTO) oOrder;

		if (shipping_memo != null) {
			order.setShipping_memo(shipping_memo);
		}
		session.setAttribute("order", order);

		return "order/review";
	}

	@RequestMapping("payment")
	public String payment(HttpSession session, Model model) {
		Object oOrder = session.getAttribute("order");
		OrderDTO order = (OrderDTO) oOrder;
		MemberDTO mdto = service.getPoint(order.getId());
		model.addAttribute("point", mdto.getPoint());
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

		service.complete(order, order.getId());

		return "redirect:/order/list";
	}

	@RequestMapping("list")
	public void list(HttpSession session, Model model) {
		Object oLogin = session.getAttribute("login");
		LoginDTO login = (LoginDTO) oLogin;

		List<OrderDTO> list = service.list(login.getId());
		model.addAttribute("list", list);
	}

	@RequestMapping("readOrder")
	public void readOrder(Model model ,int ono) {
		OrderDTO order = service.readOrder(ono);
		model.addAttribute("order", order);
	}
}
