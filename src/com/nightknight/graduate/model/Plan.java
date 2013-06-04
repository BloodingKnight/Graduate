package com.nightknight.graduate.model;

import com.jfinal.plugin.activerecord.Model;

import java.sql.Date;
import java.util.List;

public class Plan extends Model<Plan> {
	
	public static final Plan dao = new Plan();

    public static Date now() {
        return new Date(System.currentTimeMillis());
    }

    /**
     * 取出plan所下辖的report
     * @return
     */
    public List<Report> getReports() {
        return Report.dao.findReportsByPlan(get("id"));
    }

    public Device getDevice() {
        return Device.dao.findById(get("d_id"));
    }

    /**
     * 取出所有的plan
     * @return
     */
    public List<Plan> findAllPlans() {
        List<Plan> plans = dao.find("select * from plan");
        for (Plan plan : plans) {
            plan.put("device", plan.getDevice());
        }

        return plans;
    }

    /**
     * 根据所关联的device取出相应的plan
     * @param id device的id
     * @return
     */
    public List<Plan> findPlansByDevice(Object id) {
        List<Plan> plans = dao.find("select * from plan where d_id=?", id);
        for (Plan plan : plans) {
            plan.put("device", plan.getDevice());
        }

        return plans;
    }

    public List<Inspect> getInspects() {
        return Inspect.dao.findByPlan(get("id"));
    }

    public boolean isPlanReportClosed(Object p_id) {
        if (null != dao.findFirst("select close from report where p_id=?", p_id)) {
            return  (null != dao.findFirst("select close from report where p_id=? order by open", p_id).get("close"));
        }
        return true;
    }

    public List<Plan> findTodayPlans() {
        String sql = "select * from plan p, report r where p.id=r.p_id and p.start<='" + now() + "' and p.deadline>='" + now() + "' and r.close is null";
        List<Plan> plans = dao.find(sql);
        for (Plan plan : plans) {
            plan.put("device", plan.getDevice());
        }
        return plans;
    }


    public List<Plan> findTomorrowPlans() {
        String sql = "select * from plan where start>'" + now() + "'";
        System.out.println(sql);
        List<Plan> plans = dao.find(sql);
        for (Plan plan : plans) {
            plan.put("device", plan.getDevice());
        }
        return plans;
    }

    public List<Plan> findDeadPlans() {
        String sql = "select * from plan p, report r where r.p_id=p.id and p.deadline<'" + now() + "'" + " and r.close is null";
        List<Plan> plans = dao.find(sql);
        for (Plan plan : plans) {
            plan.put("device", plan.getDevice());
        }
        return plans;
    }

    public List<Plan> findFinishedPlans() {
        String sql = "select * from plan p, report r where r.p_id=p.id and p.deadline<='" + now() + "'" + " and r.close is not null";
        List<Plan> plans = dao.find(sql);
        for (Plan plan : plans) {
            plan.put("device", plan.getDevice());
        }
        return plans;
    }
}
