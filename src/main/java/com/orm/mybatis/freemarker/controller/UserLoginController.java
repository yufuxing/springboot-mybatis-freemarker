package com.orm.mybatis.freemarker.controller;

import com.alibaba.fastjson.JSONObject;
import com.orm.mybatis.freemarker.entity.User;
import com.orm.mybatis.freemarker.serviceImpl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("login")
public class UserLoginController {
    @Resource
    UserServiceImpl userServiceImpl;

    @GetMapping("/")
    public String index(Model model) {
        return "login";
    }

    @ResponseBody
    @PostMapping(value = "/test", produces = {"application/json;charset=utf-8"})
    public Object login(@RequestBody String json) {
        //将json数据转换成user对象
        User user = JSONObject.parseObject(json,User.class);
        user = userServiceImpl.login(user);
        JSONObject jsonObject1 = new JSONObject();
        jsonObject1.put("data",user);
        jsonObject1.put("code","200");
        return jsonObject1;
    }
    @GetMapping("/table")
    public ModelAndView showUser() {

        List<User> userList = userServiceImpl.queryAll();

        Map<String, Object> params = new HashMap<>();

        System.out.println(userList.toString());

        params.put("userList", userList);

        return new ModelAndView("table", params);

    }
}
