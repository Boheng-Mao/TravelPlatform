package com.mbh.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mbh.pojo.Scenic;
import com.mbh.pojo.Type;
import com.mbh.service.ScenicService;
import com.mbh.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("scenic")
public class ScenicController {
    @Autowired
    private ScenicService scenicService;
    @Autowired
    private TypeService typeService;
    @Value("${location}")
    private String location;
    @RequestMapping("listScenic")
    public String listScenic(@RequestParam(value = "pageNum",defaultValue = "1",required = false)Integer pageNum,
                             @RequestParam(value = "pageSize",defaultValue = "6",required = false)Integer pageSize, Scenic scenic, Model model){
        if (pageNum<0||pageNum.equals("")||pageNum==null){
            pageNum=1;
        }
        if (pageSize<0||pageSize.equals("")||pageSize==null){
            pageSize=6;
        }
        PageHelper.startPage(pageNum,pageSize);
        QueryWrapper<Scenic>qw=new QueryWrapper<>();
        if (scenic.getSname()!=null){
            qw.like("sname",scenic.getSname());
        }
        List<Scenic> list = scenicService.list(qw);
        PageInfo<Scenic>pageInfo=new PageInfo<>(list);
        model.addAttribute("pageInfo",pageInfo);
        return "admin-scenic-list";
    }

    @RequestMapping("preSaveScenic")
    public String preSaveScenic(Model model){
        List<Type> list = typeService.list(null);
        model.addAttribute("typeList",list);
        return "admin-scenic-save";
    }

    @RequestMapping("saveScenic")
    public String saveScenic(Scenic scenic, MultipartFile file){
        if (!file.isEmpty()){
            transfile(scenic,file);
        }
        boolean save = scenicService.save(scenic);
        return "redirect:/scenic/listScenic";
    }

    private void transfile(Scenic scenic, MultipartFile file) {

        String originalFilename = file.getOriginalFilename();
        int index = originalFilename.lastIndexOf(".");
        String suffix = originalFilename.substring(index);
        String prefix=System.nanoTime()+"";
        String path=prefix+suffix;
        File file1 = new File(location);
        if (!file1.exists()){
            file1.mkdirs();
        }
        File file2 = new File(file1, path);
        try {
            file.transferTo(file2);
        } catch (IOException e) {
            e.printStackTrace();
        }
        scenic.setSimage(path);
    }

    @RequestMapping("preUpdateScenic/{id}")
    public String preUpdateScenic(@PathVariable Integer id,Model model){
        Scenic byId = scenicService.getById(id);
        model.addAttribute("scenic",byId);

        List<Type> list = typeService.list(null);
        model.addAttribute("typeList",list);
        return "admin-scenic-update";

    }

    @RequestMapping("updateScenic")
    public String updateScenic(Scenic scenic,MultipartFile file){
        if (!file.isEmpty()){
            transfile(scenic,file);
        }
        boolean b = scenicService.updateById(scenic);
        return "redirect:/scenic/listScenic";
    }

    @RequestMapping("delScenic/{id}")
    public String delScenic(@PathVariable Integer id){
        boolean b = scenicService.removeById(id);
        return "redirect:/scenic/listScenic";
    }

    @ResponseBody
    @RequestMapping("batchDeleteScenic")
    public String batchDeleteScenic(String idList){
        String[] split = StrUtil.split(idList, ",");
        List<Integer>list=new ArrayList<>();
        for (String s : split) {
            if (!s.isEmpty()){
                list.add(Integer.valueOf(s));
            }
        }

        boolean b = scenicService.removeByIds(list);
        if (b){
            return "OK";
        }else {
            return "error";
        }
    }
}
