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
import org.springframework.web.servlet.view.RedirectView;
import kr.ca.dao.ProductDAO;
import kr.ca.dao.ShoppingCartDAO;
import kr.ca.domain.CookieDTO;
import kr.ca.domain.MemberDTO;
import kr.ca.domain.ProductDTO;
import kr.ca.domain.ProductDetailDTO;
import kr.ca.domain.ShoppingCartDTO;
import kr.ca.service.ShoppingCartService;

@Controller
@RequestMapping("shoppingCart")
public class ShoppingCartController {

	@Autowired
	private ShoppingCartService service;

	@Autowired
	private ShoppingCartDAO dao;

	@Autowired
	private ProductDAO productDAO;

//	장바구니 리스트
	@RequestMapping("listShoppingCart")
	public String listShoppingCart(ShoppingCartDTO dto, ProductDTO pd, HttpServletRequest request, HttpSession session,
			Model model) {

		Object login = session.getAttribute("login");
		/* productDTO 받아오기 */
//		pd = productDAO.selectProduct(pd);
//		System.out.println(pd);
		/* value, price 받아오기 */
//		String vp = productDAO.selectProductDetail(dto.getId());
//		String[] sVp = vp.split(" ");
//		pd.setVolume(Integer.valueOf(sVp[0].replaceAll("[^0-9]", "")));
//		pd.setPrice(Integer.valueOf(sVp[1].replaceAll("[^0-9]", "")));

//		model.addAttribute("pd", pd);
//
//		List<ProductDetailDTO> pdd = productDAO.selectProductDetail(dto.getPno());
//		System.out.println(pdd);
//		model.addAttribute("pdd", pdd);

		/* 로그인 했을 때(회원) */
		if (login != null) {
			dto.setId(login.toString());
			List<ShoppingCartDTO> list = service.listShoppingCart(dto);
			System.out.println(list);
			model.addAttribute("list", list);

			int count = productDAO.selectCountProductDetail();
			System.out.println("count : " + count);
			List<ProductDetailDTO> pddList = new ArrayList<ProductDetailDTO>();
			System.out.println(pddList);
				for (int j = 0; j < list.size(); j++) {
					pddList.add(productDAO.selectOneProductDetail(list.get(j).getPno(), 30));
					pddList.add(productDAO.selectOneProductDetail(list.get(j).getPno(), 100));
				}
			/* pddList의 null 제거 */
			while (pddList.remove(null))
				;
			System.out.println("pddList : " + pddList);
			model.addAttribute("pdd", pddList);

		} else {

			Cookie[] cookies = request.getCookies();
			List<ShoppingCartDTO> cList = new ArrayList<ShoppingCartDTO>();
			for (int i = 0; i < cookies.length; i++) {
				/* 자동으로 JSESSIONID라는 쿠키가 생성되기 때문에 name이 JSESSIONID일 때 건너뛰기 */
				if (cookies[i].getName().equalsIgnoreCase("JSESSIONID")) {
					cList.add(new ShoppingCartDTO(dto.getId(), 0, 0, 0, 0));
					continue;
				}

				/* 쿠키는 string형으로만 들어가기 때문에 연산을 위해 int형으로 변환 */
				String sCookiePno = cookies[i].getName();
				int cookiePno = Integer.valueOf(sCookiePno);
				String sCookieAmount = cookies[i].getValue();
				int cookieAmount = Integer.valueOf(sCookieAmount);

				ShoppingCartDTO sDto = new ShoppingCartDTO();
				sDto.setId(dto.getId());
				sDto.setPno(cookiePno);
				sDto.setAmount(cookieAmount);
				cList.add(i, sDto);
				model.addAttribute("list", cList);
			}
		}

		return "shoppingCart";
	}

	CookieDTO cookieDTO = new CookieDTO(null, null);
	List<CookieDTO> list = new ArrayList<CookieDTO>();

//	장바구니에 담기
	@RequestMapping("/insertShoppingCart")
	public String insertShoppingCart(ShoppingCartDTO dto, ProductDTO pd, String vp, HttpServletResponse response,
			HttpServletRequest request, HttpSession session, Model model) {

		Object login = session.getAttribute("login");

		/* productDTO 받아오기 */
		pd = productDAO.selectProduct(pd);
		/* value, price 받아오기 */
		String[] sVp = vp.split(" ");
		pd.setPrice(Integer.valueOf(sVp[0].replaceAll("[^0-9]", "")));
		pd.setVolume(Integer.valueOf(sVp[1].replaceAll("[^0-9]", "")));

		model.addAttribute("pd", pd);

		List<ProductDetailDTO> pdd = productDAO.selectProductDetail(dto.getPno());
		model.addAttribute("pdd", pdd);

		/* 장바구니에 담기 (회원) */
		if (login != null) {
			dto.setId(login.toString());
			dto.setVolume(Integer.valueOf(sVp[1].replaceAll("[^0-9]", "")));
			dto.setPrice(Integer.valueOf(sVp[0].replaceAll("[^0-9]", "")));
			System.out.println(dto);
			service.insertShoppingCart(dto);
		} else {

			/* 장바구니에 담기 (비회원) */
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
					/* 수량이 0이 되면 자동으로 쿠키 지속시간을 0으로 만들어서 삭제하기 */
					if (pnoAmount.getValue().equals("0")) {
						pnoAmount.setMaxAge(0);
					}
					/* 쿠키 추가 */
					response.addCookie(pnoAmount);
				}
			}

		}

		return "board/read";
	}

//	장바구니에서 업데이트&삭제
	@RequestMapping("/deleteShoppingCart")
	public RedirectView deleteShoppingCart(ShoppingCartDTO dto, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("aaa");
		Object login = session.getAttribute("login");
		System.out.println(dto);
		/* 로그인 했을 때 */
		if (login != null) {
			dto.setId(login.toString());
			ShoppingCartDTO member = dao.selectShoppingCart(dto);
			System.out.println(member);
			if (dto.getAmount() >= member.getAmount()) {
				service.deleteShoppingCart(member);
			}
			member.setAmount(member.getAmount() - dto.getAmount());
			System.out.println(member);
			service.updateShoppingCart(member);
			/* 로그인 안했을 때 */
		} else {

			/* 장바구니에 담기 (비회원) */
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
					pnoAmount.setValue(String.valueOf(cookieValue - dto.getAmount()));
					/* 장바구니에서 수량을 뺄 때 value가 -가 되면 0을 설정하기 */
					if (cookieValue - dto.getAmount() < 0) {
						pnoAmount.setValue("0");
					}
					/* 수량이 0이 되면 자동으로 쿠키 지속시간을 0으로 만들어서 삭제하기 */
					if (pnoAmount.getValue().equals("0")) {
						pnoAmount.setMaxAge(0);
					}
					/* 쿠키 추가 */
					response.addCookie(pnoAmount);
				}
			}

		}

		return new RedirectView("listShoppingCart");

	}

//	read.jsp로 가기
	@RequestMapping("/read")
	public String read(ProductDTO pd, Model model) {

		pd = productDAO.selectProduct(pd);
		List<ProductDetailDTO> pdd = productDAO.selectProductDetail(pd.getPno());
		model.addAttribute("pd", pd);
		model.addAttribute("pdd", pdd);
		System.out.println(pdd);

		return "board/read";
	}

//	shoppingCart.jsp로 가기
	@RequestMapping("/goShoppingCart")
	public String main(ProductDTO pd, MemberDTO md, Model model) {

		return "shoppingCart";
	}
}
