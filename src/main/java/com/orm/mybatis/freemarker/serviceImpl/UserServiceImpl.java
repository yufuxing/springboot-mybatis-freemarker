package com.orm.mybatis.freemarker.serviceImpl;

import com.orm.mybatis.freemarker.entity.User;
import com.orm.mybatis.freemarker.mapper.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (User)表控制层
 *
 * @author Yufx
 * @since 2022-03-30 17:53:09
 */
@Controller
@Service("userService")
public class UserServiceImpl {
    @Resource
    private UserMapper userMapper;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    public User queryById(Integer id) {
        return this.userMapper.queryById(id);
    }

    /**
     * 分页查询
     *
     * @param user 筛选条件
     * @return 查询结果
     */
    public List<User> queryAllByLimit(User user) {
        return userMapper.queryAllByLimit(user);
    }

    /**
     * 分页查询
     *
     * @return 查询结果
     */
    public List<User> queryAll() {
        return userMapper.queryAll();
    }

    /**
     * 新增数据
     *
     * @param user 实例对象
     */
    public void insert(User user) {
        this.userMapper.insert(user);
    }

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 实例对象
     */
    public User update(User user) {
        this.userMapper.update(user);
        return this.queryById(user.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    public boolean deleteById(Integer id) {
        return this.userMapper.deleteById(id) > 0;
    }

    /*
    将关联角色失效
     */
    public void updateLoseStatus(Integer roleId) {
    }
    /**
     * 登录
     */
    public User login(User user){
        return  this.userMapper.login(user);
    }
}
