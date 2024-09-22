package com.systex.hw3.lottery;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;

public class LotteryController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    private LotteryService lotteryService = new LotteryService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher view;
		LinkedList<String> errorMsgs = new LinkedList<>();
		request.setAttribute("errors", errorMsgs); // Request-Scope
    	
    	String group = request.getParameter("groups");
        String exclude = request.getParameter("exclude");

        int groups = 0;
        LinkedList<Integer> excludes = new LinkedList<>();
		
        try {
            groups = Integer.parseInt(group);
            if (groups <= 0) {
            	errorMsgs.add("組數必須大於0。");
            }
        } catch (NumberFormatException e) {
        	errorMsgs.add("組數必須是一個有效的數字。");
        }
        
        if (exclude != null && !exclude.isEmpty()) {
            excludes = new LinkedList<>();
            String[] excludeArray = exclude.split(" ");
            for (String num : excludeArray) {
                try {
                    int excludeNum = Integer.parseInt(num);
                    if (excludeNum < 1 || excludeNum > 49) {
                    	errorMsgs.add("排除數字必須在1到49之間：" + num);
                    } else {
                        excludes.add(excludeNum);
                    }
                } catch (NumberFormatException e) {
                	errorMsgs.add("排除數字格式錯誤：" + num);
                }
            }
        }

        if (!errorMsgs.isEmpty()) {            
			view = request.getRequestDispatcher("/lottery/main.jsp");
			view.forward(request, response);
			return; // 把控制權還給Container
        }
        
        ArrayList<int[]> results = lotteryService.gotNumbers(groups, excludes);
        request.setAttribute("results", results);
        request.getRequestDispatcher("/lottery/result.jsp").forward(request, response);
        
    }
}
