package me.thlshop.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.thlshop.constant.SystemConstant;
import me.thlshop.dto.UserDTO;
import me.thlshop.entity.UserEntity;
import me.thlshop.service.IRoleService;
import me.thlshop.service.IUserService;
import me.thlshop.utils.MessageUtil;

@WebServlet(urlPatterns = {"/admin-account"})
public class AccountController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Inject
    private IUserService userService;

    @Inject
    private IRoleService roleService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            String url = "";
            String type = request.getParameter("type");
            String userId = request.getParameter("userId");
            String alert = request.getParameter("alert");

            if (type.equals(SystemConstant.LIST)) {
                request.setAttribute(SystemConstant.MODEL, userService.findAll());
                url = "views/admin/account/account.jsp";
            } else if (type.equals(SystemConstant.EDIT)) {
                if (userId != null && !userId.equalsIgnoreCase("0")) {
                    request.setAttribute("USER", userService.findOne(Integer.parseInt(userId)));
                } else {
                    UserEntity userEntity = new UserEntity();
                    userEntity.setUserId(0);
                    request.setAttribute("USER", userEntity);
                }

                if (alert != null) {
                    if (alert.equalsIgnoreCase("error")) {
                        request.setAttribute("alert", "danger");
                        request.setAttribute("messageResponse", "Error!");
                    } else {
                        request.setAttribute("alert", "success");
                        request.setAttribute("messageResponse", "Record updated successfully!");
                    }
                }

                url = "views/admin/account/account_form.jsp";
            }

            MessageUtil.showMessage(request);

            request.setAttribute("role", roleService.findAll());
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception ex) {
            response.sendRedirect("/admin-dashboard");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String userId = request.getParameter("userId");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String roleId = request.getParameter("roleId");

        UserEntity userEntity;
        if (userId.equalsIgnoreCase("") || userId.equalsIgnoreCase("0")) {
            userEntity = new UserEntity();
            userEntity.setUserId(0);
        } else {
            userEntity = userService.findOne(Integer.parseInt(userId));
        }

        try {
            String fullNameError = null;
            String emailError = null;
            String passwordError = null;
            String roleError = null;

            if (fullName == null || fullName.equalsIgnoreCase("")) {
                fullNameError = "Please enter Full Name!";
            }

            if (email == null || email.equalsIgnoreCase("")) {
                emailError = "Please enter Email!";
            } else {
                UserEntity userEmail = userService.findByEmail(email.trim());
                if (userEmail != null && userEmail.getUserId() != Integer.parseInt(userId)) {
                    emailError = "Email address already exists!";
                }
            }

            if (userId != null && !userId.equalsIgnoreCase("0")) {
                if (password == null || password.length() <= 6) {
                    passwordError = "Please enter Password > 6 length!";
                }
            }

            if (roleId == null || roleId.equalsIgnoreCase("0")) {
                roleError = "Please select Role!";
            }

            if (fullNameError != null || emailError != null || roleError != null) {
                userEntity.setFullName(fullName);
                userEntity.setEmail(email);

                request.setAttribute("fullNameError", fullNameError);
                request.setAttribute("emailError", emailError);
                request.setAttribute("passwordError", passwordError);
                request.setAttribute("roleError", roleError);
                request.setAttribute("alert", "warning");
                request.setAttribute("messageResponse", "Please check your data!");

                request.setAttribute("USER", userEntity);
                request.setAttribute("role", roleService.findAll());

                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/views/admin/account/account_form.jsp");
                requestDispatcher.forward(request, response);
            } else {
                UserDTO userDTO = new UserDTO();
                userDTO.setUserId(Integer.parseInt(userId));
                userDTO.setFullName(fullName);
                userDTO.setEmail(email.trim());
                userDTO.setPassword(password);
                userDTO.setPhone(phone);
                userDTO.setAddress(address);
                userDTO.setRoleId(Integer.parseInt(roleId));

                if (userDTO.getUserId() == 0) {
                    UserEntity userNew = userService.save(userDTO);
                    userEntity.setUserId(userNew.getUserId());
                } else {
                    userService.update(userDTO);
                }

                response.sendRedirect("/admin-account?type=edit&alert=success&userId=" + userEntity.getUserId());
            }
        } catch (Exception ex) {
            response.sendRedirect("/admin-account?type=edit&alert=error&userId=" + userEntity.getUserId());
        }
    }

}
