package me.thlshop.controller.admin;

import me.thlshop.constant.SystemConstant;
import me.thlshop.dto.CategoryDTO;
import me.thlshop.entity.CategoryEntity;
import me.thlshop.service.ICategoryService;
import me.thlshop.utils.MessageUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin-category"})
public class CategoryController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Inject
    private ICategoryService categoryService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            String url = "";
            String type = request.getParameter("type");
            String categoryId = request.getParameter("categoryId");
            String alert = request.getParameter("alert");

            if (type.equals(SystemConstant.LIST)) {
                request.setAttribute(SystemConstant.MODEL, categoryService.findAll());
                url = "views/admin/category/category.jsp";
            } else if (type.equals(SystemConstant.EDIT)) {
                if (categoryId != null && !categoryId.equalsIgnoreCase("0")) {
                    request.setAttribute("CATEGORY", categoryService.findOne(Integer.parseInt(categoryId)));
                } else {
                    CategoryEntity categoryEntity = new CategoryEntity();
                    categoryEntity.setCategoryId(0);
                    request.setAttribute("CATEGORY", categoryEntity);
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

                url = "views/admin/category/category_form.jsp";
            }

            MessageUtil.showMessage(request);

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

        String categoryId = request.getParameter("categoryId");
        String categoryName = request.getParameter("categoryName");

        CategoryEntity categoryEntity;
        if (categoryId.equalsIgnoreCase("") || categoryId.equalsIgnoreCase("0")) {
            categoryEntity = new CategoryEntity();
            categoryEntity.setCategoryId(0);
        } else {
            categoryEntity = categoryService.findOne(Integer.parseInt(categoryId));
        }

        try {
            String categoryNameError = null;

            if (categoryName == null || categoryName.equalsIgnoreCase("")) {
                categoryNameError = "Please enter Category Name!";
            } else {
                CategoryEntity categoryExits = categoryService.findByName(categoryName.trim());
                if (categoryExits != null && categoryExits.getCategoryId() != Integer.parseInt(categoryId)) {
                    categoryNameError = "Category Name already exists!";
                }
            }

            if (categoryNameError != null) {
                categoryEntity.setCategoryId(Integer.parseInt(categoryId));
                categoryEntity.setCategoryName(categoryName);

                request.setAttribute("categoryNameError", categoryNameError);
                request.setAttribute("alert", "warning");
                request.setAttribute("messageResponse", "Please check your data!");

                request.setAttribute("CATEGORY", categoryEntity);

                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/views/admin/category/category_form.jsp");
                requestDispatcher.forward(request, response);
            } else {
                CategoryDTO categoryDTO = new CategoryDTO();
                categoryDTO.setCategoryId(Integer.parseInt(categoryId));
                categoryDTO.setCategoryName(categoryName.trim());

                if (categoryDTO.getCategoryId() == 0) {
                    CategoryEntity categoryNew = categoryService.insert(categoryDTO);
                    categoryEntity.setCategoryId(categoryNew.getCategoryId());
                } else {
                    categoryService.update(categoryDTO);
                }

                response.sendRedirect("/admin-category?type=edit&alert=success&categoryId=" + categoryEntity.getCategoryId());
            }
        } catch (Exception ex) {
            response.sendRedirect("/admin-category?type=edit&alert=error&categoryId=" + categoryEntity.getCategoryId());
        }
    }

}
