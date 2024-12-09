package me.thlshop.controller.web;

import me.thlshop.utils.ContainUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@WebServlet(urlPatterns = {"/show-image"})
public class ImageServletController extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String fileName = request.getParameter("fileName");
        String filePath = ContainUtil.PATH_FILE_UPLOAD + fileName;

        // Decode the file name (might contain spaces and on) and prepare file object.
        File file = new File(filePath);

        // Check if file actually exists in filesystem.
        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
            return;
        }

        // Get content type by filename.
        String contentType = getServletContext().getMimeType(file.getName());

        byte[] imageBytes = Files.readAllBytes(file.toPath());

        response.setContentType(contentType);
        response.setContentLength(imageBytes.length);

        response.getOutputStream().write(imageBytes);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            doGet(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
