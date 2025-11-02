package com.mbh.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mbh.pojo.Customer;
import com.mbh.pojo.Horder;
import com.mbh.pojo.Hotel;
import com.mbh.pojo.Room;
import com.mbh.service.CustomerService;
import com.mbh.service.HorderService;
import com.mbh.service.HotelService;
import com.mbh.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("horder")
public class HorderController {
    @Autowired
    private HorderService horderService;
    @Autowired
    private RoomService roomService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private HotelService hotelService;
    @RequestMapping("listHorder")
    public String listHorder(@RequestParam(value = "pageNum",defaultValue = "1",required = false)Integer pageNum,
                             @RequestParam(value = "pageSize",defaultValue = "6",required = false)Integer pageSize, Model model, Horder horder1){
        if (pageNum<0||pageNum.equals("")||pageNum==null){
            pageNum=1;
        }
        if (pageSize<0||pageSize.equals("")||pageSize==null){
            pageSize=6;
        }
        PageHelper.startPage(pageNum,pageSize);
        QueryWrapper<Horder>qw=new QueryWrapper<>();
        if (horder1.getId()!=null){
            qw.eq("id",horder1.getId());
        }
        List<Horder> list = horderService.list(qw);

        for (Horder horder : list) {
            horder.setRname(roomService.getById(horder.getRid()).getRname());
            horder.setCname(customerService.getById(horder.getCid()).getCustomerName());
            horder.setHname(hotelService.getById(roomService.getById(horder.getRid()).getHid()).getHname());
            horder.setCimage(customerService.getById(horder.getCid()).getCimage());
            horder.setHimage(hotelService.getById(roomService.getById(horder.getRid()).getHid()).getHimage());
            horder.setPrice(roomService.getById(horder.getRid()).getPrice());
        }
        PageInfo<Horder>pageInfo=new PageInfo<>(list);
        model.addAttribute("pageInfo",pageInfo);
        return "admin-horder-list";
    }

    @RequestMapping("preSaveHorder")
    public String preSaveHorder(Model model){
        List<Hotel> list = hotelService.list(null);
        for (Hotel hotel : list) {
            QueryWrapper<Room>qw=new QueryWrapper<>();
            qw.eq("hid",hotel.getId());
            List<Room> list1 = roomService.list(qw);
            hotel.setRoomList(list1);
        }

        List<Room> roomList = roomService.list(null);
        List<Customer> customerList = customerService.list(null);
        model.addAttribute("hotelList",list);
        model.addAttribute("customerList",customerList);
        model.addAttribute("roomList",roomList);
        return "admin-horder-save";
    }

    @RequestMapping("saveHorder")
    public String saveHorder(Horder horder){

        Room byId = roomService.getById(horder.getRid());
        Double total=byId.getPrice()*horder.getCount();
        horder.setTotal(total);

        boolean save = horderService.save(horder);

        return "redirect:/horder/listHorder";
    }

    @RequestMapping("delHorder/{id}")
    public String delSorder(@PathVariable Integer id){
        boolean b = horderService.removeById(id);
        return "redirect:/horder/listHorder";
    }
    //bulk delete hotel orders
    @PostMapping("batchDeleteHorder")
    @ResponseBody
    public String batchDeleteBook(String idList){
        String[]split= StrUtil.split(idList,",");
        List<Integer> list=new ArrayList<>();

        for (String s : split) {
            if (!s.isEmpty()){
                int i = Integer.parseInt(s);
                list.add(i);
            }
        }
        boolean b = horderService.removeByIds(list);
        if (b){
            return "OK";
        }else {
            return "error";
        }
    }
}
