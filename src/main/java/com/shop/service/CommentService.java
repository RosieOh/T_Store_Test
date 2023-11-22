package com.shop.service;

import com.shop.entity.Comment;
import com.shop.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {

    @Autowired
    private CommentMapper commentMapper;

    public List<Comment> commentList(int par) {
        return commentMapper.commentList(par);
    }

    public void commentInsert(Comment domain) {
        commentMapper.commentInsert(domain);
    }

    public void commentDelete(int cno) {
        commentMapper.commentDelete(cno);
    }
}
