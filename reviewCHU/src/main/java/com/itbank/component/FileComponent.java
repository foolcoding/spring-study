package com.itbank.component;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileComponent {

	private String saveDirectory = "C:\\upload";
	
	public FileComponent() {
		File f = new File(saveDirectory);
		if(f.exists() == false) {
			f.mkdirs();
		}
	}
	
	public String upload(MultipartFile f) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String name = sdf.format(today);
		name += f.getOriginalFilename();
		
		File dest = new File(saveDirectory, name);
		try {
			f.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return name;
	}
	
}
