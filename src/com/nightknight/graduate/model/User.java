package com.nightknight.graduate.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Userinfo: nightknight
 * Date: 13-5-2
 * Time: 下午3:26
 * To change this template use File | Settings | File Templates.
 */
public class User extends Model<User> {

    public static final User dao = new User();

    /**
     * 根据用户名查找用户
     * @param name 传入的用户名
     * @return 返回找到的用户信息，如果未找到，则返回null
     */
    public User findUserByName(String name) {
        return dao.findFirst("select * from userinfo where username=?", name);
    }

    public List<User> findAllUsers() {
        return dao.find("select * from userinfo");
    }

    public List<Operator> getOperators() {
        return Operator.dao.findByUser(get("id"));
    }
}
