package com.mybook.app;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mybook.dto.Books;
import com.mybook.dto.BooksCategory;
import com.mybook.dto.Notice;
import com.mybook.dto.PageDTO;
import com.mybook.service.NoticeService;

import lombok.extern.java.Log;

@Log
@RequestMapping("/admin/a_notice/*")
@Controller
public class NoticeController {
	@Autowired
	private NoticeService nservice;
	@Autowired
	private String uploadPath;
	
	
	@GetMapping("a_notice")
	public String a_notice(Model model, HttpSession session, String pageNum) {
		String sessid = (String) session.getAttribute("sessid");
		if("admin".equals(sessid)) {
			pageNum = pageNum==null?"1":pageNum;
			int page=Integer.parseInt(pageNum);
			
			HashMap<String, Object> hm = new HashMap<>();
			int cnt = nservice.getCount(hm);
			int totalCount = cnt;
			
			int pageSize=5;
			int pageBlock= 3;
			int pageCount = (int) Math.ceil((double) totalCount / pageSize);
			int startPage = ((page / pageBlock) - (page % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
			
			int endPage = startPage + pageBlock - 1;
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			PageDTO pageDto = new PageDTO();
			pageDto.setPageCount(pageCount);
			pageDto.setPageBlock(pageBlock);
			pageDto.setStartPage(startPage);
			pageDto.setEndPage(endPage);
			pageDto.setTotalCount(totalCount);
			pageDto.setPageNum(pageNum);
			
			int startRow =(page-1)*pageSize;
			hm.put("startRow",startRow);
			hm.put("pageSize", pageSize);
			
			List<Notice> lists = nservice.findAllwithPage(hm);
			
			model.addAttribute("Noticelist", lists);
			model.addAttribute("count", cnt);
			model.addAttribute("pageDto",pageDto);
			return "/admin/a_notice/a_notice";
		
		
		}else {
			return "redirect:/";
		}
	
	}
	
	@GetMapping("a_notice_insert")
	public String a_notice_insert() {
		return "/admin/a_notice/a_notice_insert";
	}
	
	
	@PostMapping("insert")
	public String insert(Notice notice) {
		nservice.insert(notice);
		return "redirect:/admin/a_notice/a_notice";
	}
	
	
	
	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req,
	          HttpServletResponse res,
	          @RequestParam MultipartFile upload) throws Exception {
	// logger.info("post CKEditor img upload");
	
	 
	 // 랜덤 문자 생성
	 UUID uid = UUID.randomUUID();
	 
	 OutputStream out = null;
	 PrintWriter printWriter = null;
	   
	 // 인코딩
	 res.setCharacterEncoding("utf-8");
	 res.setContentType("text/html;charset=utf-8");
	 
	 try {
	  
	  String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
	  byte[] bytes = upload.getBytes();
	  
	  // 업로드 경로
	  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
	  
	  out = new FileOutputStream(new File(ckUploadPath));
	  out.write(bytes);
	  out.flush();  // out에 저장된 데이터를 전송하고 초기화
	  
	  String callback = req.getParameter("CKEditorFuncNum");
	  printWriter = res.getWriter();
	  String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면
	  
	  // 업로드시 메시지 출력
	  printWriter.println("<script type='text/javascript'>"
	     + "window.parent.CKEDITOR.tools.callFunction("
	     + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
	     +"</script>");
	  
	  printWriter.flush();
	  
	 } catch (IOException e) { e.printStackTrace();
	 } finally {
	  try {
	   if(out != null) { out.close(); }
	   if(printWriter != null) { printWriter.close(); }
	  } catch(IOException e) { e.printStackTrace(); }
	 }
	 
	 return; 
	}
	
	@GetMapping("update")
	public String update(Model model, int nno, HttpSession session) {
		String sessid = (String) session.getAttribute("sessid");
		if("admin".equals(sessid)) {
			Notice notice = nservice.findById(nno);
			
			model.addAttribute("notice", notice);
		return "/admin/a_notice/a_notice_update";
		
		}else {
			return "redirect:/";
		}
	}
	
	@PostMapping("update")
	public String update(@ModelAttribute Notice notice) {
		nservice.update(notice);
		return "redirect:/admin/a_notice/a_notice";
	}
	
	@PostMapping("delete")
	@ResponseBody
	public int delete(@RequestParam(value = "chbox[]")List<String> chArr) {
		int result = 0;
		int nno = 0;
		for(String i : chArr) {
			nno = Integer.parseInt(i);
			nservice.delete(nno);
		}
		result=1;
		return result;
	}
}
