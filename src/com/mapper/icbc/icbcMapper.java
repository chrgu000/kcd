package com.mapper.icbc;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.icbc.icbc;

public interface icbcMapper {

	//添加工行进件信息
	public void addicbc(icbc icbc);
	//更新工行进件信息
	public void upicbc(icbc icbc);
    //根据订单编号 查询
	public icbc findicbcbyorderid(String orderid);
	//findicbc 遍历
	public List<icbc> findicbc(@Param("querytype")int querytype,@Param("bc_status")int bc_status);
	//根据id查询
	public icbc findicbcbyid(@Param("id")int id);

}
