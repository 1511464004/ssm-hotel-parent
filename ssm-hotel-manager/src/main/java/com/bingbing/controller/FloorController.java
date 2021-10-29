package com.bingbing.controller;

import com.alibaba.fastjson.JSON;
import com.bingbing.entity.Floor;
import com.bingbing.service.FloorService;
import com.bingbing.utils.DataGridViewResult;
import com.bingbing.utils.SystemConstants;
import com.bingbing.vo.FloorVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/floor")
public class FloorController {

    @Resource
    private FloorService floorService;

    /**
     * 查询楼层列表
     * @param floorVo
     * @return
     */
    @RequestMapping("/list")
    public DataGridViewResult list(FloorVo floorVo) {
        //设置分页信息
        PageHelper.startPage(floorVo.getPage(),floorVo.getLimit());
        //调用查询楼层列表方法
        List<Floor> floorList = floorService.findFloorList(floorVo);
        //创建分页对象
        PageInfo<Floor> pageInfo = new PageInfo<>(floorList);
        //返回数据
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }

    /**
     * 添加楼层
     * @param floor
     * @return
     */
    @RequestMapping("/addFloor")
    public String addFloor(Floor floor) {
        Map<String,Object> map = new HashMap<>();
        if (floor.getFloorName() == null || floor.getFloorName() == "") {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"添加失败，楼层名称不能为空！");
            return JSON.toJSONString(map);
        }
        Floor floor1 = floorService.getFloorByFloorName(floor.getFloorName());
        if (floor1 != null) {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"添加失败，这个楼层已经存在！");
            return JSON.toJSONString(map);
        }
        if (floorService.insert(floor) > 0) {
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"添加成功");
        } else {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"添加失败");
        }
        return JSON.toJSONString(map);
    }

    /**
     * 修改楼层
     * @param floor
     * @return
     */
    @RequestMapping("/updateFloor")
    public String updateDept(Floor floor) {
        Map<String,Object> map = new HashMap<>();
        if (floor.getFloorName() == null || floor.getFloorName() == "") {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"修改失败，楼层名称不能为空！");
            return JSON.toJSONString(map);
        }
        Floor floor1 = floorService.getFloorFloorNameId(floor.getFloorName(),floor.getId());
        if (floor1 != null) {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"修改失败，这个楼层已经存在！");
            return JSON.toJSONString(map);
        }
        if (floorService.updateFloor(floor) > 0) {
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"修改成功");
        } else {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"修改失败");
        }
        return JSON.toJSONString(map);
    }

    /**
     * 查询楼层列表数据
     * @return
     */
    @RequestMapping("/floorList")
    public String floorList() {
        return floorService.getFloorListByRedis();
    }

}
