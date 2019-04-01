package kr.ca.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.CookieGenerator;

import kr.ca.domain.CookieDTO;
import kr.ca.domain.ShoppingCartDTO;
import kr.ca.service.ShoppingCartService;

@Controller
@RequestMapping("shoppingCart")
public class ShoppingCartController {

	@Autowired
	private ShoppingCartService service;

//	장바구니 리스트 쿠키 (비로그인)
	public List<ShoppingCartDTO> listShoppingCartCookie(ShoppingCartDTO dto, HttpServletResponse response) {

		Cookie pno = new Cookie("pno", String.valueOf(dto.getPno()));
//		System.out.println(pno);
		pno.setMaxAge(7 * 24 * 60 * 60);
		pno.setPath("/");

		response.addCookie(pno);

		return null;
	}

	CookieDTO cookieDTO = new CookieDTO(null, null);
	List<CookieDTO> list = new ArrayList<CookieDTO>();

//	장바구니에 담기
	@RequestMapping("/insertShoppingCart")
	public String insertShoppingCart(ShoppingCartDTO dto, HttpServletResponse response, HttpServletRequest request,
			Model model) {

		service.insertShoppingCart(dto);

		Cookie pnoAmount = new Cookie(String.valueOf(dto.getPno()), String.valueOf(dto.getAmount()));

		if (request.getCookies().length == 1) {
//			pnoAmount = new Cookie(String.valueOf(dto.getPno()), String.valueOf(dto.getAmount()));

			pnoAmount.setMaxAge(7 * 24 * 60 * 60);
			pnoAmount.setPath("/");
			response.addCookie(pnoAmount);
		} else {
			Cookie[] cookies = request.getCookies();
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equalsIgnoreCase("JSESSIONID")) {
					System.out.println("앙기모띠");
					System.out.println(cookies[i].getName()+i);
					continue;
				}
				String sCookie = cookies[i].getValue();
				int cookie = Integer.valueOf(sCookie);
				pnoAmount.setValue(String.valueOf(cookie + dto.getAmount()));
				System.out.println("dtoAMount" + dto.getAmount());
				System.out.println(pnoAmount.getValue());
				System.out.println(cookies[i].getName());
				response.addCookie(pnoAmount);
			}
		}

//		System.out.println(dto.getPno());
//		System.out.println(dto.getAmount());

		return "board/read";
	}

//	테스트용임
	@RequestMapping("/read")
	public String readTest() {

		return "board/read";
	}

}
