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
	public String listShoppingCart(ShoppingCartDTO dto, HttpServletRequest request, HttpSession session, Model model) {

		Object login = session.getAttribute("login");

		/* 로그인 했을 때(회원) */
		if (login != null) {
			dto.setId(login.toString());
			List<ShoppingCartDTO> list = service.listShoppingCart(dto);
			System.out.println(list);
			model.addAttribute("list", list);
			/* 로그인 안했을 때(비회원) */
		} else {

			Cookie[] cookies = request.getCookies();
			List<ShoppingCartDTO> cList = new ArrayList<ShoppingCartDTO>();
			for (int i = 0; i < cookies.length; i++) {
				String[] avp = cookies[i].getValue().split("_");
				/* 자동으로 JSESSIONID라는 쿠키가 생성되기 때문에 name이 JSESSIONID일 때 건너뛰기 */
				if (cookies[i].getName().equalsIgnoreCase("JSESSIONID")) {
					cList.add(new ShoppingCartDTO(dto.getId(), 0, 0, 0, 0));
					continue;
				}

				/* 쿠키는 string형으로만 들어가기 때문에 연산을 위해 int형으로 변환 */
				String sCookieAmount = avp[0];
				int cookieAmount = Integer.valueOf(sCookieAmount);
				cookieAmount += dto.getAmount(); // String.valueOf()안에서 연산이 안돼서 미리 해주기

				String sCookiePrice = avp[1];
				int cookiePrice = Integer.valueOf(sCookiePrice);
				cookiePrice += dto.getPrice(); // String.valueOf()안에서 연산이 안돼서 미리 해주기

				String[] pnoV = cookies[i].getName().split("_");
				String sPno = pnoV[0];
				int pno = Integer.valueOf(sPno);
				String sVolume = pnoV[1];
				int volume = Integer.valueOf(sVolume);

				ShoppingCartDTO sDto = new ShoppingCartDTO();
				sDto.setId(dto.getId());
				sDto.setPno(pno);
				sDto.setAmount(cookieAmount);
				sDto.setVolume(volume);
				sDto.setPrice(cookiePrice);
				cList.add(i, sDto);
				model.addAttribute("list", cList);
			}
		}

		return "shoppingCart";
	}

