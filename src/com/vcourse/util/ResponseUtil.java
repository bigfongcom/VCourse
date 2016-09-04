package com.vcourse.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
/**
 * 设置统一编码格式 防止乱码
 * @author Administrator
 *
 */

public class ResponseUtil {

	public static void write(HttpServletResponse response,Object o)throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println(o.toString());
		out.flush();
		out.close();
	}
}
