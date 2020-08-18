package com.boot.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


@WebServlet("/ajax/user/*")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Gson gson = new Gson();   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String contentType = response.getContentType();		
		response.getWriter().append("Served at: ").append(request.getContextPath()).append(contentType);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader br = request.getReader();
		String str;
		StringBuffer sb = new StringBuffer();
		while((str = br.readLine())!=null)	{
			sb.append(str);
		}
		
		Map<String,String> param = gson.fromJson(sb.toString(),Map.class);
		System.out.println(param);
		
	}

}
