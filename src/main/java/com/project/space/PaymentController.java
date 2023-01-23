package com.project.space;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.PaymentVO;
import com.project.space.domain.PointVO;
import com.project.space.payment.service.PaymentService;
import com.project.space.point.service.PointService;
import com.project.space.spaceinfo.service.SpaceInfoService;
import com.project.space.user.service.Mem_InfoService;

@Controller
@RequestMapping("/payments")
public class PaymentController {
    private static final Logger log = LoggerFactory.getLogger(PaymentController.class);


    @Inject
    Mem_InfoService mem_infoservice;

    @Inject
    SpaceInfoService spaceinfoservice;

    @Inject
    PaymentService paymentService;

    @Inject
    PointService pointService;


    @GetMapping("/paytest")
    public String test(HttpServletResponse response, HttpServletRequest request,HttpSession session,@RequestParam int price){


        String userid = ((Mem_InfoVO)session.getAttribute("loginUser")).getUserid();        
        
        Mem_InfoVO mem = mem_infoservice.getUser(userid);
        

        request.setAttribute("name", mem.getMname());
        request.setAttribute("email", "john@example.com");
        request.setAttribute("phone", mem.getHp());
        request.setAttribute("address", "123 Main St, Anytown USA 12345");
        request.setAttribute("totalPrice", price);

        return "ajax/pay/test";
    }


    //결제 
    @GetMapping("/paytest1")
    public String test1(Model m, HttpSession session, @RequestParam int amount, @RequestParam String sname){
         //즉 model에서 가져와야 하는 정보
          //1. merchant_uid , 2.sname, 3.param(amount), 4.mname, 5.hp



        //merchant_uid는 ORD + sysdate(yyyyMMdd)+ - + space_info(snum)+ - + payment_seq로 이루어짐
        String userid = ((Mem_InfoVO)session.getAttribute("loginUser")).getUserid();
        
        int num;
        if(paymentService.getpaymentcount() == 0){
          num = 1;
        }else{
          num = paymentService.getPaynum();
        }

        String numStr = String.format("%07d", num);

        


        String merchant_uid = "ORD" +  new SimpleDateFormat("yyyyMMdd").format(new Date()) + "-" +  numStr;

        
        
        Mem_InfoVO mem = mem_infoservice.getUser(userid);


        m.addAttribute("mname", mem.getMname());
        m.addAttribute("hp", mem.getHp());
        m.addAttribute("amount", amount);
        m.addAttribute("sname", sname);
        m.addAttribute("merchant_uid", merchant_uid);


        return "ajax/pay/test1";
    }


    //환불

    @GetMapping("/paytest2")
    public String test2(Model m, @RequestParam String reason, @RequestParam String merchant_uid, HttpSession session){
      
      
      String userid = ((Mem_InfoVO)session.getAttribute("loginUser")).getUserid();

      if(paymentService.getpaymentbyuseridandmerchant_uid(userid, merchant_uid).getStatus()==1){
        return "ajax/pay/test2";
      }

        m.addAttribute("reason", reason);
        m.addAttribute("merchant_uid", merchant_uid);
        m.addAttribute("amount", paymentService.getpaymentbyuseridandmerchant_uid(userid, merchant_uid).getAmount());
        
        


        Mem_InfoVO mem = mem_infoservice.getUser(userid);
        
        String refundHolder = mem.getMname();
        String refundBank =mem.getBank_code();
        long refundAccount = mem.getAccount();

        m.addAttribute("refundHolder", refundHolder);
        m.addAttribute("refundBank", refundBank);
        m.addAttribute("refundAccount", refundAccount);
        m.addAttribute("checksum", paymentService.getpaymentbyuseridandmerchant_uid("test", merchant_uid).getAmount());

        log.info("asdasdasdasdasdasdasdwaefefawfadfdsfadfasdf");
        return "ajax/pay/test2";
    }
    




    @PostMapping("/complete")
    public ResponseEntity<?> completePayment(@RequestBody Map<String, String> requestBody,HttpSession session) {
      try {
    	log.info("controller접속");
        String impUid = requestBody.get("imp_uid");
        String merchantUid = requestBody.get("merchant_uid");
        String amount = requestBody.get("amount");
        // services호출해서 payments를 저장
        
        String userid = ((Mem_InfoVO)session.getAttribute("loginUser")).getUserid();
        PaymentVO payment=new PaymentVO();
        payment.setImp_uid(impUid);
        payment.setMerchant_uid(merchantUid);
        payment.setAmount(Integer.parseInt(amount));
        payment.setUserid(userid);
        payment.setStatus(0);
        log.info("userid->"+userid);
        int j = mem_infoservice.updateUserPoint(userid, Integer.parseInt(amount));

        int i = paymentService.insertPayment(payment);


        PointVO point = new PointVO();

        point.setUserid(userid);
        point.setPlusPoint(Integer.parseInt(amount));
        point.setPaykind("Card");
        point.setPaystatus(1);


        int k = pointService.insertPoint(point);

        if(i > 0 && j > 0 && k > 0){
          log.info("결제 성공 및 db저장 성공");
          return ResponseEntity.ok().build();
        }
        else{
          log.info("결제 성공 및 db저장 실패");
          return ResponseEntity.badRequest().build();
        }
        
      } catch (Exception e) {
        log.info("결제 실패");
        e.printStackTrace();
        return ResponseEntity.badRequest().build();
      }
    }



    @PostMapping("/cancel")
    public ResponseEntity<?> cancelPayment(@RequestBody Map<String, String> requestBody, Model m,HttpSession session) {
      try {
        String merchantUid = requestBody.get("merchant_uid");
        int cancelRequestAmount = paymentService.getpaymentbyuseridandmerchant_uid("test", merchantUid).getAmount();

        String userid = ((Mem_InfoVO)session.getAttribute("loginUser")).getUserid();

        Mem_InfoVO mem = mem_infoservice.getUser(userid);

        


        // Rest API로 결제 환불 요청
      

        // 같으면 db에 있는 payments status를 1로 변경


        log.info("결제 취소 완료");
        return ResponseEntity.ok().build();
      } catch (Exception e) {

        log.info("결제 취소 실패");
        return ResponseEntity.badRequest().build();
      }
    }

    
}
