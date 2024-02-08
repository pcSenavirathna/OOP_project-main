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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet("/itemAddServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1924 * 50)
public class itemAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		
		
		HttpSession session = request.getSession(false); // Get the session, don't create a new one if it doesn't exist
		String cusId = (String) session.getAttribute("cusId");
		//Assign passed values in the variable
		String itName = request.getParameter("itemName");
        String itDescription = request.getParameter("itemDescription");
        String itType = request.getParameter("itemType");
        double stBid = Double.parseDouble(request.getParameter("startingBid"));
        String biEndDate = request.getParameter("biddingEndDate");
        String itCondition = request.getParameter("itemCondition");
        double rePrice = Double.parseDouble(request.getParameter("reservedPrice"));
        
        //Get the image details from the uploaded file
        Part part = request.getPart("itemPhoto");
        //Extract the file name from the details
        String fileName = extractFileName(part);
        String savePath = "C:\\Users\\chand\\eclipse-workspace\\Online_Biding_System\\src\\main\\webapp\\images\\" + File.separator + fileName;
        File fileSaveDir = new File(savePath);
        
        
        //Write the uploaded file to the specified path.
        part.write(savePath + File.separator);
        
        //Check file uploaded correctly
        System.out.println("savePath: " + savePath);
        System.out.println("fileName: " + fileName);
        System.out.println("File saved successfully: " + fileSaveDir.exists());

        
        
        boolean isTrue;
        
        // Insert the item information into the database.
        isTrue = itemDB.insertItem(itName, itDescription, itType, stBid, biEndDate, itCondition, rePrice, fileName, cusId);
        
        // If the item insertion is successful, forward the request to 'reBtn.jsp'.
        if(isTrue == true) {
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
    			return s.substring(s.indexOf("=") + 2, s.length() - 1);
    		}
    	}
    	return "";
    }
    

}