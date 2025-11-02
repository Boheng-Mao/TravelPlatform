package com.mbh.service.impl;

import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mbh.mapper.CustomerMapper;
import com.mbh.pojo.Customer;
import com.mbh.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class CustomerServiceImpl extends ServiceImpl<CustomerMapper, Customer>implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;
    @Override
    public boolean login(String username, String password) {
        QueryWrapper<Customer>qw=new QueryWrapper<>();
        qw.eq("customer_name",username);
        Customer customer = customerMapper.selectOne(qw);
        if (customer==null){
            return false;
        }

        String s = DigestUtil.md5Hex(password);
        if (Objects.equals(s,customer.getPassword())){
            return true;
        }else {
            return false;
        }

    }
}
