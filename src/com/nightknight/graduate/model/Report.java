package com.nightknight.graduate.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

public class Report extends Model<Report> {

	public static final Report dao = new Report();

    /**
     * 根据相关连的plan获取report
     * @param id plan的id
     * @return plan所下辖的report
     */
    public List<Report> findReportsByPlan(Object id) {
        return dao.find("select * from report where p_id=?", id);
    }

    public Plan getPlan() {
        return Plan.dao.findById(get("p_id"));
    }

    /**
     * 寻找下一个需要检查的检查项
     * @return
     */
    public Inspect findNextInspect() {
        List<Inspect> inspects = getPlan().getInspects();
        long r = Result.dao.countByReport(get("id"));

        return inspects.get((int) r);
    }

    /**
     * 返回最后一个应该检查的检查项
     * @return
     */
    public Inspect findLastInspect() {
        List<Inspect> inspects = getPlan().getInspects();
        return inspects.get(inspects.size() - 1);
    }

    public boolean isReportClosed(Integer r_id) {
        return (int) Result.dao.countByReport(r_id) == dao.findById(r_id).getPlan().getInspects().size();
    }
}