//	장바구니에 담기
	@RequestMapping("/insertShoppingCart")
	public String insertShoppingCart(ShoppingCartDTO dto, ProductDTO pd, String vp, HttpServletResponse response,
			HttpServletRequest request, HttpSession session, Model model) {

		Object login = session.getAttribute("login");

		/* value, price 받아오기 */

		String[] sVp = vp.split(" ");
		String sVolume = sVp[1].replaceAll("[^0-9]", "");
		int volume = Integer.valueOf(sVolume);
		String sPrice = sVp[0].replaceAll("[^0-9]", "");
		int price = Integer.valueOf(sPrice);
		int pno = dto.getPno();
		String sPno = String.valueOf(pno);
		int amount = dto.getAmount();
		String sAmount = String.valueOf(amount);

		/* productDTO 받아오기 */
		pd = productDAO.selectProduct(pd);
		pd.setPrice(price);
		pd.setVolume(volume);
		model.addAttribute("pd", pd);
		/* productDetail 받아오기 */
		List<ProductDetailDTO> pdd = productDAO.selectProductDetail(dto.getPno());
		model.addAttribute("pdd", pdd);

		/* 장바구니에 담기 (회원) */
		if (login != null) {
			dto.setId(login.toString());
			dto.setVolume(Integer.valueOf(sVp[1].replaceAll("[^0-9]", "")));
			dto.setPrice(Integer.valueOf(sVp[0].replaceAll("[^0-9]", "")));
			service.insertShoppingCart(dto);
		} else {

			/* 장바구니에 담기 (비회원) */
			/* dto에 volume과 price 넣기 */
			dto.setVolume(volume);
			dto.setPrice(price);
			/* 쿠키 생성 */
			Cookie pnoVolume = new Cookie(sPno + "_" + sVolume, sAmount + "_" + sPrice);
			/* 쿠키 유지 시간 설정 */
			pnoVolume.setMaxAge(7 * 24 * 60 * 60);
			/* 쿠키 패스 설정인데 자동으로 설정됨 */
			pnoVolume.setPath("/");
			/* 쿠키 추가 */
			response.addCookie(pnoVolume);
			/* 배열에 담기 */
			Cookie[] cookies = request.getCookies();

			for (int i = 0; i < cookies.length; i++) {
				/* 자동으로 JSESSIONID라는 쿠키가 생성되기 때문에 name이 JSESSIONID일 때 건너뛰기 */
				if (cookies[i].getName().equalsIgnoreCase("JSESSIONID")) {
					continue;
				}
				/* value 구분자로 나눠서 배열에 저장하기 */
				String[] avp = cookies[i].getValue().split("_");
				/* 쿠키의 이름이 pno와 같아야 추가하기 */
				if (cookies[i].getName().equals(sPno + "_" + sVolume)) {

					/* 쿠키는 string형으로만 들어가기 때문에 연산을 위해 int형으로 변환 */
					String sCookieAmount = avp[0];
					int cookieAmount = Integer.valueOf(sCookieAmount);
					cookieAmount += amount; // String.valueOf()안에서 연산이 안돼서 미리 해주기

					String sCookiePrice = avp[1];
					int cookiePrice = Integer.valueOf(sCookiePrice);

					/* 기존 value에 amount를 더해주기 (장바구니에서 삭제하면 -를 넣으면 됨) */
					pnoVolume.setValue(String.valueOf(cookieAmount) + "_" + cookiePrice);

					/* 장바구니에서 수량을 뺄 때 value가 -가 되면 0을 설정하기 */
					if (cookieAmount + dto.getAmount() < 0) {
						pnoVolume.setValue("0");
					}

					/* 수량이 0이 되면 자동으로 쿠키 지속시간을 0으로 만들어서 삭제하기 */
					if (pnoVolume.getValue().equals("0")) {
						pnoVolume.setMaxAge(0);
					}

					/* 쿠키 추가 */
					response.addCookie(pnoVolume);
					break;
				}
			}
		}
		return "board/read";
	}

//	장바구니에서 업데이트&삭제
	@RequestMapping("/deleteShoppingCart")
	public RedirectView deleteShoppingCart(ShoppingCartDTO dto, ProductDTO pd, String vp, HttpSession session,
			HttpServletRequest request, HttpServletResponse response, Model model) {

		Object login = session.getAttribute("login");

		/* productDTO 받아오기 */
		pd = productDAO.selectProduct(pd);
		/* value, price 받아오기 */
		int pno = dto.getPno();
		String sPno = String.valueOf(pno);
		int amount = dto.getAmount();
		String sAmount = String.valueOf(amount);

		model.addAttribute("pd", pd);

		List<ProductDetailDTO> pdd = productDAO.selectProductDetail(dto.getPno());
		model.addAttribute("pdd", pdd);

		/* 로그인 했을 때 */
		if (login != null) {
			dto.setId(login.toString());
			ShoppingCartDTO member = dao.selectShoppingCart(dto);
			if (dto.getAmount() >= member.getAmount()) {
				service.deleteShoppingCart(member);
			}
			member.setAmount(member.getAmount() - dto.getAmount());
			service.updateShoppingCart(member);
			/* 로그인 안했을 때 */
		} else {

			/* 쿠키 생성 */
			Cookie pnoVolume = new Cookie(sPno + "_" + dto.getVolume(), sAmount + "_" + dto.getPrice());
			/* 배열에 담기 */
			Cookie[] cookies = request.getCookies();
			for (int i = 0; i < cookies.length; i++) {

				String[] avp = cookies[i].getValue().split("_");
				/* 자동으로 JSESSIONID라는 쿠키가 생성되기 때문에 name이 JSESSIONID일 때 건너뛰기 */
				if (cookies[i].getName().equalsIgnoreCase("JSESSIONID")) {
					continue;
				}
				if (cookies[i].getName().equals(sPno + "_" + dto.getVolume())) {
					/* 쿠키는 string형으로만 들어가기 때문에 연산을 위해 int형으로 변환 */
					String sCookieAmount = avp[0];
					int cookieAmount = Integer.valueOf(sCookieAmount);
					cookieAmount -= amount; // String.valueOf()안에서 연산이 안돼서 미리 해주기

					String sCookiePrice = avp[1];
					int cookiePrice = Integer.valueOf(sCookiePrice);

					/* 기존 value에 amount를 더해주기 (장바구니에서 삭제하면 -를 넣으면 됨) */
					pnoVolume.setValue(String.valueOf(cookieAmount) + "_" + cookiePrice);

					/* 수량이 0이 되면 자동으로 쿠키 지속시간을 0으로 만들어서 삭제하기 */
					if (cookieAmount <= 0) {
						pnoVolume.setMaxAge(0);
					}
					/* 쿠키 추가 */
					response.addCookie(pnoVolume);
					break;
				}
			}

		}

		return new RedirectView("listShoppingCart");

	}

