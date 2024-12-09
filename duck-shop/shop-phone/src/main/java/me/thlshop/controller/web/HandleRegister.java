package me.thlshop.controller.web;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.thlshop.dto.UserDTO;
import me.thlshop.service.IUserService;
import me.thlshop.utils.PasswordUtil;
import me.thlshop.utils.SesstionUtil;

@WebServlet(urlPatterns = {"/verify-email"})
public class HandleRegister extends HttpServlet {

    private static final long serialVersionUID = 1L;
    ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

    @Inject
    private IUserService userService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String codeVerifyEmail = request.getParameter("codeVerifyEmail");
        UserDTO user = (UserDTO) SesstionUtil.getInstance().getValue(request, "userNeedVerify");

        PasswordUtil passwordUtil = new PasswordUtil();
        user.setPassword(passwordUtil.encode(user.getPassword()));

        String code = (String) SesstionUtil.getInstance().getValue(request, "codeVerify");
        if (codeVerifyEmail == code || codeVerifyEmail.equals(code)) {
            if (user != null) {
                userService.save(user);
                SesstionUtil.getInstance().removeValue(request, "codeVerify");
                SesstionUtil.getInstance().removeValue(request, "userNeedVerify");
                response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=singup_success&alert=success");
            }
        } else {
            String message = "error_code";
            String alert = "danger";
            if (message != null && alert != null) {
                request.setAttribute("message", resourceBundle.getString(message));
                request.setAttribute("alert", alert);
            }
            RequestDispatcher rd = request.getRequestDispatcher("views/verifyEmail.jsp");
            rd.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}