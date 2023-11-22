package com.shop.mapper;

import com.shop.entity.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    List<Comment> commentList(int par);
    void commentInsert(Comment domain);
    void commentDelete(int cno);
}
