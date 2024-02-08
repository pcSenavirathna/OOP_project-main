package com.BidingSystem.Pubuth;

import java.io.File;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/updateItemServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
maxFileSize = 1024 * 1024 * 10,
maxRequestSize = 1024 * 1924 * 50)
public class updateItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		//store got value in the variable
		int itemId = Integer.parseInt(request.getParameter("itId"));
		String itName = request.getParameter("itName");
        String itDescription = request.getParameter("itDescription");
        String itType = request.getParameter("itType");
        double stBid = Double.parseDouble(request.getParameter("sBid"));
        String biEndDate = request.getParameter("bEndDate");
        String itCondition = request.getParameter("itemCondition");
        double rePrice = Double.parseDouble(request.getParameter("reservedPrice"));
        String deimage = request.getParameter("hiddenField");
        
        
        //check values returned correctly
        System.out.println(itemId + itName + itDescription + itType + stBid + biEndDate + itCondition + rePrice + deimage);
        
        String fileName;
        //Get the uploaded photo details
        Part part = request.getPart("itemPhoto");
        //check if a photo was uploaded
        if (part != null && part.getSize() > 0) {
        	fileName = extractFileName(part);
        	String savePath = "C:\\Users\\chand\\eclipse-workspace\\Online_Biding_System\\src\\main\\webapp\\images\\" + File.separator + fileName;
        	File fileSaveDir = new File(savePath);
        
        	// Write the uploaded file to the specified path.
        	part.write(savePath + File.separator);
        
        	//check if file was saved
        	System.out.println("savePath: " + savePath);
        	System.out.println("fileName: " + fileName);
        	System.out.println("File saved successfully: " + fileSaveDir.exists());
        }
        else {
        	// If no file was uploaded, use the existing file name
        	fileName = deimage;
        }
        boolean success;
        
        success = itemDB.updateItem(itName, itDescription, itType, stBid, biEndDate, itCondition, rePrice, fileName, itemId);
        
        if(success == true) {
        	 // If the item update is successful, forward the request to 'reBtn.jsp'.
        	RequestDispatcher dis = request.getRequestDispatcher("reBtn.jsp");
        	dis.forward(request, response);
        }
        else {
        	RequestDispatcher dis2 = request.getRequestDispatcher("error.jsp");
        	dis2.forward(request, response);
        }

	}
	
	private String extractFileName(Part part) {
    	String contentDisp = part.getHeader("content-disposition");
    	String[] items = contentDisp.split(";");
    	for(String s : items) {
    		if(s.trim().startsWith("filename")) {
    			// Extract and return the file name.
    			return s.substring(s.indexOf("=") + 2, s.length() - 1);
    		}
    	}
    	return "";
    }

}
