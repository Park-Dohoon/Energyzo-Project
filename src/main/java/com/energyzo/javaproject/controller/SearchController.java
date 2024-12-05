package com.energyzo.javaproject.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	// 검색 메인페이지 이동
	@RequestMapping("searchmain")
	public String searchMain() {
		
		return "search/searchmain";
	}
	
	// 상세보기 페이지 이동
	@RequestMapping("searchinfo")
	public String searchInfo() {
		
		return "search/searchinfo";
	}
	
	// 서울시 부동산 api
	@ResponseBody
	@RequestMapping(value="seoulProperty", method = { RequestMethod.GET }, produces = "application/text; charset=UTF-8")
	public String seoulProperty(@RequestParam("cgg_cd") String cgg_cd) {
		
		BufferedReader br = null;
		
		String urlstr 	= "http://openapi.seoul.go.kr:8088"
						+ "/6d75715a6873616539347a66466b58/json/tbLnOpendataRtmsV/1/9/"
						+ "2024/"
						+ cgg_cd + "/"; 
		
		String result = "";
		
		try {
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
			
			String line;
			while( (line = br.readLine()) != null) {
				result += result + line + "\n";
			}
			//System.out.println(result);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		//return "redirect:searchmain";
		return result;
	}
	
//	@ResponseBody
//	@RequestMapping(value="searchAddr", method = { RequestMethod.GET }, produces = "application/text; charset=UTF-8")
//	public String searchAddr(@RequestParam("searchKeyword") String searchKeyword) {
//		
//		String clientId = "56LyZfN0HWexcSAl1tz7"; //애플리케이션 클라이언트 아이디
//        String clientSecret = "vFqo8Kap28"; //애플리케이션 클라이언트 시크릿
//
//        String text = null;
//        try {
//            text = URLEncoder.encode(searchKeyword, "UTF-8");
//        } catch (UnsupportedEncodingException e) {
//            throw new RuntimeException("검색어 인코딩 실패",e);
//        }
//
//
//        String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + text;    // JSON 결과
//        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // XML 결과
//
//
//        Map<String, String> requestHeaders = new HashMap<>();
//        requestHeaders.put("X-Naver-Client-Id", clientId);
//        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
//        String responseBody = get(apiURL,requestHeaders);
//
//
//        System.out.println(responseBody);
//		
//		return responseBody;
//	}
//	private static String get(String apiUrl, Map<String, String> requestHeaders){
//        HttpURLConnection con = connect(apiUrl);
//        try {
//            con.setRequestMethod("GET");
//            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
//                con.setRequestProperty(header.getKey(), header.getValue());
//            }
//
//
//            int responseCode = con.getResponseCode();
//            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
//                return readBody(con.getInputStream());
//            } else { // 오류 발생
//                return readBody(con.getErrorStream());
//            }
//        } catch (IOException e) {
//            throw new RuntimeException("API 요청과 응답 실패", e);
//        } finally {
//            con.disconnect();
//        }
//    }
//	private static HttpURLConnection connect(String apiUrl){
//        try {
//            URL url = new URL(apiUrl);
//            return (HttpURLConnection)url.openConnection();
//        } catch (MalformedURLException e) {
//            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
//        } catch (IOException e) {
//            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
//        }
//    }
//
//
//    private static String readBody(InputStream body){
//        InputStreamReader streamReader = new InputStreamReader(body);
//
//
//        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
//            StringBuilder responseBody = new StringBuilder();
//
//
//            String line;
//            while ((line = lineReader.readLine()) != null) {
//                responseBody.append(line);
//            }
//
//
//            return responseBody.toString();
//        } catch (IOException e) {
//            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
//        }
//    }
}
