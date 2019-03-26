package kr.co.dao;

import java.util.List;

import org.springframework.ui.Model;

import kr.co.domain.TestDTO;

public interface TestDAO {
	public void insert(TestDTO dto, Model model);
	public List<TestDTO> list();
	public void write(TestDTO dto);
	public TestDTO read(int num);
	public void update(TestDTO dto);
	public void delete(int num);
}
