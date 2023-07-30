package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/member/update.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String memberId = request.getParameter("member-id");
		String memberPw = request.getParameter("member-pw");
		String memberGender = request.getParameter("member-gender");
		String memberEmail = request.getParameter("member-email");
		String memberAddress = request.getParameter("member-addr");
		String memberPhone = request.getParameter("member-phone");
		String memberHobby = request.getParameter("member-hobby");
		// UPDATE MEMBER_TBL SET MEMBER_PW = ?, MEMBER_EMAIL = ?, MEMBER_PHONE = ?, MEMBER_ADDRESS = ?, MEMBER_HOBBY = ?, UPDATE_DATE = SYSDATE WHERE MEMBER_ID = ?
		MemberService service = new MemberService();
		Member member = new Member(memberId, memberPw, memberGender, memberEmail, memberAddress, memberPhone, memberHobby);
		int result = service.updateMember(member);
		if(result > 0) {
			// 성공
			request.setAttribute("msg", "수정됐다능~");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}else {
			// 실패
			request.setAttribute("msg", "수정을 완료하지 못했는데 괜찮으시겠어요?~.~");
			request.getRequestDispatcher("/member/serviceFailed.jsp").forward(request, response);
		}
		
	}

}
