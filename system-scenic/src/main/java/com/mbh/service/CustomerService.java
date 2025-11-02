package com.mbh.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mbh.pojo.Customer;

public interface CustomerService extends IService<Customer> {
    boolean login(String username, String password);
}
