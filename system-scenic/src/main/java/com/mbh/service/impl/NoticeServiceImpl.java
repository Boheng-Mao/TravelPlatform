package com.mbh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mbh.mapper.NoticeMapper;
import com.mbh.pojo.Notice;
import com.mbh.service.NoticeService;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, Notice>implements NoticeService {
}
