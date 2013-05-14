package com.nightknight.graduate.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.nightknight.graduate.model.Operator;
import com.nightknight.graduate.model.User;
import org.apache.log4j.Logger;


/**
 * Created with IntelliJ IDEA.
 * Userinfo: nightknight
 * Date: 13-4-28
 * Time: 下午2:41
 * To change this template use File | Settings | File Templates.
 */
public class OperatorInterceptor implements Interceptor {

    @Override
    public void intercept(ActionInvocation ai) {
        Logger logger = Logger.getLogger(ai.getController().getClass());

        String item = ai.getControllerKey().substring(1);
        boolean ok = false;

        if (ai.getController().getSessionAttr("loginUser") != null) {
            for (Operator operator : ((User) ai.getController().getSessionAttr("loginUser")).getOperators()) {
                if (operator.get("item").equals(item)) {
                    ok = true;
                }
            }

            if (ok) {
                ai.invoke();
            } else {
                ai.getController().setAttr("operatorError", "对不起，您没有相应的操作权限!");
                ai.getController().forwardAction("/");
            }
        } else {
            ai.getController().setAttr("loginError", "对不起，请先登录!");
            ai.getController().forwardAction("/");
        }
    }
}
