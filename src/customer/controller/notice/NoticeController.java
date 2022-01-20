package customer.controller.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.vo.Notice;

public class NoticeController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		System.out.println("========== < NoticeController > ==========");
	
		//  search
		String field=request.getParameter("f");
		System.out.println("field : "+field); //타이틀이 들어올 수 있고 컨텐트가 들어올 수 있음
		if (field==null || field.equals("")) 
			field="title";
		
		String query=request.getParameter("q");
		System.out.println("query : "+query);
		if (query==null)
			query="";
		
		// DB에서 notices 테이블에 있는 내용 모두를 조회 --> 이 곳에 가져오기
		
		// dao에 있는 메소드(noticeSelAll()) 리턴값을 받으면 됨
		NoticeDao dao=new NoticeDao();
		List<Notice> list=dao.noticeSelAll(field,query); //타이틀or내용+쿼리
		//노티스다오에 return list;가 일로 감
		
		// List<Notice>를 request(내장객체)에 저장
		request.setAttribute("list", list);
		request.setAttribute("query", query);
		// notice.jsp로 보내면서 request도 함께 포워딩
		request.getRequestDispatcher("notice.jsp").forward(request, response);
		
	}
}
