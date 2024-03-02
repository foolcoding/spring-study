package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.Upload2DTO;

@Repository
public interface Ex04DAO {
	
	@Insert(" insert into upload2 (memo, originalFileName, storeFileName) "
			+ " values (#{memo}, #{originalFileName}, #{storeFileName}) ")
	int insertMultiple(Upload2DTO dto);

	@Select("select * from upload2 order by idx")
	List<Upload2DTO> selectList();

}
