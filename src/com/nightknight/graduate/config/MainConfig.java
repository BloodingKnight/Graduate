package com.nightknight.graduate.config;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.wall.WallFilter;
import com.jfinal.config.Constants;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.config.Interceptors;
import com.jfinal.config.Handlers;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.SqlReporter;
import com.jfinal.plugin.c3p0.C3p0Plugin;

import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;

import com.nightknight.graduate.controller.*;
import com.nightknight.graduate.model.*;

public class MainConfig extends JFinalConfig {
	
	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
		loadPropertyFile("app.properties");
		me.setViewType(ViewType.JSP);
	}

	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) {
//        JspRender.setSupportActiveRecord(false);
		me.add("/", CommonController.class);
		me.add("/warehouse", WarehouseController.class);
        me.add("/device", DeviceController.class);
        me.add("/plan", PlanController.class);
        me.add("/inspect", InspectController.class);
        me.add("/check", CheckController.class);
        me.add("/user", UserController.class);
	}

	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
//        配置Druid数据库连接池插件
        DruidPlugin dp = new DruidPlugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password"));
        dp.setFilters("stat");
        dp.addFilter(new StatFilter());
        WallFilter wall = new WallFilter();
        wall.setDbType("mysql");
        dp.addFilter(wall);
        me.add(dp);
		me.add(new EhCachePlugin());
//        配置ActiveRecord插件
//        AutoTableBindPlugin arp = new AutoTableBindPlugin(dp, TableNameStyle.LOWER);
//        me.add(arp);
//        arp.setShowSql(true);
//        SqlReporter.setLogger(true);

		// 配置C3p0数据库连接池插件
		C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
		me.add(c3p0Plugin);
		
//		配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);
//
        arp.setShowSql(true);
        SqlReporter.setLogger(true);

		arp.addMapping("warehouse", Warehouse.class);
		arp.addMapping("device", Device.class);
		arp.addMapping("plan", Plan.class);
        arp.addMapping("inspect", Inspect.class);
		arp.addMapping("report", Report.class);
        arp.addMapping("userinfo", User.class);
        arp.addMapping("operator", Operator.class);
        arp.addMapping("result", Result.class);
	}

	/**
	 * 配置拦截器
	 */
	public void configInterceptor(Interceptors me) {}

	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {}

}
