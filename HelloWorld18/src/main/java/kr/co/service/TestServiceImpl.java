package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.dao.TestDAO;
import kr.co.domain.TestDTO;

@Service
public class TestServiceImpl implements TestService {

	@Inject
	private TestDAO dao;

	@Override
	public void insert(TestDTO dto, Model model) {
		dao.insert(dto, model);
	}

	@Override
	public List<TestDTO> list() {
		return dao.list();
	}

	@Override
	public void write(TestDTO dto) {
		dao.write(dto);
	}

	@Override
	public TestDTO read(int num) {
		return dao.read(num);
	}

	@Override
	public void update(TestDTO dto) {
		dao.update(dto);
	}

	@Override
	public void delete(int num) {
		dao.delete(num);
	}

}
