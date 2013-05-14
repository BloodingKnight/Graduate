package com.nightknight.graduate.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.nightknight.graduate.interceptor.OperatorInterceptor;
import com.nightknight.graduate.model.Inspect;
import com.nightknight.graduate.model.Plan;
import com.nightknight.graduate.model.Report;
import com.nightknight.graduate.model.Result;
import com.nightknight.graduate.validator.NextInspectValidator;
import com.nightknight.graduate.validator.OpenReportValidator;

import java.sql.Date;

@Before(OperatorInterceptor.class)
public class CheckController extends Controller {

    // TODO 应该是从数据库中取出登录用户相关的plan
    public void index() {
        setAttr("plans", Plan.dao.findAllPlans());
        render("plans.jsp");
    }

    /**
     * 取出一个plan的信息，并且取出相应的所有report的信息
     */
    public void info() {
        Integer p_id = getParaToInt("p_id");
        Plan plan = Plan.dao.findById(p_id);
        plan.put("reports", plan.getReports());
        plan.put("device", plan.getDevice());
        setAttr("plan", plan);

        render("plan.jsp");
    }

    @Before(OpenReportValidator.class)
    public void open() {
        Integer p_id = getParaToInt("p_id");

        Report report = new Report();
        report.set("open", new Date(System.currentTimeMillis())).set("p_id", p_id);
        report.save();

        keepPara("p_id");
        forwardAction("/check/info");
    }

    public void check() {
        Integer r_id = getParaToInt("r_id");

        Report report = Report.dao.findById(r_id);
        Plan plan = report.getPlan();
        plan.put("device", plan.getDevice());
        report.put("results", Result.dao.findByReportWithInspectName(r_id));
        setAttr("report", report);
        setAttr("plan", plan);

        render("check.jsp");
    }

    @Before(NextInspectValidator.class)
    public void next() {
        Integer r_id = getParaToInt("r_id");

        Report report = Report.dao.findById(r_id);
        Inspect inspect = report.findNextInspect();
        Plan plan = report.getPlan();

        setAttr("plan", plan);
        setAttr("inspect", inspect);
        setAttr("report", report);

        render("inspect.jsp");
    }

    public void save() {
        Result result = getModel(Result.class);

        result.save();
        if (result.isLastResult()) {
            result.getReport().set("close", new Date(System.currentTimeMillis())).update();
        }

        keepPara("r_id");
        forwardAction("/check/check");
    }

    public void update() {
        Integer r_id = getParaToInt("r_id");
        String memo = getPara("memo");

        Report.dao.findById(r_id).set("memo", memo).update();

        keepPara("r_id");
        forwardAction("/check/check");
    }
}