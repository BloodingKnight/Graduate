package com.nightknight.graduate.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.nightknight.graduate.model.Inspect;
import org.apache.log4j.Logger;


/**
 * InspectDeleteValidator
 * 当要删除检查项的时候，查看是否有与之关联的设备，若有则禁止删除
 */
public class InspectDeleteValidator extends Validator {

    private static final Logger logger = Logger.getLogger(InspectDeleteValidator.class);

    protected void validate(Controller controller) {
        if (Inspect.dao.hasDevice(controller.getParaToInt("id"))) {
            addError("deleteError", "有与之关联的device，请先删除这些设备!");
            logger.warn("尝试删除非空检查项,失败!");
        }
	}
	
	protected void handleError(Controller controller) {
		controller.forwardAction("/inspect");
	}
}
