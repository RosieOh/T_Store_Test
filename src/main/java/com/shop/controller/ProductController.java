package com.shop.controller;

import com.shop.entity.Category;
import com.shop.entity.Product;
import com.shop.service.ProductService;
import com.shop.util.Page;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping("/product/*")
public class ProductController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ProductService productService;

    @GetMapping("list.do")
    public String productList(HttpServletRequest httpServletRequest, Model model) throws Exception {
        int curPage = httpServletRequest.getParameter("page") != null ? Integer.parseInt(httpServletRequest.getParameter("page")) : 1;
        String keyword = httpServletRequest.getParameter("keyword");
        String type = httpServletRequest.getParameter("type");
        String category = httpServletRequest.getParameter("category");

        Page page = new Page();
        List<Product> productList = productService.productList(page);
        List<Category> categoryList = productService.categoryList();

        page.setSearchType(httpServletRequest.getParameter("type"));
        page.setSearchKeyword(httpServletRequest.getParameter("keyword"));
        page.setAddr(httpServletRequest.getParameter("addr"));
        page.setStatus(httpServletRequest.getParameter("status"));

        int total = productService.getProductCount(page);
        String status = httpServletRequest.getParameter("status");


        model.addAttribute("addr", httpServletRequest.getAttribute("addr"));
        model.addAttribute("status", status);
        model.addAttribute("productList", productList);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);

        return "product/productList";
    }

    @GetMapping("detail.do")

    //@RequestParam("가져올 데이터의 이름") [데이터타입] [가져온데이터를 담을 변수]
    public String productDetail(@RequestParam Long pno, Product product, Model model) throws Exception {
        Product productDetail = productService.productDetail(pno);
        model.addAttribute("productDetail", productDetail);

        return "product/productDetail";
    }

    @PostMapping("insert.do")

    //@RequestParam("가져올 데이터의 이름") [데이터타입] [가져온데이터를 담을 변수]
    public String productInsert(Product product, Model model) throws Exception {
        Product productInsert = productService.productInsert(product);
        model.addAttribute("productInsert", productInsert);
        return "product/productInsert";
    }



    // 이거는 언제 쓸지 모르니까 킵해두기
//    @RequestMapping(value = "imageUpload.do", method = RequestMethod.POST)
//    public void imageUpload(HttpServletRequest request,
//                            HttpServletResponse response, MultipartHttpServletRequest multiFile
//            , @RequestParam MultipartFile upload) throws Exception {
//        // 랜덤 문자 생성
//        UUID uid = UUID.randomUUID();
//
//        OutputStream out = null;
//        PrintWriter printWriter = null;
//
//        //인코딩
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=utf-8");
//        try {
//            //파일 이름 가져오기
//            String fileName = upload.getOriginalFilename();
//            byte[] bytes = upload.getBytes();
//
//            //이미지 경로 생성
//            String path = "E:\\springframework\\pro04_2\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 이미지 경로 설정(폴더 자동 생성)
//            String ckUploadPath = path + uid + "_" + fileName;
//            File folder = new File(path);
//            System.out.println("path:" + path);    // 이미지 저장경로 console에 확인
//            //해당 디렉토리 확인
//            if (!folder.exists()) {
//                try {
//                    folder.mkdirs(); // 폴더 생성
//                } catch (Exception e) {
//                    e.getStackTrace();
//                }
//            }
//
//            out = new FileOutputStream(new File(ckUploadPath));
//            out.write(bytes);
//            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
//
//            String callback = request.getParameter("CKEditorFuncNum");
//            printWriter = response.getWriter();
//            String fileUrl = "/team24_war/notice/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면
//
//            // 업로드시 메시지 출력
//            printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
//            printWriter.flush();
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (out != null) {
//                    out.close();
//                }
//                if (printWriter != null) {
//                    printWriter.close();
//                }
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//        return;
//    }



    // 이거는 언제 쓸지 모르니까 킵해두기
//    @RequestMapping(value = "ckImgSubmit.do")
//    public void ckSubmit(@RequestParam(value = "uid") String uid
//            , @RequestParam(value = "fileName") String fileName
//            , HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        //서버에 저장된 이미지 경로
//        String path = "E:\\springframework\\pro04_2\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 저장된 이미지 경로
//        System.out.println("path:" + path);
//        String sDirPath = path + uid + "_" + fileName;
//
//        File imgFile = new File(sDirPath);
//
//        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
//        if (imgFile.isFile()) {
//            byte[] buf = new byte[1024];
//            int readByte = 0;
//            int length = 0;
//            byte[] imgBuf = null;
//
//            FileInputStream fileInputStream = null;
//            ByteArrayOutputStream outputStream = null;
//            ServletOutputStream out = null;
//
//            try {
//                fileInputStream = new FileInputStream(imgFile);
//                outputStream = new ByteArrayOutputStream();
//                out = response.getOutputStream();
//
//                while ((readByte = fileInputStream.read(buf)) != -1) {
//                    outputStream.write(buf, 0, readByte);
//                }
//
//                imgBuf = outputStream.toByteArray();
//                length = imgBuf.length;
//                out.write(imgBuf, 0, length);
//                out.flush();
//
//            } catch (IOException e) {
//                e.printStackTrace();
//            } finally {
//                outputStream.close();
//                fileInputStream.close();
//                out.close();
//            }
//        }
//    }
//}

}
