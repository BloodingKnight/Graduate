package com.nightknight.graduate.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ASUS
 * Date: 13-5-12
 * Time: 下午11:35
 * To change this template use File | Settings | File Templates.
 */
public class Result extends Model<Result> {

    public static final Result dao = new Result();

    public List<Result> findByReportWithInspectName(Object id) {
        return dao.find("select r.*, i.name as inspect_name from result r, inspect i where r_id=? and i.id=r.i_id", id);
    }

    public long countByReport(Object id) {
        return dao.findFirst("select count(1) as num from result where r_id=?", id).get("num");
    }

    public Report getReport() {
        return Report.dao.findById(get("r_id"));
    }

    public Inspect getInspect() {
        return Inspect.dao.findById(get("i_id"));
    }

    public boolean isLastResult() {
        return ((Integer) getInspect().get("id")).equals((Integer) getReport().findLastInspect().get("id"));

    }
}
