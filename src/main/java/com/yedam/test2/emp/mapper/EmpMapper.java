package com.yedam.test2.emp.mapper;

import java.util.List;

import com.yedam.test2.emp.service.EmpVO;

public interface EmpMapper {
	// 전체조회
	public List<EmpVO> selectEmpAllList(EmpVO empVO);
	
	// 단건조회
	public EmpVO selectEmpInfo(EmpVO empVO);
	
	// 등록
	public int insertEmpInfo(EmpVO empVO);
	
	// 수정 - 급여를 정해진 비율로 인상
	public int updateEmpSal(int employeeId, int raise);
	
	// 수정 - 사원 정보 수정
	public int updateEmpInfo(EmpVO empVO);
	
	// 삭제
	public int deleteEmpInfo(int employeeId);
}
