package com.nightknight.graduate.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.nightknight.graduate.interceptor.CommonInterceptor;
import com.nightknight.graduate.model.User;
import com.nightknight.graduate.validator.LoginValidator;
import com.nightknight.graduate.validator.UpdateUserValidator;

public class CommonController extends Controller {

    /**
     * 索引页面
     */
    @Before(LoginValidator.class)
	public void index() {
		redirect("/Graduate/body/index.jsp");
	}

    /**
     * 登录方法
     */
    public void login() {
        String username = getPara("username");
        String password = getPara("password");

        User user = User.dao.findUserByName(username);
        if (null != user && user.get("password").equals(password)) {
            setSessionAttr("loginUser", user);
            setSessionAttr("operators", user.getOperators());
            redirect("/Graduate/body/index.jsp");
        } else {
            setAttr("message", "用户名或密码错误!请联系管理员或重新注册。");
            render("/login.jsp");
        }
    }

    public void logout() {
        removeSessionAttr("loginUser");
        removeSessionAttr("operators");

        redirect("/Graduate/login.jsp");
    }

    public void modify() {
        Integer id = getParaToInt("id");

        setAttr("user", User.dao.findById(id));
        render("info.jsp");
    }

    public void update() {
        getModel(User.class).update();

        render("/body/index.jsp");
    }

    public void pwd() {

        Integer id = getParaToInt("id");

        setAttr("user", User.dao.findById(id));
        render("pwd.jsp");
    }

    @Before(UpdateUserValidator.class)
    public void updatePwd() {
        getModel(User.class).update();

        render("/body/index.jsp");
    }
}
