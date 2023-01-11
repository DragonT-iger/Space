package com.project.space;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.PaymentVO;
import com.project.space.payment.service.PaymentService;
import com.project.space.user.service.Mem_InfoService;

@Controller
@RequestMapping("/payments")
public class PaymentController {
    private static final Logger log = LoggerFactory.getLogger(PaymentController.class);


    @Inject
    Mem_InfoService mem_infoservice;

    @Inject
    PaymentService paymentService;


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

    @GetMapping("/paytest1")
    public String test1(){


        return "ajax/pay/test1";
    }

    @GetMapping("/paytest2")
    public String test2(){


        return "ajax/pay/test2";
    }
    
    @PostMapping("/complete")
    public ResponseEntity<?> completePayment(@RequestBody Map<String, String> requestBody,HttpSession session) {
      try {
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
        payment.setStatus("0");

        int i = paymentService.insertPayment(payment);

        if(i > 0) {
            log.info("결제 성공및 db저장 완료");
            return ResponseEntity.ok().build();
        }else {
            log.info("결제 성공및 db저장 실패");
            return ResponseEntity.badRequest().build();
        }
      } catch (Exception e) {
        log.info("결제 실패");
        e.printStackTrace();
        return ResponseEntity.badRequest().build();
      }
    }



    @PostMapping("/cancel")
    public ResponseEntity<?> cancelPayment(@RequestBody Map<String, String> requestBody, Model m) {
      try {
        String merchantUid = requestBody.get("merchant_uid");
        String cancelRequestAmount = requestBody.get("cancel_request_amount");
        String reason = requestBody.get("reason");
        String refundHolder = requestBody.get("refund_holder");
        String refundBank = requestBody.get("refund_bank");
        String refundAccount = requestBody.get("refund_account");
        // services호출해서 payments를 호출

  


        // db에 저장된 돈과 cancelRequestAmount를 비교해서 값이 같은지 확인.(조작 가능성이 있으므로)


        // Rest API로 결제 환불 요청


        // 같으면 db에 있는 payments status를 -1로 변경


        log.info("결제 취소 완료");
        return ResponseEntity.ok().build();
      } catch (Exception e) {

        log.info("결제 취소 실패");
        return ResponseEntity.badRequest().build();
      }
    }
    
}
