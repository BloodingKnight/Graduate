package com.nightknight.graduate.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpSession;


/**
 * LoginValidator
 * 判断用户是否登录，如果没有，则跳转到登录页面.
 */
public class LoginValidator extends Validator {

    private Logger logger = Logger.getLogger(LoginValidator.class);

    /**
     * 校验方法
     * 检查session中是否有登录用户信息，若没有则说明用户未登录，转到错误处理
     * @param controller
     */
    @Override
	protected void validate(Controller controller) {
        if (controller.getSessionAttr("loginUser") == null) {
            addError("loginError", "对不起，您还没有登录，没有操作权限!");
            logger.warn("Error!!! User not login!");
        }
	}

    /**
     * 错误处理
     * 返回登录页面
     * @param controller
     */
    @Override
	protected void handleError(Controller controller) {
		controller.redirect("/Graduate/login.jsp");
	}
}
