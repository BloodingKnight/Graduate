package com.nightknight.graduate.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.nightknight.graduate.model.User;
import org.apache.log4j.Logger;


/**
 * InspectDeleteValidator
 * 当要删除检查项的时候，查看是否有与之关联的设备，若有则禁止删除
 */
public class UserExsistsValidator extends Validator {

    private static final Logger logger = Logger.getLogger(UserExsistsValidator.class);

    protected void validate(Controller controller) {
        User user = controller.getModel(User.class);
        for (User u : User.dao.findAllUsers()) {
            if (u.get("username").equals(user.get("username"))) {
                addError("userExsists", "用户名已存在，请重新选择一个用户名");
            }
        }
	}
	
	protected void handleError(Controller controller) {
        controller.keepModel(User.class);
		controller.forwardAction("/user/addUser");
	}
}
