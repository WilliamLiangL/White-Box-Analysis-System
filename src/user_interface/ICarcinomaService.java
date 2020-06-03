package com.ruoyi.system.service;

import com.ruoyi.system.domain.Carcinoma;
import java.util.List;

/**
 * carcinoma检测 服务层
 * 
 * @author ruoyi
 * @date 2020-05-06
 */
public interface ICarcinomaService 
{
	/**
     * 查询carcinoma检测信息
     * 
     * @param carcinomaId carcinoma检测ID
     * @return carcinoma检测信息
     */
	public Carcinoma selectCarcinomaById(Integer carcinomaId);
	
	/**
     * 查询carcinoma检测列表
     * 
     * @param carcinoma carcinoma检测信息
     * @return carcinoma检测集合
     */
	public List<Carcinoma> selectCarcinomaList(Carcinoma carcinoma);
	
	/**
     * 新增carcinoma检测
     * 
     * @param carcinoma carcinoma检测信息
     * @return 结果
     */
	public int insertCarcinoma(Carcinoma carcinoma);
	
	/**
     * 修改carcinoma检测
     * 
     * @param carcinoma carcinoma检测信息
     * @return 结果
     */
	public int updateCarcinoma(Carcinoma carcinoma);
		
	/**
     * 删除carcinoma检测信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteCarcinomaByIds(String ids);
	
}
