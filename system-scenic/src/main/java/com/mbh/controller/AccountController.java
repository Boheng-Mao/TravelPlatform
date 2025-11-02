package com.mbh.controller;

import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.mbh.pojo.Customer;
import com.mbh.pojo.User;
import com.mbh.service.CustomerService;
import com.mbh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@Controller
public class AccountController {
    @Autowired
    private UserService userService;
    @Autowired
    private CustomerService customerService;

    @RequestMapping("login")
    public String login(){
        return "user-login";
    }

    @RequestMapping("adminlogin")
    public String adminlogin(String username, String password, Model model, HttpSession session){
        boolean b=userService.login(username,password);
        if (b){
            QueryWrapper<User>qw=new QueryWrapper<>();
            qw.eq("username",username);
            User user=userService.getOne(qw);
            session.setAttribute("currentUser",username);
            session.setAttribute("userId",user.getId());
            session.setAttribute("image",user.getImage());
            session.setAttribute("email",user.getEmail());
            session.setAttribute("phone",user.getPhone());
            session.setAttribute("password",password);
            return "admin-home";
        }else {
            model.addAttribute("msg","Incorrect username or password!");
            return "index";
        }
    }

    @RequestMapping("count")
    public String count(){
        return "admin-count";
    }


    @RequestMapping("profile")
    public String profile(HttpSession session,Model model ){
        String currentUser = (String) session.getAttribute("currentUser");
        String  password = (String) session.getAttribute("password");
        QueryWrapper<User>qw=new QueryWrapper<>();
        qw.eq("username",currentUser);
        User one = userService.getOne(qw);
        one.setPassword(password);
        model.addAttribute("user",one);
        return "admin-profile";
    }

    @RequestMapping("updateAdminProfile")
    public String updateAdminProfile(User user, MultipartFile file){
        if (!file.isEmpty()){
            transFile(user,file);//store uploaded avatar for the user
        }
        String s = DigestUtil.md5Hex(user.getPassword());
        user.setPassword(s);
        boolean b = userService.updateById(user);
        return "redirect:/profile";
    }
    @Value("${location}")
    private String location;
    private void transFile(User user, MultipartFile file) {
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

        user.setImage(path);
    }

    //logout
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "index";
    }
}
