package kr.ca.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ca.domain.ProductDTO;
import kr.ca.domain.ProductDetailDTO;
import kr.ca.domain.ReviewDTO;
import kr.ca.service.ProductService;
import kr.ca.service.ReviewService;

@Controller
@RequestMapping("product")
public class ProductController {

   @Autowired
   private ProductService service;
   @Inject
   private ReviewService rService;

   @RequestMapping(value = "write", method = RequestMethod.GET)
   public String writeUI() {
      return "product/write";
   }


	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(ProductDTO dto, int[] volume, int[] price, String[] images) {
		service.write(dto, volume, price);
		return "product/read";
	}

   @RequestMapping("/read")
   public String read(int pno, Model model) {

      ProductDTO pd = service.selectProduct(pno);
      model.addAttribute("pd", pd);
      
      List<ProductDetailDTO> pdd = service.selectProductDetail(pd.getPno());
      model.addAttribute("pdd", pdd);
      
      List<ReviewDTO> reviewList = rService.getReviewList(pno);
      model.addAttribute("reviewList", reviewList);
      
      return "product/read";
   }

   @RequestMapping("list/{category}")
   public String listByCategory(Model model, @PathVariable String category) {
      List<ProductDTO> list = service.getListByCategory(category);
      model.addAttribute("list", list);
      return "product/list";
   }

	@RequestMapping("newProduct")
	public String newProduct(Model model) {
		model.addAttribute("list", service.getNewProducts());
		return "product/list";
	}

	@RequestMapping("bestSeller")
	public String bestSeller(Model model) {
		model.addAttribute("list", service.getBestSellers());
		return "product/list";
	}
   @RequestMapping("search")
   public String searchProduct(String keyword, Model model) {
      List<ProductDTO> searchList = service.searchProduct(keyword);
      model.addAttribute("list", searchList);
      return "product/list";
   }
	@RequestMapping("list")
	public String allProduct(Model model) {
		model.addAttribute("list", service.allProduct());
		return "product/list";
	}
}