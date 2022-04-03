package com.orm.mybatis.freemarker.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.orm.mybatis.freemarker.entity.User;
import com.orm.mybatis.freemarker.serviceImpl.UserServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (User)表控制层
 *
 * @author Yufx
 * @since 2022-03-29 15:53:09
 */
@Controller
@RequestMapping("user")
public class UserController {
    /**
     * 服务对象
     */
    @Resource
    private UserServiceImpl userService;

    @GetMapping("/")
    public String index(Model model) {
        return "index";
    }



    @GetMapping("/showUsers")
    public ModelAndView showCities() {

        List<User> userList = userService.queryAll();

        Map<String, Object> params = new HashMap<>();

        System.out.println(userList.toString());

        params.put("userList", userList);

        return new ModelAndView("showUsers", params);

    }

    @GetMapping("/table")
    public ModelAndView showUser() {

        List<User> userList = userService.queryAll();

        Map<String, Object> params = new HashMap<>();

        System.out.println(userList.toString());

        params.put("userList", userList);

        return new ModelAndView("table", params);

    }

    @ResponseBody
    @PostMapping(value = "/getUserById",produces = {"application/json;charset=UTF-8"}  )
    public Object getUserById(@RequestBody String json) {
        System.out.println(json);
        JSONObject jsonObject = JSONObject.parseObject(json);
        String temp = jsonObject.getString("ids");
        List<Integer> ids = JSONArray.parseArray(temp,Integer.class);
        Integer id = Integer.valueOf(ids.get(0));
        User user1 = userService.queryById(id);
        JSONObject jsonObject1 = new JSONObject();
        jsonObject1.put("data",user1);
        jsonObject1.put("code","200");
        return jsonObject1;
    }

    @ResponseBody
    @PostMapping(value = "/queryAllByLimit", produces = {"application/json;charset=UTF-8"})
    public Object queryAllByLimit(@RequestBody User user) {
        List<User> userList = userService.queryAllByLimit(user);
        JSONObject jsonObject1 = new JSONObject();
        jsonObject1.put("data", userList);
        jsonObject1.put("code", "200");
        return jsonObject1;
    }
    @ResponseBody
    @PostMapping(value = "/edit",produces = {"application/json;charset=UTF-8"}  )
    public Object editUserById(@RequestBody String json) {
        System.out.println(json);
        JSONObject jsonObject = JSONObject.parseObject(json);
        String temp = jsonObject.getString("ids");
        List<Integer> ids = JSONArray.parseArray(temp,Integer.class);
//        String[] ids = temp.split(",");
//        List<String> list = Arrays.asList(ids);
//        Integer id = Integer.valueOf(list.get(0));
        System.out.println(ids);
        System.out.println(ids.get(0));
        User user1 = User.builder().id(ids.get(0))
                .roleId(Integer.valueOf((String)jsonObject.get("roleId")))
                .sex((String) jsonObject.get("sex"))
                .name((String) jsonObject.get("name"))
                .status(jsonObject.getString("status"))
                .build();
        userService.update(user1);
        JSONObject jsonObject1 = new JSONObject();

        jsonObject1.put("code","200");
        return jsonObject1;
    }

    @ResponseBody
    @PostMapping(value = "/add",produces = {"application/json;charset=UTF-8"}  )
    public Object addUserById(@RequestBody String json) {
        System.out.println(json);
        JSONObject jsonObject = JSONObject.parseObject(json);
        String temp = jsonObject.getString("ids");
        List<Integer> ids = JSONArray.parseArray(temp,Integer.class);
//        String[] ids = temp.split(",");
//        List<String> list = Arrays.asList(ids);
//        Integer id = Integer.valueOf(list.get(0));
//        System.out.println(ids);
//        System.out.println(ids.get(0));
        User user1 = User.builder()
                .roleId(Integer.valueOf((String)jsonObject.get("roleId")))
                .sex((String) jsonObject.get("sex"))
                .name((String) jsonObject.get("name"))
                .status(jsonObject.getString("status")).rname(jsonObject.getString("rname"))
                .build();
        userService.insert(user1);;
        JSONObject jsonObject1 = new JSONObject();

        jsonObject1.put("code","200");
        return jsonObject1;
    }

    @ResponseBody
    @PostMapping(value = "/delete",produces = {"application/json;charset=UTF-8"}  )
    public Object deleteUserById(@RequestBody String json) {
        System.out.println(json);
        JSONObject jsonObject = JSONObject.parseObject(json);
        String temp = jsonObject.getString("ids");
        List<Integer> ids = JSONArray.parseArray(temp,Integer.class);
        ids.forEach(
                (v)-> userService.deleteById(v)
        );

        JSONObject jsonObject1 = new JSONObject();

        jsonObject1.put("code","200");
        return jsonObject1;
    }

}

