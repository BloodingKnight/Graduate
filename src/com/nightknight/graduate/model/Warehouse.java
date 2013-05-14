package com.nightknight.graduate.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

public class Warehouse extends Model<Warehouse> {

	/**
	 * @brief 
	 *
	 * @return 
	 */
	public static final Warehouse dao = new Warehouse();

    public List<Warehouse> getAllWarehouses() {
        return dao.find("select * from warehouse");
    }

    public boolean hasDevice(Integer id) {
        return (((Long) dao.findFirst("select count(1) as count from device where w_id=?", id).get("count")) > 1);
    }
}
