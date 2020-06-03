package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CarcinomaMapper;
import com.ruoyi.system.domain.Carcinoma;
import com.ruoyi.system.service.ICarcinomaService;
import com.ruoyi.common.core.text.Convert;

/**
 * carcinoma检测 服务层实现
 * 
 * @author ruoyi
 * @date 2020-05-06
 */
@Service
public class CarcinomaServiceImpl implements ICarcinomaService 
{
	@Autowired
	private CarcinomaMapper carcinomaMapper;

	/**
     * 查询carcinoma检测信息
     * 
     * @param carcinomaId carcinoma检测ID
     * @return carcinoma检测信息
     */
    @Override
	public Carcinoma selectCarcinomaById(Integer carcinomaId)
	{
	    return carcinomaMapper.selectCarcinomaById(carcinomaId);
	}
	
	/**
     * 查询carcinoma检测列表
     * 
     * @param carcinoma carcinoma检测信息
     * @return carcinoma检测集合
     */
	@Override
	public List<Carcinoma> selectCarcinomaList(Carcinoma carcinoma)
	{
	    return carcinomaMapper.selectCarcinomaList(carcinoma);
	}
	
    /**
     * 新增carcinoma检测
     * 
     * @param carcinoma carcinoma检测信息
     * @return 结果
     */
	@Override
	public int insertCarcinoma(Carcinoma carcinoma)
	{
	    return carcinomaMapper.insertCarcinoma(carcinoma);
	}
	
	/**
     * 修改carcinoma检测
     * 
     * @param carcinoma carcinoma检测信息
     * @return 结果
     */
	@Override
	public int updateCarcinoma(Carcinoma carcinoma)
	{
	    return carcinomaMapper.updateCarcinoma(carcinoma);
	}

	/**
     * 删除carcinoma检测对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteCarcinomaByIds(String ids)
	{
		return carcinomaMapper.deleteCarcinomaByIds(Convert.toStrArray(ids));
	}
	
}
