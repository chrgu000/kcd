package com.mapper1.businessPayApplication;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.model1.icbc.erp.PageData;

public interface BusinessPayMapper {

	
	/**
	 * 查询全部数据 by  zp 2019-1-22
	 * @return 
	 */
   List<PageData> selectBusinessPay(@Param("param") String param);
   
   /**
    * 添加前的查询
    */
   Map<String, Object> selectCardno(@Param("c_cardno") String c_cardno);
   /**
    * 查询垫款
    */
   List<Map> selectdetail(@Param("id_card") String id_card,@Param("periods") String periods);
   
    /**
     * 添加数据到表中
     */
   int addBusin(Map<String, Object> map);
   
   /**
    * 添加还款计划
    */
   int addhk(Map<String, Object> map);
   
   /**
    * 查询用户信息表
    */
   Map<String, Object> selectconfirm(String id_card);
   
   /**
    * 修改状态
    */
   int updateflag(@Param("id_card") String id_card,@Param("periods") String periods,@Param("date") String date,@Param("day") String day);
}
