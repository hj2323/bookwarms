package com.mybook.service;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.mybook.dto.Books;

@Service
public class StatisticsService {
	@Inject
	ProductService productservice;
	
	public JSONObject getChartData() {
		List<Books> booklist = productservice.cateCount();
		
		 //리턴할 json 객체
        JSONObject data = new JSONObject(); 
        
        //json의 칼럼 객체
        JSONObject col1 = new JSONObject();
        JSONObject col2 = new JSONObject();
        
      //json 배열 객체, 배열에 저장할때는 JSONArray()를 사용
        JSONArray title = new JSONArray();
       
        col1.put("label", "카테고리");
        col1.put("type", "string");
        col2.put("label","책 수량"); //col1에 자료를 저장 ("필드이름","자료형")
        col2.put("type", "number");
        
      //테이블행에 컬럼 추가
        title.add(col1);
        title.add(col2);
      //json 객체에 타이틀행 추가
        data.put("cols", title);//제이슨을 넘김
        
        JSONArray body = new JSONArray(); //json 배열을 사용하기 위해 객체를 생성
        for (Books dto : booklist) { //booklist에 저장된 값을 dto로 반복문을 돌려서 하나씩 저장한다.
            
            
            JSONObject category = new JSONObject(); //json오브젝트 객체를 생성
            category.put("v", dto.getCateName()); //category변수에 dto에 저장된 금액을 v라고 저장한다.
            
            JSONObject numberOfBooks = new JSONObject(); //json오브젝트 객체를 생성
            numberOfBooks.put("v", dto.getNumberOfBooks()); //numberOfBooks변수에 dto에 저장된 상품의 이름을 v라고 저장한다.
            
            JSONArray row = new JSONArray(); //json 배열 객체 생성 (위에서 저장한 변수를 칼럼에 저장하기위해)
            row.add(category); //name을 row에 저장 (테이블의 행)
            row.add(numberOfBooks); //name을 row에 저장 (테이블의 행)
            
            JSONObject cell = new JSONObject(); 
            cell.put("c", row); //cell 2개를 합쳐서 "c"라는 이름으로 추가
            body.add(cell); //레코드 1개 추가
                
        }
        data.put("rows", body);
        
        //System.out.println(data);
		return data;
	}
}
