package com.energyzo.javaproject.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.energyzo.javaproject.model.vo.Adm_SalesVO;

@Repository
public class Adm_SalesDaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Adm_SalesVO> listallSales(Adm_SalesVO vo) {				//UserDao의 함수 값과 일치
		System.out.println("SalesDaoImpl listallsales 도착");
		List<Adm_SalesVO> list = sqlSession.selectList("dao.SalesDao.getSalesList", vo); //UserMapper의 namespace와 일치 + id값 일치
		System.out.println("SalesDaoImpl listallsales 출발");
		return list;
	}
	
	
	public List<Adm_SalesVO> listSalesApply(Adm_SalesVO vo) {				//UserDao의 함수 값과 일치
		System.out.println("SalesDaoImpl getSalesApply 도착");
		List<Adm_SalesVO> list = sqlSession.selectList("dao.SalesDao.getSalesApply", vo); //UserMapper의 namespace와 일치 + id값 일치
		System.out.println("SalesDaoImpl getSalesApply 출발");
		return list;
	}
	
	
	public Adm_SalesVO detailSalesApply(Adm_SalesVO id) {
		System.out.println("salesdaoimpl detailsalesapply 진입");
		Adm_SalesVO list = sqlSession.selectOne("dao.SalesDao.getDetailSaleApply",id);
		System.out.println("list : "+list);
		
		System.out.println("salesdaoimpl detailsalesapply 출발");
		return list;
	}
	
	
	public void rejectSalesApply(Adm_SalesVO vo) {
	    System.out.println("salesdaoimpl rejectSalesApply 진입");
	    // agent_num을 이용해 해당 데이터를 삭제하는 쿼리 실행
	    sqlSession.delete("dao.SalesDao.deleteRejectSalesApply", vo);
	    System.out.println("rejectSalesApply 완료");
	}
	
	public void approveSalesApply(Adm_SalesVO vo) {
	    System.out.println("salesdaoimpl approveSalesApply 진입");
	    // agent_num을 이용해 agent_reg_state를 2로 업데이트하는 쿼리 실행
	    sqlSession.update("dao.SalesDao.updateApproveSalesApply", vo);
	    System.out.println("approveSalesApply 완료");
	}
	
}
