package com.nightknight.graduate.controller;

import com.jfinal.core.Controller;
import com.jfinal.aop.Before;

import com.nightknight.graduate.interceptor.CommonInterceptor;
import com.nightknight.graduate.interceptor.OperatorInterceptor;
import com.nightknight.graduate.model.Warehouse;
import com.nightknight.graduate.validator.WarehouseValidator;
import org.apache.log4j.Logger;

@Before(OperatorInterceptor.class)
public class WarehouseController extends Controller {

	public void index() {
		setAttr("warehouseList", Warehouse.dao.getAllWarehouses());
		render("warehouses.jsp");
	}

	@Before(WarehouseValidator.class)
	public void save() {
	    getModel(Warehouse.class).save();
		forwardAction("/warehouse");
	}

    @Before(WarehouseValidator.class)
    public void update() {
        getModel(Warehouse.class).update();
        forwardAction("/warehouse");
    }

	public void delete() {
		Warehouse.dao.deleteById(getParaToInt("id"));
		forwardAction("/warehouse");
	}
}
