package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String memberId = request.getParameter("member-id");
//		String memberPw = request.getParameter("member-pw");
//		Member member = new Member(memberId, memberPw);
//		
//		// SELECT * FROM MEMBER_TBL WHERE MEMBER_ID = ? AND MEMBER_PW = ?
//		// 결과값이 ResultSet이고 한개이므로 Member임
//		MemberService service = new MemberService();
//		Member mOne = service.selectCheckLogin(member);
////		int result = service.selectCheckLogin(member);
//		// Member mOne = service.selectCheckLogin(memberId, memberPw); 상황에 따라 이렇게 할 수도 있음
//		if(mOne != null) {
//			HttpSession session = request.getSession();
//			// session은 전역변수처럼 어느 페이지에서든 접근 가능함
//			session.setAttribute("memberId", mOne.getMemberId()); // 개인정보에 민감하지 않은 것들만 넣어줌
//			session.setAttribute("memberName", mOne.getMemberName());
//			// 로그인 성공!
//			request.setAttribute("msg", "로그인 성공!");
//			request.setAttribute("url", "/index.jsp");
//			RequestDispatcher view = request.getRequestDispatcher("/member/serviceSuccess.jsp");
//			view.forward(request, response);
//		}else {
//			// 로그인 실패
//			request.setAttribute("msg", "로그인 실패!");
//			RequestDispatcher view = request.getRequestDispatcher("/member/serviceFailed.jsp");
//			view.forward(request, response);
//		}
//	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("member-id");
		String memberPw = request.getParameter("member-pw");
		Member member = new Member(memberId, memberPw);
		
		// SELECT * FROM MEMBER_TBL WHERE MEMBER_ID = ? AND MEMBER_PW = ?
		// 결과값이 ResultSet이고 한개이므로 Member임
		MemberService service = new MemberService();
		int result = service.selectCheckLogin(member);
		// Member mOne = service.selectCheckLogin(memberId, memberPw); 상황에 따라 이렇게 할 수도 있음
		if(result > 0) {
			HttpSession session = request.getSession();
			// session은 전역변수처럼 어느 페이지에서든 접근 가능함
			session.setAttribute("memberId", memberId); // 개인정보에 민감하지 않은 것들만 넣어줌
			// 로그인 성공!
			request.setAttribute("msg", "로그인 성공!");
			request.setAttribute("url", "/index.jsp");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/serviceSuccess.jsp");
			view.forward(request, response);
		}else {
			// 로그인 실패
			request.setAttribute("msg", "로그인 실패!");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/serviceFailed.jsp");
			view.forward(request, response);
		}
	}
}
