package com.shop.controller;

import com.shop.entity.Notice;
import com.shop.service.NoticeService;
import com.shop.util.Page;
import lombok.extern.slf4j.Slf4j;
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

// 관리자용 강제 인증 권한 주는 것
//import org.springframework.security.access.prepost.PreAuthorize;

@Slf4j
@Controller
@RequestMapping("/notice/*")
public class NoticeController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private NoticeService noticeService;

    @GetMapping("list.do")
    public String getList(HttpServletRequest request, Model model) {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        String keyword = request.getParameter("keyword");
        String type = request.getParameter("type");

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = noticeService.getCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        List<Notice> noticeList = noticeService.getList(page);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);

        return "notice/noticeList";
    }

    @GetMapping("detail.do")
    public String getNotice(HttpServletRequest request, Model model) {
        int no = Integer.parseInt(request.getParameter("no"));
        Notice notice = noticeService.getNotice(no);
        model.addAttribute("notice", notice);
        return "notice/noticeDetail";
    }

//    @PreAuthorize("hasAuthority('ADMIN')") 안되면 이걸로 가자
    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest httpServletRequest, Model model) throws Exception {
        String site = httpServletRequest.getParameter("site");
        model.addAttribute("site", site);
        return "/notice/noticeInsert";
    }

    @PostMapping("insert.do")
    public String noticeInsert(Notice notice, HttpServletRequest request, Model model) throws Exception {
        noticeService.noticeInsert(notice);
        // 안될 때는 아래껄로 다이렉트로 가자
        // return "redirect:/notice/list";

        // 이거 관리자만 접근 가능하
        String site = request.getParameter("site");
        if ("admin".equals(site)) {
            return "redirect:/notice/list.do";
        } else {
            return "redirect:/notice/list.do";
        }
    }

    @GetMapping("delete.do")
    public String noticeDelete(Integer no, Model model) throws Exception {
        noticeService.noticeDelete(no);
        return "redirect:/notice/list.do";
    }

//    @GetMapping("edit.do")
//    public String editForm(HttpServletRequest httpServletRequest, Model model) throws Exception {
//        int no = Integer.parseInt(httpServletRequest.getParameter("no"));
//        Notice notice = noticeService.getNotice(no);
//        model.addAttribute("notice", notice);
//        return "/notice/noticeEdit";
//    }

    @GetMapping("edit.do")
    public String editForm(Integer no, Model model) throws Exception {
        Notice notice = noticeService.getNotice(no);
        model.addAttribute("notice", notice);
        return "/notice/noticeEdit";
    }

    @PostMapping("edit.do")
    public String noticeUpdate(Notice notice, Model model) {
        noticeService.noticeUpdate(notice);
        return "redirect:/notice/list.do";
    }

    //ckeditor를 이용한 이미지 업로드
    @RequestMapping(value = "imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
                            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception {
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try {
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = "E:\\springframework\\pro04_2\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 이미지 경로 설정(폴더 자동 생성)
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:" + path);    // 이미지 저장경로 console에 확인
            //해당 디렉토리 확인
            if (!folder.exists()) {
                try {
                    folder.mkdirs(); // 폴더 생성
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/team24_war/notice/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
            printWriter.flush();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return;
    }

    //ckeditor를 이용한 서버에 전송된 이미지 뿌려주기
    @RequestMapping(value = "ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value = "uid") String uid
            , @RequestParam(value = "fileName") String fileName
            , HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //서버에 저장된 이미지 경로
        String path = "E:\\springframework\\pro04_2\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 저장된 이미지 경로
        System.out.println("path:" + path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if (imgFile.isFile()) {
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try {
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while ((readByte = fileInputStream.read(buf)) != -1) {
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }
}