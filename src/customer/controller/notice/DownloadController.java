package customer.controller.notice;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.controller.Controller;
import customer.dao.NoticeDao;
import customer.vo.Notice;

public class DownloadController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		System.out.println("========== < DownloadController > ==========");
	
		String path=request.getParameter("p"); //노티스디테일
		String fname=request.getParameter("f"); //노티스디테일
		String urlPath=path+fname;
		String realPath= request.getServletContext().getRealPath(urlPath);
		// ↑ 웹 어플리케이션의 경로를 구하는 예제
		//System.out.println("urlPath : "+urlPath);
		System.out.println("realPath : "+realPath);
		
		response.setHeader("Content-Disposition", "attachment;filename="+new String(fname.getBytes(),"ISO8859_1"));
		//setHeader(String name, String value)
		
		//file open..
		FileInputStream fin=new FileInputStream(realPath);
		//파일을 읽어올 때에는 FileInputStream으로 읽어온 뒤 브라우저에 출력할 때에는 ServletOutputStream을 사용한다.
		//ServletOutputStream의 용도는 게시판에 파일을 올릴 때 사용한다.
		//ServletOutputStream 은 추상클래스이기 때문에 인스턴스를 생성할 수 없다.
		ServletOutputStream sout=response.getOutputStream();
		
		byte[] buf=new byte[1024]; //1024byte=1kb(1kb씩 저장하도록)
		int size=0;
		while ((size=fin.read(buf, 0, 1024))!=-1) { //계속 받다가 끝나면 -1로 끝 // fin으로부터 읽은 데이터를 buffer에 저장
			sout.write(buf, 0, size); // buf의 데이터를 sout에 씀
		}
		/*size=fin.read(buf, 0, 1024); //깨질수 있음(그래서 반복 와일문)
				sout.write(buf, 0, size);*/
		fin.close();
		sout.close();
			
		
	}	
}
