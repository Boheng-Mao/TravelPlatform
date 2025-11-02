package com.mbh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mbh.mapper.CommentMapper;
import com.mbh.pojo.Comment;
import com.mbh.service.CommentService;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment>implements CommentService {
}
