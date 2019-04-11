package kr.ca.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.MemberDTO;
import kr.ca.domain.OrderDTO;
import kr.ca.domain.OrderDetailDTO;
@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.OrderMapper";

	@Override
	public List<OrderDetailDTO> getDetailList(String id) {
		List<OrderDetailDTO> detailList = session.selectList(NS+".getDetailList", id);
		return detailList;
	}

	@Override
	public void setOrderMemberInfo(String id, OrderDTO order) {
		MemberDTO mdto = session.selectOne(NS+".setOrderMemberInfo", id);
		order.setName(mdto.getName());
		order.setAddress(mdto.getAddress());
		order.setPostNum(mdto.getPostNum());
		order.setDtl_adres(mdto.getDTL_ADRES());
		order.setPhone(mdto.getPhone());
	}
}
