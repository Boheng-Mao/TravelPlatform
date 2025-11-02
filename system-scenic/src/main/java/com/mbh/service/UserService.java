package com.mbh.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mbh.pojo.User;

public interface UserService extends IService<User> {
    boolean login(String username, String password);
}
