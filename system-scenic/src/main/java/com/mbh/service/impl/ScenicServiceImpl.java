package com.mbh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mbh.mapper.ScenicMapper;
import com.mbh.pojo.Scenic;
import com.mbh.service.ScenicService;
import org.springframework.stereotype.Service;

@Service
public class ScenicServiceImpl extends ServiceImpl<ScenicMapper, Scenic>implements ScenicService {
}
