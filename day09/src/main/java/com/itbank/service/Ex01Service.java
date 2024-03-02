package com.itbank.service;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Scanner;

import org.springframework.stereotype.Service;

@Service
public class Ex01Service {

	private final String serviceKey = "XbLXKot6yPdvL4DLMb80SimGsxI8kgBU4QGTdueOcikuIBuFwGWL59j1YlU%2BySlmhTxSzWjTfBN%2BzmsX%2Bx1FBA%3D%3D";

	public String getFestivalJson() throws MalformedURLException, IOException {
		// 1) 요청 주소 및 파라미터 준비
		String url = "https://apis.data.go.kr/6260000/FestivalService/getFestivalKr";
		HashMap<String, String> param = new HashMap<>();
		param.put("pageNo", "1");
		param.put("numOfRows", "10");
		param.put("resultType", "json");
		param.put("serviceKey", serviceKey);
		url += "?";
		for(String key : param.keySet()) {
			url += key + "=" + param.get(key) + "&";
		}
		
		// 2) 요청을 전송하여 응답을 받아서 저장
		Scanner sc = null;
		String response = "";
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		if(conn.getResponseCode() == 200) { // 정상
			sc = new Scanner(conn.getInputStream());
			while(sc.hasNextLine()) {
				response += sc.nextLine();
			}
			sc.close();
			conn.disconnect();
		}
		
		return response;
	}

	
}
