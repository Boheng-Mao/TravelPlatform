package com.mbh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mbh.mapper.HorderMapper;
import com.mbh.pojo.Horder;
import com.mbh.service.HorderService;
import org.springframework.stereotype.Service;

@Service
public class HorderServiceImpl extends ServiceImpl<HorderMapper, Horder>implements HorderService {
}
