package com.nightknight.graduate.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.nightknight.graduate.interceptor.OperatorInterceptor;
import com.nightknight.graduate.model.Inspect;
import com.nightknight.graduate.model.Warehouse;
import com.nightknight.graduate.model.Device;


@Before(OperatorInterceptor.class)
public class DeviceController extends Controller {

    /**
     * 索引页，显示设备列表
     */
	public void index() {
		setAttr("devices", Device.dao.findAllDevicesWithWarehouseName());
		render("devices.jsp");
	}

    /**
     * 显示特定设备内容
     */
    public void info() {
        Device device = Device.dao.findById(getParaToInt("id"));
        /**
         * 需要同时显示设备的所在仓库，检查项，检查计划
         */
        if (null != device) {
            /**
             * 将属性放入device中（这是一个map，以便在前台可以使用device.**的方式获取
             */
            device.put("warehouse", device.getWarehouse());
            device.put("inspects", device.getInspects());
            device.put("plans", device.getPlans());

            setAttr("device", device);
        }

        render("device.jsp");
    }

    /**
     * 转到添加页面
     */
    public void add() {
        setAttr("warehouses", Warehouse.dao.getAllWarehouses());
        setAttr("inspects", Inspect.dao.findAllInspects());

        render("add.jsp");
    }

    /**
     * 转到编辑页面
     */
    public void edit() {
        Device device = Device.dao.findById(getParaToInt("id"));
        device.put("warehouse", device.getWarehouse());
        device.put("plans", device.getPlans());
        device.put("inspects", JsonKit.listToJson(device.getInspects(), 8));

        setAttr("device", device);
        setAttr("warehouses", Warehouse.dao.getAllWarehouses());
        setAttr("inspects", Inspect.dao.findAllInspects());
        render("edit.jsp");
    }

    /**
     * 将添加的内容存入数据库
     */
	public void save() {
        Device device = getModel(Device.class);
        device.save();
        Integer inspects[] = getParaValuesToInt("inspects");
        for (int inspect : inspects) {
            Record record = (new Record()).set("d_id", device.get("id")).set("i_id", inspect);
            Db.save("device_inspect", record);
        }
		forwardAction("/device/info?id=" + device.get("id"));
	}

    /**
     * 将编写的内容更新至数据库
     */
    // TODO 将Controller中的方法提取出来，放入service中
    public void update() {
        Device device = getModel(Device.class);
        /**
         * 处理device与inspect之间的关联
         */
        Integer inspects[] = getParaValuesToInt("inspects");
        Db.update("delete from device_inspect where d_id=?", device.get("id"));
        if (inspects != null) {
            for (int inspect : inspects) {
                Record record = (new Record()).set("d_id", device.get("id")).set("i_id", inspect);
                Db.save("device_inspect", record);
            }
        }
        device.update();
        forwardAction("/device/info?id=" + device.get("id"));
    }

    /**
     * 删除特定的数据
     */
	public void delete() {
		Device.dao.deleteById(getParaToInt("id"));
		forwardAction("/devices");
	}
}
