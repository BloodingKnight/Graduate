package com.nightknight.graduate.service;

import com.nightknight.graduate.model.Device;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: nightknight
 * Date: 13-5-9
 * Time: 上午9:48
 * To change this template use File | Settings | File Templates.
 */
public class DeviceAdminService {

    public void updateDevice(Device device) {

        if (null != device.get("inspects")) {
            handleInspects(device.<Object[]>get("inspects"));
        }

        if (null != device.get("plans")) {
            handlePlans(device.<Object[]>get("plans"));
        }

        device.update();
    }


    private void handleWarehouse(Object warehouse) {}

    /**
     * 处理device和inspects之间的关联
     * @param inspects
     */
    private void handleInspects(Object[] inspects) {}

    /**
     * 处理device和plan之间的关联
     * @param plans
     */
    private void handlePlans(Object[] plans) {}
}
