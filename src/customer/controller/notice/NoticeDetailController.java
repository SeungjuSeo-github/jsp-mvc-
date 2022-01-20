package customer.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.vo.Notice;

public class NoticeDetailController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		System.out.println("========== < NoticeDetailController > ==========");
		// jsp에 코드블록(<% %>)으로 쓰여있던 자바의 코드를 자바로 빼서 컨트롤러로 관리하는 것 (jspWeb6_mvc1이랑 비교해볼 것)
		String seq=request.getParameter("c");
		String hit=request.getParameter("h");
		//System.out.println("~~~~~"+hit); --확인용
		// System.out.println("seq : "+seq); // 콘솔창에 신호가 찍히게 하려면 .do로 끝나는 주소여야 됨
		NoticeDao dao=new NoticeDao();
		Notice n=dao.getNotice(seq,hit);
		// System.out.println("title : "+n.getTitle());
		
		// Notice를 n이라는 이름으로 request(내장객체)에 저장
		request.setAttribute("n", n); // "n"은 jsp에서 ${n.seq } 앞에 있는 n이다, nt로 바꾸면 ${nt.seq } 이렇게 써줘야 됨
		// noticeDetail.jsp로 보내면서 request도 함께 포워딩
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
	}
}

// session의 경우 브라우져에 정보가 남아있고 setAttribute는 보내주고 나면 정보가 사라짐
// (로그인 처리는 session을 쓰고, 정보를 주고 받을 때는 attribute를 사용하는 게 맞음)

/*String seq=request.getParameter("c");
String hit=request.getParameter("h");
System.out.println(hit);
NoticeDao dao=new NoticeDao();

if(hit != null) {
   int hitUp = dao.hitUpdate(seq, hit);
   if(hitUp>0) {
      System.out.println("Hit Up Success");
   }else {
      System.out.println("Hit Up failed");
   }
}

Notice n=dao.getNotice(seq);

request.setAttribute("n", n); 
request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
}
} 오버라이딩의 방법*/