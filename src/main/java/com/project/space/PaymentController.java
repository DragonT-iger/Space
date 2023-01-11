package com.project.space;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.support.RequestPartServletServerHttpRequest;

@Controller
public class PaymentController {
    private static final Logger log = LoggerFactory.getLogger(PaymentController.class);

    @RequestMapping("/paytest")
    public String test(HttpServletResponse response){

        request.setAttribute("name", "John Smith");
        request.setAttribute("email", "john@example.com");
        request.setAttribute("phone", "123-456-7890");
        request.setAttribute("address", "123 Main St, Anytown USA 12345");
        request.setAttribute("totalPrice", 100);

        request.getRequestDispatcher("/confirmation.jsp").forward(request, response);


        return "ajax/pay/test";
    }
}
