package com.nightknight.graduate.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.nightknight.graduate.interceptor.OperatorInterceptor;
import com.nightknight.graduate.model.*;
import com.nightknight.graduate.validator.NextInspectValidator;
import com.nightknight.graduate.validator.OpenReportValidator;
import com.nightknight.graduate.validator.UserExsistsValidator;

import java.sql.Date;

@Before(OperatorInterceptor.class)
public class UserController extends Controller {

    // TODO 应该是从数据库中取出登录用户相关的plan
    public void index() {
        setAttr("users", User.dao.findAllUsers());
        render("users.jsp");
    }

    /**
     * 取出一个user的信息，并且取出相应的所有operator的信息
     */
    public void infoUser() {
        Integer u_id = getParaToInt("u_id");
        User user = User.dao.findById(u_id);
        user.put("operators", user.getOperators());
        setAttr("user", user);

        render("user.jsp");
    }

    public void editUser() {
        Integer u_id = getParaToInt("u_id");
        User user = User.dao.findById(u_id);
        user.put("operators", JsonKit.listToJson(user.getOperators(), 8));
        setAttr("user", user);
        setAttr("operators", Operator.dao.findAllOperators());

        render("edit.jsp");
    }

    public void addUser() {
        setAttr("operators", Operator.dao.findAllOperators());

        render("add.jsp");
    }

    public void deleteUser() {
        User.dao.deleteById(getParaToInt("u_id"));

        forwardAction("/user");
    }

    @Before(UserExsistsValidator.class)
    public void saveUser() {
        User user = getModel(User.class).set("password", "111111");
        user.save();

        Integer[] operators = getParaValuesToInt("operators");
        if (operators != null) {
            for (int op : operators) {
                Record record = new Record().set("u_id", user.get("id")).set("o_id", op);
                Db.save("userinfo_operator", record);
            }
        }
        forwardAction("/user");
    }

    public void updateUser() {
        User user = getModel(User.class);

        Db.update("delete from userinfo_operator where u_id=?", user.get("id"));
        Integer[] operators = getParaValuesToInt("operators");
        if (operators != null) {
            for (int op : operators) {
                Record record = new Record().set("u_id", user.get("id")).set("o_id", op);
                Db.save("userinfo_operator", record);
            }
        }
        user.update();

        forwardAction("/user");
    }

    public void operators() {
        setAttr("operators", Operator.dao.findAllOperators());

        render("operators.jsp");
    }

    public void saveOperator() {
        getModel(Operator.class).save();

        forwardAction("/user/operators");
    }

    public void updateOperator() {
        getModel(Operator.class).update();

        forwardAction("/user/operators");
    }

    public void deleteOperator() {
        Operator.dao.deleteById(getParaToInt("o_id"));

        forwardAction("/user/operator");
    }
}