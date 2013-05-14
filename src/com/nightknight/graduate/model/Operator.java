package com.nightknight.graduate.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: nightknight
 * Date: 13-5-13
 * Time: 上午10:57
 * To change this template use File | Settings | File Templates.
 */
public class Operator extends Model<Operator> {

    public static final Operator dao = new Operator();

    public List<Operator> findByUser(Object id) {
        return dao.find("select * from operator where id in " +
                "(select o_id from userinfo_operator where u_id=?)", id);
    }

    public List<Operator> findAllOperators() {
        return dao.find("select * from operator");
    }
}
