package com.mbh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mbh.mapper.HotelMapper;
import com.mbh.pojo.Hotel;
import com.mbh.service.HotelService;
import org.springframework.stereotype.Service;

@Service
public class HotelServiceImpl extends ServiceImpl<HotelMapper,Hotel>implements HotelService {
}
