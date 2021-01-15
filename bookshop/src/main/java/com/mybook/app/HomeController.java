package com.mybook.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.mybook.app.HomeController;
import com.mybook.dto.Books;
import com.mybook.dto.BooksCategory;
import com.mybook.dto.Notice;
import com.mybook.dto.PageDTO;
import com.mybook.service.CategoryService;
import com.mybook.service.NoticeService;
import com.mybook.service.ProductService;

import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Log4j2
@Controller
public class HomeController {
	@Autowired
	private ProductService pservice;
	@Autowired
	private CategoryService cateservice;
	@Autowired
	private NoticeService nservice;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		// 이용안내 글3개보이기
		List<Notice> lists = nservice.listIndex();

		model.addAttribute("Noticelist", lists);
		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@GetMapping("member/login")
	public void loginInput() {
		log.info("/member/login");
	}

	// 이용안내 전체보기
	@GetMapping("notice/notice")
	public String notice(Model model, String pageNum) {
		pageNum = pageNum == null ? "1" : pageNum;
		int page = Integer.parseInt(pageNum);

		HashMap<String, Object> hm = new HashMap<>();
		int cnt = nservice.getCount(hm);
		int totalCount = cnt;

		int pageSize = 5;
		int pageBlock = 3;
		int pageCount = (int) Math.ceil((double) totalCount / pageSize);
		int startPage = ((page / pageBlock) - (page % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;

		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		PageDTO pageDto = new PageDTO();
		pageDto.setPageCount(pageCount);
		pageDto.setPageBlock(pageBlock);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		pageDto.setTotalCount(totalCount);
		pageDto.setPageNum(pageNum);

		int startRow = (page - 1) * pageSize;
		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);

		List<Notice> lists = nservice.findAllwithPage(hm);

		model.addAttribute("Noticelist", lists);
		model.addAttribute("count", cnt);
		model.addAttribute("pageDto", pageDto);
		return "notice/notice";
	}

	// 이용안내 상세보기
	@GetMapping("notice/viewPath/{nno}")
	public String view(@PathVariable int nno, Model model) {
		Notice notice = nservice.findById(nno);
		model.addAttribute("notice", notice);
		return "notice/notice_view";
	}

	// books 전체보기
	@GetMapping("booklist/booklist")
	public String booklist(Model model, String pageNum, String cateCode, String search) {
		pageNum = ((pageNum == null) || (pageNum.equals(""))) ? "1" : pageNum;
		int page = Integer.parseInt(pageNum);

		cateCode = cateCode == null ? null : cateCode;

		HashMap<String, Object> hm = new HashMap<>();
		hm.put("search", search);

		int cnt = pservice.getCount(hm);
		int totalCount = cnt;

		int pageSize = 5;
		int pageBlock = 3;
		int pageCount = (int) Math.ceil((double) totalCount / pageSize);
		int startPage = ((page / pageBlock) - (page % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;

		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		PageDTO pageDto = new PageDTO();
		pageDto.setPageCount(pageCount);
		pageDto.setPageBlock(pageBlock);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		pageDto.setTotalCount(totalCount);
		pageDto.setPageNum(pageNum);

		int startRow = (page - 1) * pageSize;
		hm.put("startRow", startRow);
		hm.put("pageSize", pageSize);
		hm.put("cateCode", cateCode);

		List<Books> lists = pservice.findAll();
		List<Books> listswithCate = pservice.findAllwithPageNcate(hm);
		List<Books> searchlists = pservice.findAllSearch(hm);
		List<BooksCategory> catelists = cateservice.findAll();
		// System.out.println(lists);

		if (search != null) {
			model.addAttribute("Booklist",searchlists);
		}else {

			if ((cateCode == null) || (cateCode.equals(""))) {
				model.addAttribute("Booklist", lists);
			} else {
				model.addAttribute("Booklist", listswithCate);
			}
		}
		model.addAttribute("categorylist", catelists);
		model.addAttribute("count", cnt);
		model.addAttribute("pageDto", pageDto);
		return "booklist/booklist";
	}

	// 베스트셀러 전체보기
	@GetMapping("bestseller/bestseller")
	public String bestseller(Model model) {
		List<Books> lists = pservice.bestseller();
		model.addAttribute("Booklist",lists);
		return "bestseller/bestseller";
	}

}
