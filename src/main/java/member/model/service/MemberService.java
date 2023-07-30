package member.model.service;

import java.sql.*;

import common.JDBCTemplate;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {
	private JDBCTemplate jdbcTemplate;
	private MemberDAO mDao;
	
	public MemberService() {
//		jdbcTemplate = new JDBCTemplate();
		jdbcTemplate = JDBCTemplate.getInstance();
		mDao = new MemberDAO();
	}
	// 연결 생성
	// DAO 호출
	// 커밋/롤백	
	public int insertMember(Member member) {
		// 연결 생성
		Connection conn = jdbcTemplate.createConnection();
		// DAO 호출
		int result = mDao.insertMember(conn, member);
		// 커밋/롤백 : 트랜잭션처리(다중작업)하지 않을거면 굳이 오토커밋 해제 안해도 됨
		if(result > 0) {
			// 성공 - 커밋
			jdbcTemplate.commit(conn);
		} else {
			// 실패 - 롤백
			jdbcTemplate.rollback(conn);
		}
		jdbcTemplate.close(conn);
		return result;
	}
	public int updateMember(Member member) {
		Connection conn = jdbcTemplate.createConnection();
		int result = mDao.updateMember(conn, member);
		if(result > 0) {
			jdbcTemplate.commit(conn);
		} else {
			jdbcTemplate.rollback(conn);
		}
		jdbcTemplate.close(conn);
		return result;
	}
	public int deleteMember(String memberId) {
		Connection conn = jdbcTemplate.createConnection();
		int result = mDao.deleteMember(conn, memberId);
		if(result > 0) {
			jdbcTemplate.commit(conn);
		} else {
			jdbcTemplate.rollback(conn);
		}
		jdbcTemplate.close(conn);
		return result;
	}
//	public Member selectCheckLogin(Member member) {
//		// 연결 생성
//		Connection conn = jdbcTemplate.createConnection();
//		// DAO 호출(연결도 넘겨줘야함) (Select는 커밋/롤백 필요없음)
//		Member mOne = mDao.selectCheckLogin(conn, member);
//		jdbcTemplate.close(conn);
//		return mOne;
//	}
	public int selectCheckLogin(Member member) {
		// 연결 생성
		Connection conn = jdbcTemplate.createConnection();
		// DAO 호출(연결도 넘겨줘야함) (Select는 커밋/롤백 필요없음)
		int result = mDao.selectCheckLogin(conn, member);
		jdbcTemplate.close(conn);
		return result;
	}
	public Member selectOneById(String memberId) {
		// 연결 생성
		Connection conn = jdbcTemplate.createConnection();
		// DAO 호출(연결도 넘겨줘야함)
		Member member = mDao.selectOneById(conn, memberId);
		jdbcTemplate.close(conn);
		return member;
	}
	
}
