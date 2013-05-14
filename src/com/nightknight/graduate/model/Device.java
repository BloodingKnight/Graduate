package com.nightknight.graduate.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

public class Device extends Model<Device> {

	public static final Device dao = new Device();

    /**
     * 取出device所在的warehouse
     * @return
     */
    public Warehouse getWarehouse() {
        return Warehouse.dao.findById(get("w_id"));
    }

    public List<Inspect> getInspects() {
        return Inspect.dao.findByDevice(get("id"));
    }

    /**
     * 取出device所包含的plan
     * @return
     */
    public List<Plan> getPlans() {
        return Plan.dao.findPlansByDevice(get("id"));
    }

    /**
     * 取出所有的device
     * @return
     */
    public List<Device> findAllDevices() {
        return dao.find("select * from device");
    }

    public List<Device> findAllDevicesWithWarehouseName() {
        return dao.find("select d.*, w.name as warehouse_name from device d, warehouse w where d.w_id=w.id");
    }

    public Device findFirstDevice() {
        return dao.findFirst("select * from device limit 1");
    }
}