//	read.jsp로 가기
	@RequestMapping("/read")
	public String read(ProductDTO pd, Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session, int pno) {

		Object login = session.getAttribute("login");

		pd = productDAO.selectProduct(pd);
		List<ProductDetailDTO> pdd = productDAO.selectProductDetail(pd.getPno());
		model.addAttribute("pd", pd);
		model.addAttribute("pdd", pdd);

		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		
		
		if (login == null) {

			/* 쿠키 생성 */
			Cookie recentlyProduct = new Cookie(String.valueOf(pno), "pno");
			/* 쿠키 유지 시간 설정 */
			recentlyProduct.setMaxAge(7 * 24 * 60 * 60);
			/* 쿠키 패스 설정인데 자동으로 설정됨 */
			recentlyProduct.setPath("/");
			/* 쿠키 추가 */
			response.addCookie(recentlyProduct);
			/* 배열에 담기 */
			Cookie[] cookies = request.getCookies();
			
			List<Object> s = new ArrayList<Object>();
			int a = 0;
			for (int i = 0; i < cookies.length; i++) {
				/* 자동으로 JSESSIONID라는 쿠키가 생성되기 때문에 name이 JSESSIONID일 때 건너뛰기 */
				if (cookies[i].getName().equalsIgnoreCase("JSESSIONID") || cookies[i].getName().contains("_")) {
					continue;
				}

				recentlyProduct = cookies[i];

				if (cookies[i].getName().equalsIgnoreCase("JSESSIONID") || cookies[i].getName().contains("_")) {
					continue;
				} else {
					s.add(recentlyProduct.getName());
					ProductDTO dto = new ProductDTO(Integer.valueOf(recentlyProduct.getName()), null, null, null, 0, 0, null, null);
					list.add(dto);
				}
				if (s.size() >= 3) {
					if (cookies[a].getName().equalsIgnoreCase("JSESSIONID")) {
						a++;
						System.out.println("cookies[a].getName() : " + cookies[a].getName());
						continue;
					}
					if (cookies[a].getName().contains("_")) {
						a++;
						System.out.println("cookies[a].getName() : " + cookies[a].getName());
						continue;
					}
					recentlyProduct = new Cookie(cookies[a].getName(), "pno");
					recentlyProduct.setMaxAge(0);
					recentlyProduct.setPath("/");
					response.addCookie(recentlyProduct);
					
				}
			}
			session.setAttribute("list", list);
			System.out.println(list);
			System.out.println("s : " + s);
		}

		return "board/read";
	}


//	shoppingCart.jsp로 가기
	@RequestMapping("/goShoppingCart")
	public String main(ProductDTO pd, MemberDTO md, Model model) {

		return "shoppingCart";
	}
}
