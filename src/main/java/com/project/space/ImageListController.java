package com.project.space;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j

public class ImageListController{


@Inject
private String imgaName;

@Inject
private String imgpath;
​

//pspec(HIT,NEW,BEST) 별로 상품목록 가져오기

@GetMapping("/prodPspec")

public String productByPspec(Model m, @RequestParam(name="pspec", defaultValue="HIT") String pspec) {

log.info("pspec: "+pspec);

​

List<ProductVO> pList=shopService.selectByPspec(pspec);

m.addAttribute("pList", pList);

​

return "/shop/mallHit";

}

​

@GetMapping("/prodDetail")

public String productDetail(Model m, @RequestParam(defaultValue="0") int pnum, HttpSession ses) {

if(pnum==0) {  //파라미터가 안넘어왔을때

return "redirect:index";

}

ses.setAttribute("pnum", pnum);  //세션에 pnum 저장

​

ProductVO vo=this.shopService.selectByPnum(pnum);

m.addAttribute("prod", vo);

return "/shop/prodDetail";

}
[출처] SpringMVC(상품진열 홈, 상품상세페이지)|작성자 JAY