package com.nightknight.graduate.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;


/**
 * Created with IntelliJ IDEA.
 * Userinfo: nightknight
 * Date: 13-4-28
 * Time: 下午2:41
 * To change this template use File | Settings | File Templates.
 */
public class CommonInterceptor implements Interceptor {

    @Override
    public void intercept(ActionInvocation ai) {
        Logger logger = Logger.getLogger(ai.getController().getClass());

        logger.info("Before invoking " + ai.getActionKey());
        ai.invoke();
        logger.info("After invoking " + ai.getActionKey());

    }
}
