package customer.controller.notice;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.vo.Notice;

public class NoticeRegProcController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		System.out.println("========== < NoticeRegProcController > ==========");

		String path = "customer/upload";
		/*왜 폴더를 추가로 만드는지 현우한테 물어봤눈데
		upload 폴더안에 아무것도 없으면 실제 컴퓨터 경로에는 폴더가 없을 수 있어서 넣었던 것 같다고함*/
		ServletContext ctx = request.getServletContext();
		path = ctx.getRealPath(path); // path를 넣어주면 진짜 주소를 가져올 수 있음
		System.out.println("real path~~ : " + path);

		MultipartRequest req = new MultipartRequest(request, path, 10 * 1024 * 1024, "utf-8",
				new DefaultFileRenamePolicy()); // 이거 입력하면 파일 올라감
		//request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy()
		//enctype="multipart"라고 써서 multipart로 받음
		//new DefaultFileRenamePolicy() 중복이름에 +1이라고 생각하면 됌
		
		String uid = req.getParameter("uid");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String originalFile = req.getOriginalFileName("file");
		String file = req.getFilesystemName("file");

		System.out.println("title : " + title);
		System.out.println("file : " + file);

		// String uid=request.getParameter("uid");
		// String title=request.getParameter("title");
		// String content=request.getParameter("content");

		Notice n = new Notice();
		n.setTitle(title);
		n.setContent(content);
		n.setWriter(uid);
		n.setFilesrc(file);
		//System.out.println("uid : " + uid);

		NoticeDao dao = new NoticeDao();
		int af = dao.write(n);

		if (af > 0)
			response.sendRedirect("notice.do");
		// else
		// out.println("글쓰기오류");
	}
}
