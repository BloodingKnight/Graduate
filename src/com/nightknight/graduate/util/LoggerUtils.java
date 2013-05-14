package com.nightknight.graduate.util;

import com.nightknight.graduate.controller.WarehouseController;
import org.apache.log4j.Logger;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Userinfo: nightknight
 * Date: 13-4-28
 * Time: 下午2:43
 * To change this template use File | Settings | File Templates.
 */
public class LoggerUtils {

    private static final Map<Class, Logger> logMap = new HashMap<Class, Logger>();

    static {
        logMap.put(WarehouseController.class, Logger.getLogger(WarehouseController.class));
    }

    public Logger getLogger() {
        return null;
    }
}
