package com.shop.service;

import com.shop.entity.FileDTO;
import com.shop.entity.FileVO;
import com.shop.util.Page;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface FileService {
    public void insertFileboard(FileVO fileboard) throws Exception;

    public List<FileVO> getFileList(Page page) throws Exception;

    public List<FileDTO> getFileGroupList(int postNo) throws Exception;

    public FileVO getFilebord(int postNo) throws Exception;

    public FileVO getFileObject(int no) throws Exception;

    public void removeFileboard(int postNo) throws Exception;

    public void fileRemove(int no) throws Exception;

    public void editFileboard(FileVO fileboard) throws Exception;

    public FileDTO getFile(int no) throws Exception;

    public void removeAllFile(int postNo) throws Exception;

    public int totalCount(Page page) throws Exception;
}
