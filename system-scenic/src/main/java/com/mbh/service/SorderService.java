package com.mbh.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.mbh.pojo.CountNumber;
import com.mbh.pojo.SOrder;

import java.util.List;

public interface SorderService extends IService<SOrder> {
    List<SOrder> listSorder(Integer id);

    List<CountNumber> queryNum();

    List<SOrder> listWish(Integer userId);

    List<SOrder> listMySorder(Integer userId);
}
