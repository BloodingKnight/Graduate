package com.nightknight.graduate.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.nightknight.graduate.interceptor.OperatorInterceptor;
import com.nightknight.graduate.model.Inspect;
import com.nightknight.graduate.validator.InspectDeleteValidator;

@Before(OperatorInterceptor.class)
public class InspectController extends Controller {

    public void index() {
        setAttr("inspects", Inspect.dao.findAllInspects());
        render("inspects.jsp");
    }

    public void save() {
        getModel(Inspect.class).save();
        forwardAction("/inspect");
    }

    public void update() {
        getModel(Inspect.class).update();
        forwardAction("/inspect");
    }

    @Before(InspectDeleteValidator.class)
    public void delete() {
        Inspect.dao.deleteById(getParaToInt("id"));
        forwardAction("/inspect");
    }
}
