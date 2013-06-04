package com.nightknight.graduate.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.nightknight.graduate.interceptor.OperatorInterceptor;
import com.nightknight.graduate.model.Device;
import com.nightknight.graduate.model.Inspect;
import com.nightknight.graduate.model.Plan;

@Before(OperatorInterceptor.class)
public class PlanController extends Controller {

    public void index() {
        setAttr("plans", Plan.dao.findAllPlans());
        render("plans.jsp");
    }

    public void add() {
        setAttr("devices", Device.dao.findAllDevices());
        /**
         * 有可能是从device页面中点击添加计划按钮进入，因此此时会有device绑定
         * 如果参数中有device信息，则传入device的inspects，否则传入第一个device的inspects
         */
        Integer d_id = getParaToInt("d_id");
        if (d_id != null) {
            setAttr("device", Device.dao.findById(d_id));
            setAttr("inspects", JsonKit.listToJson(Inspect.dao.findByDevice(d_id), 8));
        } else {
            setAttr("inspects", JsonKit.listToJson(Inspect.dao.findByFirstDevice(), 8));
        }

        render("add.jsp");
    }

    public void save() {
        Plan plan = getModel(Plan.class);
        plan.save();

        Integer[] inspects = getParaValuesToInt("inspects");
        if (inspects != null) {
            int i = 1;
            for (int inspect : inspects) {
                Record record = (new Record()).set("p_id", plan.get("id")).set("i_id", inspect).set("seat", i);
                Db.save("plan_inspect", record);
                ++i;
            }

        }
        forwardAction("/plan");
    }

    public void edit() {
        Integer id = getParaToInt("id");
        Plan plan = Plan.dao.findById(id);
        int d_id = plan.get("d_id");

        setAttr("plan", plan);
        Device device = Device.dao.findById(d_id);
        plan.put("inspects", plan.getInspects());

        setAttr("inspects", JsonKit.listToJson(device.getInspects(), 8));
        setAttr("device", device);
        setAttr("devices", Device.dao.findAllDevices());

        render("edit.jsp");
    }

    public void update() {
        Plan plan = getModel(Plan.class);

        Db.update("delete from plan_inspect where d_id=?", plan.get("id"));

        Integer[] inspects = getParaValuesToInt("inspects");
        for (int inspect : inspects) {
            Record record = (new Record()).set("p_id", plan.get("id")).set("i_id", inspect);
            Db.save("plan_inspect", record);
        }

        forwardAction("/plan");
    }

    public void info() {
        Integer id = getParaToInt("id");
        Plan plan = Plan.dao.findById(id);
        int d_id = plan.get("d_id");
        plan.put("inspects", Inspect.dao.findByDevice(d_id));
        plan.put("device", Device.dao.findById(d_id));
        setAttr("plan", plan);

        render("plan.jsp");
    }

    public void delete() {
        Integer id = getParaToInt("id");
        Plan.dao.deleteById(id);

        forwardAction("/plan");
    }

    public void getDeviceInspects() {
        Integer d_id = getParaToInt("d_id");
        renderJson(Inspect.dao.findByDevice(d_id));
    }
}
