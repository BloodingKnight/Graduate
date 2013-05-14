package com.nightknight.graduate.model;

import com.jfinal.config.JFinalConfig;
import com.jfinal.core.JFinal;
import com.nightknight.graduate.config.MainConfig;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

import javax.servlet.ServletContext;
import java.lang.reflect.Method;

/**
 * Device Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>五月 7, 2013</pre>
 */
public class DeviceTest {

    private Device device = new Device();

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: getWarehouse()
     */
    @Test
    public void testGetWarehouse() throws Exception {
    }

    /**
     * Method: getInspects()
     */
    @Test
    public void testGetInspects() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: getPlans()
     */
    @Test
    public void testGetPlans() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: findAllDevices()
     */
    @Test
    public void testFindAllDevices() throws Exception {
//TODO: Test goes here... 
    }

    /**
     * Method: findAllDevicesWithWarehouseName()
     */
    @Test
    public void testFindAllDevicesWithWarehouseName() throws Exception {
//        Class.forName("com.nightknight.graduate.config.MainConfig");
//        JFinal;
        Method method = JFinal.me().getClass().getDeclaredMethod("init", JFinalConfig.class, ServletContext.class);
        method.setAccessible(true);
        method.invoke(JFinal.me(), new MainConfig(), new MockServletContext());

        for (Device d : device.findAllDevicesWithWarehouseName()) {
            for (String attrName : d.getAttrNames()) {
                System.out.println(attrName + "--->" + d.get(attrName));
            }
        }
    }


} 
