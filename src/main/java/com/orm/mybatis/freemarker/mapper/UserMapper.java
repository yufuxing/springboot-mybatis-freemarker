package com.orm.mybatis.freemarker.mapper;

import com.orm.mybatis.freemarker.entity.User;
import org.apache.ibatis.annotations.Mapper;


import java.util.List;


@Mapper
public interface UserMapper {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    User queryById(Integer id);

    /**
     * 查询指定行数据
     *
     * @param user 查询条件
     * @return 对象列表
     */
    List<User> queryAllByLimit(User user);

    /**
     * 查询指定行数据
     *
     * @return 对象列表
     */
    List<User> queryAll();

    /**
     * 统计总行数
     *
     * @param user 查询条件
     * @return 总行数
     */
    long count(User user);

    /**
     * 新增数据
     *
     * @param user 实例对象
     * @return 影响行数
     */
    int insert(User user);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<User> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(List<User> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<User> 实例对象列表
     * @return 影响行数
     */
    int insertOrUpdateBatch(List<User> entities);

    /**
     * 修改数据
     *
     * @param user 实例对象
     * @return 影响行数
     */
    int update(User user);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

    /*
将关联角色失效
 */
    void updateLoseStatus(Integer roleId);
    /*
新建角色
 */
    void insertrole(User user);

    User login(User user);
}

