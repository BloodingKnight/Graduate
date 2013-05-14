package com.nightknight.graduate.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.ArrayList;
import java.util.List;

public class Inspect extends Model<Inspect> {

    public static final Inspect dao = new Inspect();

    public List<Inspect> findByDevice(Object id) {
        return dao.find("select * from inspect where id in (select i_id from device_inspect where d_id=?)", id);
    }

    public List<Inspect> findByPlan(Object id) {
        return dao.find("select * from inspect where id in (select i_id from plan_inspect where p_id=?)", id);
    }

    public List<Inspect> findAllInspects() {
        return dao.find("select * from inspect");
    }

    /**
     * 判断该检查项是否有相应的device与之关联
     * @param id
     * @return
     */
    public boolean hasDevice(Object id) {
        return (((Long) dao.findFirst("select count(1) as count from device_inspect where i_id=?", id).get("count")) > 1);
    }

    /**
     * 返回device表中的第一个device的inspects
     * 如果device表为空，则应该手动返回一个空列表
     * TODO 应该使用validator，当没有device的时候提醒先新建device
     * @return
     */
    public List<Inspect> findByFirstDevice() {
        if (null != Device.dao.findFirstDevice()) {
            return dao.findByDevice(Device.dao.findFirstDevice().get("id"));
        }
        return new ArrayList<Inspect>();
    }
}
