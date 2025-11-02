package com.mbh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mbh.mapper.RouteMapper;
import com.mbh.pojo.Route;
import com.mbh.service.RouteService;
import org.springframework.stereotype.Service;

@Service
public class RouteServiceImpl extends ServiceImpl<RouteMapper, Route>implements RouteService {
}
