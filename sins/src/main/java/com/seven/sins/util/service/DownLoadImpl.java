package com.seven.sins.util.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownLoadImpl extends AbstractView {
	
	public DownLoadImpl(){

        //content type을 지정. 
		setContentType("apllication/download; charset=utf-8");
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req, HttpServletResponse res) throws Exception {

		
		File file = (File) model.get("file");
		String realName = model.get("realName").toString();

		res.setContentType(getContentType());
		res.setContentLength((int) file.length());

		res.setHeader("Content-Disposition", "attachment; filename=\"" + 

                java.net.URLEncoder.encode(realName, "utf-8") + "\";");

        res.setHeader("Content-Transfer-Encoding", "binary");
        
        OutputStream out = res.getOutputStream();

        FileInputStream fis = null;

        try {
        	
            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, out);
            
        } catch (Exception e) {
			e.printStackTrace();
        } finally {
        	if(fis != null) {
        		try { 
        			fis.close(); 
        		}catch (IOException e) {
        			e.printStackTrace();
        		}
        	}
        }
        out.flush();
	}

}