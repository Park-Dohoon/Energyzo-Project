package com.energyzo.javaproject.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.energyzo.javaproject.model.vo.Adm_ItemsVO;
import com.energyzo.javaproject.model.vo.Adm_ManageVO;

@Repository
public class Adm_ManageDaoImpl implements Adm_ManageDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Adm_ManageVO> listPopupAll(Adm_ManageVO vo) {
		System.out.println("managedaoimpl listpopall 도착");
		List<Adm_ManageVO> list = sqlSession.selectList("dao.ManageDao.getPopList", vo);
		
		System.out.println("Managedaoimpl listpopall 출발");
		
		return list;
	}
	
	
	

    // 페이징 처리된 옵션 목록 조회
    @Override
    public List<Adm_ManageVO> paging(int startRow, int pageSize) {
        return sqlSession.selectList("dao.ManageDao.paging", 
                                      new Object[] { startRow, pageSize });
    }
	
    // 전체 옵션 개수 조회
    @Override
    public int countOptions() {
        // MyBatis 매퍼의 쿼리를 호출
        return sqlSession.selectOne("dao.ManageDao.countOptions");
    }

    // 옵션 추가
    @Override
    public void insertOption(String estOptName) {
        // MyBatis 매퍼의 쿼리를 호출하여 옵션을 추가
        sqlSession.insert("dao.ManageDao.insertOption", estOptName);
    }

    // 옵션 삭제
    @Override
    public void deleteOption(int estOptNum) {
        // MyBatis 매퍼의 쿼리를 호출하여 옵션을 삭제
        sqlSession.delete("dao.ManageDao.deleteOption", estOptNum);
    }

    
    @Override
    // 포인트 종합
    public List<Adm_ManageVO> getTotal_point(Map<String, String> datepoint) {
    	System.out.println("Adm_ManageDaoImpl total_point 도착");
    	// 맵퍼 통해 포인트 호출
    	
    	List<Adm_ManageVO> list = sqlSession.selectList("dao.ManageDao.getTotalPoint",datepoint);
    	
    	System.out.println("adm_manageDaoImpl totalpoint"+list);
    	
    	System.out.println("Adm_ManageDaoImpl total_point 출발");
    	return list;
    }
	
    
    @Override
    // 포인트 목록
    public List<Adm_ManageVO> getPoint_list(Map<String, String> datepoint) {
    	System.out.println("Adm_ManageDaoImpl pointlist 도착");
    	// 맵퍼 통해 포인트 호출
    	
    	List<Adm_ManageVO> list = sqlSession.selectList("dao.ManageDao.getPoint_list",datepoint);
    	
    	System.out.println("adm_manageDaoImpl pointlist"+list);
    	
    	System.out.println("Adm_ManageDaoImpl pointlist 출발");
    	return list;
    }
    
    
    
    @Override
    // 포인트 종합
    public List<Adm_ManageVO> getTotal_item(Map<String, String> datepoint) {
    	System.out.println("Adm_ManageDaoImpl total_point 도착");
    	// 맵퍼 통해 상품 통계 호출
    	
    	List<Adm_ManageVO> list = sqlSession.selectList("dao.ManageDao.getItemStatus",datepoint);
    	
    	System.out.println("adm_manageDaoImpl totalpoint"+list);
    	
    	System.out.println("Adm_ManageDaoImpl total_point 출발");
    	return list;
    }
	
    
    @Override
    // 포인트 목록
    public List<Adm_ItemsVO> getTotal_item_list(Map<String, String> datepoint) {
    	System.out.println("Adm_ManageDaoImpl pointlist 도착");
    	// 맵퍼 통해 상품 호출
    	
    	List<Adm_ItemsVO> list = sqlSession.selectList("dao.ItemsDao.getItemlist",datepoint);
    	
    	System.out.println("adm_manageDaoImpl pointlist"+list);
    	
    	System.out.println("Adm_ManageDaoImpl pointlist 출발");
    	return list;
    }
    

}
