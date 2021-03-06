package kr.ca.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		List<OrderDetailDTO> detailList = session.selectList(NS + ".getDetailList", id);
		return detailList;
	}

	@Override
	public void setOrderMemberInfo(OrderDTO order) {
		MemberDTO mdto = session.selectOne(NS + ".setOrderMemberInfo", order.getId());
		order.setName(mdto.getName());
		order.setAddress(mdto.getAddress());
		order.setPostNum(mdto.getPostNum());
		order.setDtl_adres(mdto.getDTL_ADRES());
		order.setPhone(mdto.getPhone());
	}

	@Override
	public boolean checkPoint(String id, int total_price) {
		int point = session.selectOne(NS + "." + "" + "checkPoint", id);
		return point >= total_price ? true : false;
	}

	@Override
	public void complete(OrderDTO order) {
		int ono = getOno();
		order.setOno(ono);
		if (order.getShipping_memo() != null) {
			order.setShipping_memo(" ");
		}
		order.setPayment_status("true");

		session.insert(NS + ".complete", order);

		List<OrderDetailDTO> detailList = order.getDetailList();
		for (OrderDetailDTO oddto : detailList) {
			int odno = getOdno();
			oddto.setOdno(odno);
			oddto.setOno(ono);
			session.insert(NS + ".completeDetail", oddto);
		}
	}

	private int getOno() {
		Integer ono = session.selectOne(NS + ".getOno");
		if (ono != null)
			ono += 1;
		else
			ono = 1;

		return (int) ono;
	}

	private int getOdno() {
		Integer odno = session.selectOne(NS + ".getOdno");
		if (odno != null)
			odno += 1;
		else
			odno = 1;

		return (int) odno;
	}

	@Override
	public void resetShoppingCart(String id) {
		session.delete(NS + ".resetShoppingCart", id);
	}

	@Override
	public void pointSpending(String id, int total_price) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("total_price", total_price);
		session.update(NS + ".pointSpending", map);
	}

	@Override
	public List<OrderDTO> list(String id) {
		return session.selectList(NS + ".list", id);
	}

	@Override
	public OrderDTO readOrder(int ono) {
		return session.selectOne(NS + ".readOrder", ono);
	}

	@Override
	public void setDetailList(OrderDTO order) {
		List<OrderDetailDTO> detailList = session.selectList(NS + ".setDetailList", order.getOno());
		order.setDetailList(detailList);
	}

}
