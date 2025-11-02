package com.mbh.service.impl;

import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mbh.mapper.UserMapper;
import com.mbh.pojo.User;
import com.mbh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User>implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public boolean login(String username, String password) {
        QueryWrapper<User>qw=new QueryWrapper<>();
        qw.eq("username",username);
        User user = userMapper.selectOne(qw);
        if (user==null){
            return false;
        }
        String s = DigestUtil.md5Hex(password);
        String userPassword = user.getPassword();
        if (Objects.equals(s,userPassword)){
            return true;
        }else {
            return false;
        }

    }
}
