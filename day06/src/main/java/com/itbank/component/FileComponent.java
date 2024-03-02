package com.itbank.component;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

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
		String originalFileName = f.getOriginalFilename();
		String storeFileName = UUID.randomUUID().toString().replace("-", "");
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		storeFileName += ext;
		
		File dest = new File(saveDirectory, storeFileName);
		try {
			f.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return storeFileName;
	}
	
}
