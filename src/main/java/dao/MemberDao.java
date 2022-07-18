package dao;

import java.lang.reflect.Member;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.eclipse.jdt.internal.compiler.apt.model.Factory;

import service.MyBatisConnector;
import vo.MemberVo;

public class MemberDao {
	
	//SqlSessionFactory생성
	SqlSessionFactory factory;
	
	//single-ton : 객체 1개만 생성해서 사용하자
	static MemberDao single = null;

	public static MemberDao getInstance() {

		//객체가 없으면 생성해라
		if (single == null)
			single = new MemberDao();

		return single;
	}

	//외부에서 생성하지 말것
	private MemberDao() {
		// TODO Auto-generated constructor stub
		
		//facetory선언
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
		
	}
	
	//전체조회
	public List<MemberVo> selectList(){
		
		List<MemberVo> list = null;
		
		//1. SqlSession얻기
		SqlSession sqlSession = factory.openSession();
		
		//2. 실행
		list = sqlSession.selectList("member.member_list");
		
		//3. 닫기
		sqlSession.close();
		
		return list;
	}
	
	//m_id에 해당하는 객체 1건 구하기
	public MemberVo selectOne(String m_id){
		
		MemberVo vo = null;
		
		//1. SqlSession얻기
		SqlSession sqlSession = factory.openSession();
		
		//2. 실행
		vo = sqlSession.selectOne("member.member_one_m_id", m_id);
		
		//3. 닫기
		sqlSession.close();
		
		return vo;
	}
	
	public int insert(MemberVo vo) {
			// TODO Auto-generated method stub
			int res = 0;
			
			//1.SqlSession얻기
			SqlSession sqlSession = factory.openSession(true);//auto commit
			
			//2.실행
			res = sqlSession.insert("member.member_insert",vo);
			//3.닫기
			sqlSession.close();
			
			return res;
		}
	
	//m_idx로 해당 객체 받아오기
	public MemberVo selectOne(int m_idx) {
		
		MemberVo vo = null;
		
		//1. SqlSession얻기
		SqlSession sqlSession = factory.openSession();
		
		//2. 실행
		vo = sqlSession.selectOne("member.member_one_m_idx", m_idx);
		
		//3. 닫기
		sqlSession.close();
		
		return vo;
	}
	
	public int update(MemberVo vo) {
		
		int res = 0;
		
		SqlSession sqlSession = factory.openSession(true);
		
		res = sqlSession.update("member.member_update", vo);
		
		sqlSession.close();
		
		
		return res;
	}

	public int delete(int m_idx) {
		// TODO Auto-generated method stub
		
		int res = 0;
		
		//1. SqlSession얻기
		SqlSession sqlSession = factory.openSession(true);
		
		//2. 실행
		res = sqlSession.delete("member.member_delete", m_idx);
		
		//3. 닫기
		sqlSession.close();
		
		return res;
		
	}

		
	
	
	
}
