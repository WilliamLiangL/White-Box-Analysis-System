package com.ruoyi.web.controller.system;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Carcinoma;
import com.ruoyi.system.service.ICarcinomaService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * carcinoma检测 信息操作处理
 * 
 * @author ruoyi
 * @date 2020-05-06
 */
@Controller
@RequestMapping("/system/carcinoma")
public class CarcinomaController extends BaseController
{
    private String prefix = "system/carcinoma";
	
	@Autowired
	private ICarcinomaService carcinomaService;
	
	@RequiresPermissions("system:carcinoma:view")
	@GetMapping()
	public String carcinoma()
	{
	    return prefix + "/carcinoma";
	}
	
	/**
	 * 查询carcinoma检测列表
	 */
	@RequiresPermissions("system:carcinoma:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Carcinoma carcinoma)
	{
		startPage();
        List<Carcinoma> list = carcinomaService.selectCarcinomaList(carcinoma);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出carcinoma检测列表
	 */
	@RequiresPermissions("system:carcinoma:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Carcinoma carcinoma)
    {
    	List<Carcinoma> list = carcinomaService.selectCarcinomaList(carcinoma);
        ExcelUtil<Carcinoma> util = new ExcelUtil<Carcinoma>(Carcinoma.class);
        return util.exportExcel(list, "carcinoma");
    }
	
	/**
	 * 新增carcinoma检测
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存carcinoma检测
	 */
	@RequiresPermissions("system:carcinoma:add")
	@Log(title = "carcinoma检测", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Carcinoma carcinoma)
	{		
		return toAjax(carcinomaService.insertCarcinoma(carcinoma));
	}

	/**
	 * 修改carcinoma检测
	 */
	@GetMapping("/edit/{carcinomaId}")
	public String edit(@PathVariable("carcinomaId") Integer carcinomaId, ModelMap mmap)
	{
		Carcinoma carcinoma = carcinomaService.selectCarcinomaById(carcinomaId);
		mmap.put("carcinoma", carcinoma);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存carcinoma检测
	 */
	@RequiresPermissions("system:carcinoma:edit")
	@Log(title = "carcinoma检测", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Carcinoma carcinoma)
	{		
		return toAjax(carcinomaService.updateCarcinoma(carcinoma));
	}
	
	/**
	 * 删除carcinoma检测
	 */
	@RequiresPermissions("system:carcinoma:remove")
	@Log(title = "carcinoma检测", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(carcinomaService.deleteCarcinomaByIds(ids));
	}
	
}
