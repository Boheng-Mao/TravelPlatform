package com.mbh.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mbh.mapper.RoomMapper;
import com.mbh.pojo.Room;
import com.mbh.service.RoomService;
import org.springframework.stereotype.Service;

@Service
public class RoomServiceImpl extends ServiceImpl<RoomMapper, Room>implements RoomService {
}
