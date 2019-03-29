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
	List<CookieDTO> list =  new ArrayList<CookieDTO>();
	
//	장바구니에 담기
	@RequestMapping("/insertShoppingCart")
	public String insertShoppingCart(ShoppingCartDTO dto, HttpServletResponse response, HttpServletRequest request, Model model) {
		
		service.insertShoppingCart(dto);
		
		Cookie pnoAmount = new Cookie("name", String.valueOf(dto.getPno()) +"-"+ String.valueOf(dto.getAmount()));
		String sPnoAmount = pnoAmount.getValue();
		
		System.out.println(dto.getPno());
		System.out.println(dto.getAmount());
		pnoAmount.setMaxAge(7 * 24 * 60 * 60);
		pnoAmount.setPath("/");
		response.addCookie(pnoAmount);


		return "board/read";
	}

//	테스트용임
	@RequestMapping("/read")
	public String readTest() {

		return "board/read";
	}

}
