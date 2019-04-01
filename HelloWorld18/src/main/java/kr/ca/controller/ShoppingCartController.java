package kr.ca.controller;

import java.util.ArrayList; 
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
			HttpSession session, Model model) {

		/* 장바구니에 담기 (회원) */
//		if (session.getId() != null) {
			service.insertShoppingCart(dto);
//		}

//		장바구니에 담기 (비회원)
		/* 쿠키 생성 */
		Cookie pnoAmount = new Cookie(String.valueOf(dto.getPno()), String.valueOf(dto.getAmount()));
		/* 쿠키 유지 시간 설정 */
		pnoAmount.setMaxAge(7 * 24 * 60 * 60);
		/* 쿠키 패스 설정 */
		pnoAmount.setPath("/");
		/* 쿠키 추가 */
		response.addCookie(pnoAmount);
		/* 배열에 담기 */
		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {

			/* 자동으로 JSESSIONID라는 쿠키가 생성되기 때문에 name이 JSESSIONID일 때 건너뛰기 */
			if (cookies[i].getName().equalsIgnoreCase("JSESSIONID")) {
				continue;
			}
			/* 쿠키의 이름이 pno와 같아야 추가하기 */
			if (Integer.valueOf(cookies[i].getName()) == dto.getPno()) {
				/* 쿠키는 string형으로만 들어가기 때문에 연산을 위해 int형으로 변환 */
				String sCookieValue = cookies[i].getValue();
				int cookieValue = Integer.valueOf(sCookieValue);
				/* 기존 value에 amount를 더해주기 (장바구니에서 삭제하면 -를 넣으면 됨) */
				pnoAmount.setValue(String.valueOf(cookieValue + dto.getAmount()));
				/* 장바구니에서 수량을 뺄 때 value가 -가 되면 0을 설정하기 */
				if (cookieValue + dto.getAmount() < 0) {
					pnoAmount.setValue("0");
				}
				/* 쿠키 추가 */
				response.addCookie(pnoAmount);
			}
		}

		return "board/read";
	}

//	테스트용임
	@RequestMapping("/read")
	public String readTest() {

		return "board/read";
	}

}
