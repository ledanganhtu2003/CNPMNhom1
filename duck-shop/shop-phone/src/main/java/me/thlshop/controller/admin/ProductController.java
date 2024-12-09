package me.thlshop.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import me.thlshop.constant.SystemConstant;
import me.thlshop.dto.ProductDetailDTO;
import me.thlshop.entity.ProductEntity;
import me.thlshop.service.ICategoryService;
import me.thlshop.service.IInformationService;
import me.thlshop.service.IProductService;
import me.thlshop.utils.ContainUtil;
import me.thlshop.utils.MessageUtil;

@MultipartConfig
@WebServlet(urlPatterns = {"/admin-product"})
public class ProductController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Inject
    private IInformationService informationService;

    @Inject
    private IProductService productService;

    @Inject
    private ICategoryService categoryService;

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            String url = "";
            String type = request.getParameter("type");
            String productId = request.getParameter("productId");
            if (type.equals(SystemConstant.LIST)) {
                request.setAttribute(SystemConstant.MODEL, productService.findAll());
                url = "views/admin/product/product.jsp";
            } else if (type.equals(SystemConstant.EDIT)) {
                if (productId != null) {
                    request.setAttribute("PRODUCT", productService.findOne(Integer.parseInt(productId)));
                } else {
                    ProductEntity productEntity = new ProductEntity();
                    productEntity.setProductId(0);
                    request.setAttribute("PRODUCT", productEntity);
                }
                url = "views/admin/product/product_form.jsp";
            }

            MessageUtil.showMessage(request);

            request.setAttribute("category", categoryService.findAll());
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception ex) {
            response.sendRedirect("/admin-dashboard");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String categoryId = request.getParameter("categoryId");
        String productId = request.getParameter("productId");
        String infoId = request.getParameter("infoId");
        String productName = request.getParameter("productName");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String camera = request.getParameter("camera");
        String cameraSelfie = request.getParameter("cameraSelfie");
        String cell = request.getParameter("cell");
        String cpu = request.getParameter("cpu");
        String gpu = request.getParameter("gpu");
        String memory = request.getParameter("memory");
        String os = request.getParameter("os");
        String ram = request.getParameter("ram");
        String screen = request.getParameter("screen");
        String sim = request.getParameter("sim");

        ProductEntity productEntity;
        if (productId.equalsIgnoreCase(productId) || productId.equalsIgnoreCase("0")) {
            productEntity = new ProductEntity();
            productEntity.setProductId(0);
        } else {
            productEntity = productService.findOne(Integer.parseInt(productId));
        }

        try {
            String productNameError = null;
            String priceError = null;
            String categoryError = null;

            if (productName == null || productName.equalsIgnoreCase("")) {
                productNameError = "Please enter Product Name!";
            }

            if (price == null || price.equalsIgnoreCase("")) {
                priceError = "Please enter Price!";
            }

            if (categoryId == null || categoryId.equalsIgnoreCase("0")) {
                categoryError = "Please select Category!";
            }

            if (productNameError != null || priceError != null || categoryError != null) {
                productEntity.setProductName(productName);

                request.setAttribute("productNameError", productNameError);
                request.setAttribute("priceError", priceError);
                request.setAttribute("categoryError", categoryError);
                request.setAttribute("alert", "warning");
                request.setAttribute("messageResponse", "Please check your data!");

                request.setAttribute("PRODUCT", productEntity);
                request.setAttribute("category", categoryService.findAll());

                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/views/admin/product/product_form.jsp");
                requestDispatcher.forward(request, response);
            } else {
                ProductDetailDTO productDTO = new ProductDetailDTO();
                productDTO.setProductId(Integer.parseInt(productId));
                productDTO.setCategoryId(Integer.parseInt(categoryId));
                productDTO.setProductName(productName);
                productDTO.setDescription(description);

                Part partImageSmall = request.getPart("imageSmall");
                String nameImageSmall = partImageSmall.getSubmittedFileName();

                ProductEntity productDb = productService.findOne(Integer.parseInt(productId));

                if (!nameImageSmall.equals("")) {
                    Path dir = Paths.get(ContainUtil.PATH_FILE_UPLOAD);
                    if (!Files.exists(dir)) {
                        Files.createDirectory(dir);
                    }
                    partImageSmall.write(ContainUtil.PATH_FILE_UPLOAD + File.separator + nameImageSmall);
                    productDTO.setImageSmall(nameImageSmall);
                } else {
                    if (productDb != null) {
                        productDTO.setImageSmall(productDb.getImageSmall());
                    }
                }

                Part partImageBig = request.getPart("imageBig");
                String nameImageBig = partImageBig.getSubmittedFileName();

                if (!nameImageBig.equals("")) {
                    Path dir = Paths.get(ContainUtil.PATH_FILE_UPLOAD);
                    if (!Files.exists(dir)) {
                        Files.createDirectory(dir);
                    }
                    partImageBig.write(ContainUtil.PATH_FILE_UPLOAD + File.separator + nameImageBig);
                    productDTO.setImageBig(nameImageBig);
                } else {
                    if (productDb != null) {
                        productDTO.setImageBig(productDb.getImageBig());
                    }
                }

                productDTO.setPrice(Long.parseLong(price));
                productDTO.setCamera(camera);
                productDTO.setCameraSelfie(cameraSelfie);
                productDTO.setCell(cell);
                productDTO.setCpu(cpu);
                productDTO.setGpu(gpu);
                productDTO.setMemory(memory);
                productDTO.setOs(os);
                productDTO.setRam(ram);
                productDTO.setScreen(screen);
                productDTO.setSim(sim);

                if (productDTO.getProductId() == 0) {
                    // save information
                    Integer informationId = informationService.save(productDTO);

                    // save product
                    productDTO.setInfoId(informationId);
                    Integer productNew = productService.save(productDTO);
                    productEntity.setProductId(productNew);
                } else {
                    productDTO.setProductId(Integer.parseInt(productId));
                    productDTO.setInfoId(Integer.parseInt(infoId));

                    productEntity.setProductId(Integer.parseInt(productId));

                    // update information
                    informationService.update(productDTO);

                    // update product
                    productService.update(productDTO);
                }

                response.sendRedirect("/admin-product?type=edit&alert=success&productId=" + productEntity.getProductId());
            }
        } catch (Exception ex) {
            response.sendRedirect("/admin-product?type=edit&alert=error&productId=" + productEntity.getProductId());
        }
    }

}
