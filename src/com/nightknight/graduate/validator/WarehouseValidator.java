package com.nightknight.graduate.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

import com.nightknight.graduate.model.Warehouse;


/**
 * WarehouseValidator.
 */
public class WarehouseValidator extends Validator {
	
	protected void validate(Controller controller) {
		validateRequiredString("warehouse.name", "nameMsg", "请输入仓库名称!");
		validateRequiredString("warehouse.admin", "adminMsg", "请输入仓库管理员姓!");
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Warehouse.class);

		controller.forwardAction("/warehouse");
	}
}
