package com.nightknight.graduate.validator;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import com.nightknight.graduate.model.Plan;
import com.nightknight.graduate.model.Report;
import org.apache.log4j.Logger;

/**
 * Created with IntelliJ IDEA.
 * User: ASUS
 * Date: 13-5-12
 * Time: 下午11:25
 * To change this template use File | Settings | File Templates.
 */
public class NextInspectValidator extends Validator {

    private static final Logger logger = Logger.getLogger(NextInspectValidator.class);
    @Override
    protected void validate(Controller c) {
        Integer r_id = c.getParaToInt("r_id");

        if (Report.dao.isReportClosed(r_id)) {
            addError("nextInspectError", "该报告已结束，请重新打开一个报告!");
            logger.warn("尝试继续一个已经结束的报告！");
        }
    }

    @Override
    protected void handleError(Controller c) {
        c.keepPara("r_id");
        c.forwardAction("/check/check");
    }
}
