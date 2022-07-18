package dao;

import java.lang.reflect.Member;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.eclipse.jdt.internal.compiler.apt.model.Factory;

import service.MyBatisConnector;
import vo.MemberVo;

public class MemberDao {
	
	//SqlSessionFactory����
	SqlSessionFactory factory;
	
	//single-ton : ��ü 1���� �����ؼ� �������
	static MemberDao single = null;

	public static MemberDao getInstance() {

		//��ü�� ������ �����ض�
		if (single == null)
			single = new MemberDao();

		return single;
	}

	//�ܺο��� �������� ����
	private MemberDao() {
		// TODO Auto-generated constructor stub
		
		//facetory����
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
		
	}
	
	//��ü��ȸ
	public List<MemberVo> selectList(){
		
		List<MemberVo> list = null;
		
		//1. SqlSession���
		SqlSession sqlSession = factory.openSession();
		
		//2. ����
		list = sqlSession.selectList("member.member_list");
		
		//3. �ݱ�
		sqlSession.close();
		
		return list;
	}
	
	//m_id�� �ش��ϴ� ��ü 1�� ���ϱ�
	public MemberVo selectOne(String m_id){
		
		MemberVo vo = null;
		
		//1. SqlSession���
		SqlSession sqlSession = factory.openSession();
		
		//2. ����
		vo = sqlSession.selectOne("member.member_one_m_id", m_id);
		
		//3. �ݱ�
		sqlSession.close();
		
		return vo;
	}
	
	public int insert(MemberVo vo) {
			// TODO Auto-generated method stub
			int res = 0;
			
			//1.SqlSession���
			SqlSession sqlSession = factory.openSession(true);//auto commit
			
			//2.����
			res = sqlSession.insert("member.member_insert",vo);
			//3.�ݱ�
			sqlSession.close();
			
			return res;
		}
	
	//m_idx�� �ش� ��ü �޾ƿ���
	public MemberVo selectOne(int m_idx) {
		
		MemberVo vo = null;
		
		//1. SqlSession���
		SqlSession sqlSession = factory.openSession();
		
		//2. ����
		vo = sqlSession.selectOne("member.member_one_m_idx", m_idx);
		
		//3. �ݱ�
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
		
		//1. SqlSession���
		SqlSession sqlSession = factory.openSession(true);
		
		//2. ����
		res = sqlSession.delete("member.member_delete", m_idx);
		
		//3. �ݱ�
		sqlSession.close();
		
		return res;
		
	}

		
	
	
	
}
