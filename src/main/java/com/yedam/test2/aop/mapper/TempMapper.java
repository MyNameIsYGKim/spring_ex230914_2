package com.yedam.test2.aop.mapper;

import org.apache.ibatis.annotations.Insert;

public interface TempMapper {
	@Insert("INSERT INTO tbl_temp VALUES (#{value})")
	public void insert(String value);
}
