package help.model.nr;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import help.domain.nr.FaqVO;
import help.domain.nr.HelpVO;

public interface HelpDAO {

	// 마이페이지 - 1:1 문의내역 - faq q, a 얻어오기
	List<FaqVO> viewfaq(String userid) throws SQLException;

	// 고객센터 - 자주하는 질문 select
	List<HelpVO> faqlist(String category) throws SQLException;

	// 고객센터 - 자주하는 질문 총 페이지 수
	int getTotalPage(Map<String, String> paramap) throws SQLException;

	// 고객센터 - 자주하는 질문 페이징처리
	List<HelpVO> faqlist_paging(Map<String, String> paramap) throws SQLException;

	// 고객센터 - 자주하는 질문 총 개수
	int getTotalFaqCount(Map<String, String> paramap) throws SQLException;

}