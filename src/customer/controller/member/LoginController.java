package customer.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.vo.Notice;

public class LoginController implements Controller{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		System.out.println("========== < LoginController > ==========");
	
		request.getRequestDispatcher("loginForm.jsp").forward(request, response);
	// .jsp 이거 안 써서 오류 떳었음
	}
}