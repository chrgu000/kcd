package com.service1.duoying;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model1.carmodel;

public interface carmodelService {

	//跟据数据编号查询数据
			public List<carmodel> findcarmodelbyid(int id);
			
			//查询所有数据
			public List<carmodel> findcarmodel();
			public carmodel modelmap(int id);
			//
			carmodel findcarbyid(int id);
}
