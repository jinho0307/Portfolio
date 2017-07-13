package com.seven.sins.util;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("fileUtils")
public class FileUtils {
	
	@Value("#{dir['dir.url']}")
	private String dir;
     
    public String fileInfo(String userid, MultipartFile file) throws Exception{
        
    	long time = System.currentTimeMillis();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        
    	String originalFileName = file.getOriginalFilename();
        String originalFileExtension = sdf.format(new java.sql.Date(time)) + "=" + originalFileName;
        
        String filePath = dir + userid + "/" + originalFileExtension;
        File sFile = new File(filePath);
        file.transferTo(sFile);
           
        return originalFileExtension;
    }
}