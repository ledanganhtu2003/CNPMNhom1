package me.thlshop.controller.web;

import java.io.IOException;
import java.sql.Timestamp;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.thlshop.converter.UserConverter;
import me.thlshop.dto.CartDTO;
import me.thlshop.dto.OrderDTO;
import me.thlshop.dto.UserDTO;
import me.thlshop.entity.UserEntity;
import me.thlshop.service.ICategoryService;
import me.thlshop.service.IOrderDetailService;
import me.thlshop.service.IOrderService;
import me.thlshop.utils.SesstionUtil;

@WebServlet(urlPatterns = {"/payment"})
public class PaymentController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Inject
    private IOrderService orderServlet;

    @Inject
    private IOrderDetailService orderDetailServlet;

    @Inject
    private UserConverter userConverter;

    @Inject
    private ICategoryService categoryService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("listCategory", categoryService.findAll());

        SesstionUtil.getInstance().getValue(request, "USERMODEL");
        RequestDispatcher rd = request.getRequestDispatcher("views/web/payment.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        UserEntity userEntity = (UserEntity) SesstionUtil.getInstance().getValue(request, "USERMODEL");
        Long total = (Long) SesstionUtil.getInstance().getValue(request, "totalSum");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        CartDTO cart = (CartDTO) SesstionUtil.getInstance().getValue(request, "cart");

        if (address != null && phone != null && userEntity != null) {
            try {
                UserDTO userDTO = userConverter.toDto(userEntity);
                OrderDTO orderDTO = new OrderDTO();
                orderDTO.setUserId(userDTO.getUserId());
                orderDTO.setAddress(address);
                orderDTO.setOrderDate(new Timestamp(System.currentTimeMillis()));
                orderDTO.setPhone(phone);
                orderDTO.setTotal(total);
                orderDTO.setStatus(0);
                OrderDTO order = orderServlet.save(orderDTO);
                orderDetailServlet.save(cart, order);

                SesstionUtil.getInstance().removeValue(request, "totalSum");
                SesstionUtil.getInstance().removeValue(request, "cart");
                SesstionUtil.getInstance().removeValue(request, "sumQuantity");
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect(request.getContextPath() + "/payment-thanks");
        }
    }

}
