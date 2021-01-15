package com.mybook.app;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mybook.service.StatisticsService;

@RequestMapping("/admin/a_statistics")
@Controller
//일반적인 controller어노테이션을 jsp <=> controller을 연동할때 사용하지만
//RestController은 그 데이터 자체를 받아서 제이슨 형식으로 바꿔서 출력하고 싶을때 사용
//(지금은 json 형식으로 차트를 그릴것이기 때문에 Rest를 붙여서 컨트롤러를 선언한 것이다)
public class StatisticController {
	@Autowired
	StatisticsService sService;
	
	@GetMapping("a_statistics")
	public String a_stastistic() {
		
		return "/admin/a_statistics/a_statistics";
	}
	
	
	@RequestMapping("chart")
	@ResponseBody
	public JSONObject chart() {
		return sService.getChartData();
	}
	
}
