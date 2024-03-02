package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.Upload1DTO;
import com.itbank.repository.UploadDAO;

@Service
public class UploadService {

	@Autowired private UploadDAO dao;
	
	private String saveDirectory = "C:\\upload";
	
	public UploadService() {
		// 스프링 빈이 생성될때 (=서버가 시작될때) saveDirectory 경로를 체크하고 없으면 새로 만든다
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}
	
	public int upload(Upload1DTO dto) {
		// originalFileName과 storeFileName을 만들어서 dto에 넣어주고 dao로 넘겨야 한다
		String originalFileName = dto.getUpload().getOriginalFilename();
		System.out.println(originalFileName);
		
		// 마지막 .의 위치부터 끝까지 잘라낸다
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		// 새로 저장될 이름은 중복되지 않도록 UUID를 사용한다
		String storeFileName = UUID.randomUUID().toString().replace("-", "");
		storeFileName += ext;
		System.out.println(storeFileName);
		
		File f = new File(saveDirectory, storeFileName);
		try {
			dto.getUpload().transferTo(f);
			// MultipartFile -> (지정한 위치의 저장장치)java.io.File
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		dto.setOriginalFileName(originalFileName);
		dto.setStoreFileName(storeFileName);
		
		return dao.insert(dto);
	}
	
	public List<Upload1DTO> getList() {
		return dao.selectList();
	}

	public int delete(int idx) {
		// DB에서 데이터를 삭제하기 전에, 데이터를 불러와서, 실제 지정된 파일도 삭제하고, 데이터를 삭제한다
		Upload1DTO dto = dao.selectOne(idx);
		File f = new File(saveDirectory, dto.getStoreFileName());
		if(f.exists()) {
			f.delete();
		}
		return dao.delete(idx);
	} 
	
}
