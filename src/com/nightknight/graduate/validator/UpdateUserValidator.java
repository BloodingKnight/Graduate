package com.nightknight.graduate.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.nightknight.graduate.model.User;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpSession;


/**
 * LoginValidator
 * 判断用户是否登录，如果没有，则跳转到登录页面.
 */
public class UpdateUserValidator extends Validator {

    private Logger logger = Logger.getLogger(UpdateUserValidator.class);

    /**
     * 校验方法
     * 检查session中是否有登录用户信息，若没有则说明用户未登录，转到错误处理
     * @param controller
     */
    @Override
	protected void validate(Controller controller) {
        User user = controller.getModel(User.class);
        if (controller.getPara("password").equals(User.dao.findById(user.get("id")).get("password"))) {
            user.update();
            controller.setSessionAttr("loginUser", user);
        } else {
            addError("pwdError", "密码错误!");
        }
    }

    /**
     * 错误处理
     * 返回登录页面
     * @param controller
     */
    @Override
	protected void handleError(Controller controller) {
        controller.keepPara("id");
        controller.forwardAction("/pwd");
	}
}
