package com.shop.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shop.entity.BookVO;
import com.shop.entity.NaverResultVO;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import java.net.URI;
import java.util.List;

// 출처 : https://this-circle-jeong.tistory.com/167
@Log4j2
@Controller
@RequestMapping("/book/*")
public class BookController {
    @GetMapping("list.do")
    public String bookList() {
        return "/book/bookList";
    }

    @PostMapping("list.do")
    public String bookListUp(@RequestParam("text") String text, Model model) {

        String clientId = "t3prRpioTofJgssyOPNT";
        String clientSecret = "xpvqvASKIF";

        URI uri = UriComponentsBuilder
                .fromUriString("https://openapi.naver.com")
                .path("/v1/search/book.json")
                .queryParam("query", text)
                .queryParam("display", 10)
                .queryParam("start", 1)
                .queryParam("sort", "sim")
                .encode()
                .build()
                .toUri();

        // Spring 요청 제공 클래스
        RequestEntity<Void> request = RequestEntity
                .get(uri)
                .header("X-Naver-Client-Id", clientId)
                .header("X-Naver-Client-Secret", clientSecret)
                .build();

        // Spring 제공 restTemplate
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> resp = restTemplate.exchange(request, String.class);

        // JSON 파싱 (Json 문자열을 객체로 만듦, 문서화)
        ObjectMapper om = new ObjectMapper();
        NaverResultVO resultVO = null;

        try {
            resultVO = om.readValue(resp.getBody(), NaverResultVO.class);
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        List<BookVO> books =resultVO.getItems();	// books를 list.html에 출력 -> model 선언
        model.addAttribute("books", books);

        return "/book/bookList";
    }

    @GetMapping("insert.do")
    public String bookInsert(HttpServletRequest httpServletRequest, Model model) throws Exception {
        return "/book/bookInsert";
    }

    @PostMapping("insert.do")
    public String bookInsertPro(HttpServletRequest httpServletRequest, Model model) throws Exception {
        BookVO bookVO = new BookVO();
        bookVO.setIsbn(httpServletRequest.getParameter("isbn"));
        bookVO.setAuthor(httpServletRequest.getParameter("author"));
        bookVO.setPubdate(httpServletRequest.getParameter("pubdate"));
        bookVO.setImage(httpServletRequest.getParameter("image"));
        bookVO.setTitle(httpServletRequest.getParameter("title"));
        bookVO.setDiscount(httpServletRequest.getParameter("discount"));
        bookVO.setPublisher(httpServletRequest.getParameter("publisher"));
        model.addAttribute("bookVO",bookVO);
        return "book/bookMarketInsert";
    }

}