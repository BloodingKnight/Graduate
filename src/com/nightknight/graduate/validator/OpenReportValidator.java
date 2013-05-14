package com.nightknight.graduate.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.nightknight.graduate.model.Plan;
import org.apache.log4j.Logger;

/**
 * Created with IntelliJ IDEA.
 * User: ASUS
 * Date: 13-5-12
 * Time: 下午11:25
 * To change this template use File | Settings | File Templates.
 */
public class OpenReportValidator extends Validator {

    private static final Logger logger = Logger.getLogger(OpenReportValidator.class);
    @Override
    protected void validate(Controller c) {
        Integer p_id = c.getParaToInt("p_id");

        if (!Plan.dao.isPlanReportClosed(p_id)) {
            addError("openReportError", "计划有报告未结束");
            logger.warn("尝试在有报告未结束时打开新的报告!");
        }
    }

    @Override
    protected void handleError(Controller c) {
        c.keepPara("p_id");
        c.forwardAction("/check/info");
    }
}
