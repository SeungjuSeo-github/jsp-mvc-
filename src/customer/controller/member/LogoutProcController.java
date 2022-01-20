package customer.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;

import customer.controller.Controller;
import customer.dao.MemberDao;
import customer.dao.NoticeDao;
import customer.vo.Member;
import customer.vo.Notice;

public class LogoutProcController implements Controller{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		System.out.println("========== < LoginProcController > ==========");
	
		//로그아웃처리
		request.getSession().invalidate();
		response.sendRedirect("../customer/notice.do");
	}
}