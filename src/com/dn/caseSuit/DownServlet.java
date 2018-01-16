package com.dn.caseSuit;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dn.statics.Param;

public class DownServlet extends HttpServlet {

	/**
	 * 客户端下载文件到临时目录
	 */
	private static final long serialVersionUID = 101L;
	private int bufferSize = 2048;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("log::info：" + request.getRequestURL().toString());
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter ret = response.getWriter(); // 定义返回对象
		// System.out.println(session.getId());
		try {
			// 文件名必须带后缀名，否则 下载后是未知类型的文件
			String filename = request.getParameter("filename");
			String type = request.getParameter("type");
			String path = Param.path;
			path = path + "/upload/" + type + "/" + filename;
			// System.out.println(path);

			// 检测文件是否存在
			File file = new File(path);
			if (!file.exists()) {
				ret.print("{\"status\":401, \"msg\":\"文件不存在，不能下载！\"}");
			} else {
				response.reset();
				// 将 文件流写入到前端浏览器
				response.setHeader("Content-disposition", "attachment;filename=" + convertFileName(filename));
				ServletOutputStream sops = response.getOutputStream();
				FileInputStream fis = new FileInputStream(file);
				copyStream(fis, sops, true);
				fis.close();
				sops.close();
				fis = null;
				sops = null;
				file = null;
			}
		} catch (Exception e) {
			ret.print("{\"status\":402, \"msg\":\"文件下载失败，请稍后重试！\"}");
			e.printStackTrace();
		}
	}

	private final long copyStream(InputStream source, OutputStream dest, boolean flush) {
		int bytes;
		long total = 0l;
		byte[] buffer = new byte[bufferSize];
		try {
			while ((bytes = source.read(buffer)) != -1) {
				if (bytes == 0) {
					bytes = source.read();
					if (bytes < 0)
						break;
					dest.write(bytes);
					if (flush)
						dest.flush();
					total += bytes;
				}
				dest.write(buffer, 0, bytes);
				if (flush)
					dest.flush();
				total += bytes;
			}

		} catch (IOException e) {
			throw new RuntimeException("IOException caught while copying.", e);
		}
		return total;
	}

	// 转换文件名的方法 在strust.xml中会用到
	public String convertFileName(String cfilename) {
		try {
			cfilename = new String(cfilename.getBytes(), "ISO-8859-1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cfilename;
	}
}
