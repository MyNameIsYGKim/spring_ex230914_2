package com.yedam.test2.emp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.test2.emp.mapper.EmpMapper;
import com.yedam.test2.emp.service.EmpVO;

@Controller
public class EmpController {
	
	@Autowired
	EmpMapper empMapper;
	
	// get: 조회, 빈페이지 요청
	// 그외(post, delete, put): 등록, 수정, 삭제
	
	//@RequestMapping(value="empForm", method=RequestMethod.GET) // value or path
	@GetMapping("empForm")	// RequestMapping은 method 설정 가능.
	public void getEmpInfoForm() {}
	
	@GetMapping("getEmp") // 커맨드 객체
	public String getEmpData(EmpVO empVO, Model model) {
		EmpVO findVO = empMapper.selectEmpInfo(empVO);
		model.addAttribute("empInfo", findVO);
		
		return "empForm";
	}
	
	@GetMapping("getEmpData")
	// @Requestparam(객체가 아닌 기본 타입, String과 같이 단일 값 처리)
	// -> defaultValue: 데이터가 없을 때, 기본값 지정.
	// -> name: 파라미터 이름 지정(보통은 변수명이 key값).
	// -> required: (기본값은 =true) 필수 여부 체크.
	//						=false면 데이터가 없을 때 null이 들어감
	public String getEmpData(@RequestParam(defaultValue = "100"
											, name = "eId"
											, required = true) 
								Integer employeeId, Model model) {
		EmpVO empVO = new EmpVO();
		empVO.setEmployeeId(employeeId);
		
		EmpVO findVO = empMapper.selectEmpInfo(empVO);
		model.addAttribute("empInfo", findVO);
		return "empForm";
	}
	
	@GetMapping("emp/{id}")
	public String getEmpData2(@PathVariable(name = "id") 
					Integer employeeId, Model model) {
		EmpVO empVO = new EmpVO();
		empVO.setEmployeeId(employeeId);
		
		EmpVO findVO = empMapper.selectEmpInfo(empVO);
		model.addAttribute("empInfo", findVO);
		return "empForm";
	}
	
	@PostMapping("empInfoInsert")
	public String empInfoInsert(@RequestBody EmpVO empVO) {
		int result = empMapper.insertEmpInfo(empVO);
		System.out.println("결과 : " + empVO.getEmployeeId());
		return "empForm";
	}
	
	
}









