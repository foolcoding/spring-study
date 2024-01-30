package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itbank.Mc.McDTO;

public interface McDAO {

	@Select("select * from mcdonald order by idx")
	List<McDTO> selectList();

	@Insert("insert into mcdonald (category, name, price, memo, imgName)"
			+ "values (#{category}, #{name}, #{price}, #{memo}, #{imgName})")
	int add(McDTO dto);

	@Delete("delete mcdonald where idx = #{idx}")
	int delete(int idx);

	@Select("select * from mcdonald where idx = #{idx}")
	McDTO selectOne(int idx);

	@Update(" update mcdonald set category=#{category}, name=#{name}, "
			+ " price=#{price}, memo=#{memo}, imgName=#{imgName} where idx = #{idx}")
	int modify(McDTO dto);

//	"<script>
//	select * from mcdonald 
//	<if test=\"category != null\">
//	where category = #{category}
//	</if>
//	order by idx
//	</script>"
	@Select("select * from mcdonald where category = #{category}")
	List<McDTO> McListByCategory(String category);

	@Select("select * from mcdonald where ${searchType} like '%' || #{searchKeyword} || '%'")
	List<McDTO> getMcSearchList(HashMap<String, String> paramMap);
 
	
}
