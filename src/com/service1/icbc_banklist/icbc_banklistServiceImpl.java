package com.service1.icbc_banklist;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper1.icbc_banklist.icbc_banklistMapper;
import com.model1.icbc.erp.PageData;

@Service
@Transactional(value = "kcway2", rollbackFor = Exception.class)
public class icbc_banklistServiceImpl implements icbc_banklistService {

	@Resource
	private icbc_banklistMapper icbc_banklistMapper;

	@Override
	public List<PageData> geticbc_banklist() {
		// ��ѯ������Ϣ
		return icbc_banklistMapper.geticbc_banklist();
	}

}