package com.bingbing.controller;

import com.alibaba.fastjson.JSON;
import com.bingbing.entity.RoomType;
import com.bingbing.service.RoomTypeService;
import com.bingbing.utils.DataGridViewResult;
import com.bingbing.utils.SystemConstants;
import com.bingbing.utils.UUIDUtils;
import com.bingbing.vo.RoomTypeVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin/roomType")
public class RoomTypeController {

    @Resource
    private RoomTypeService roomTypeService;

    /**
     * 查询房型列表
     * @return
     */
    @RequestMapping("/list")
    public DataGridViewResult roomTypeList(RoomTypeVo roomTypeVo){
        //设置分页信息
        PageHelper.startPage(roomTypeVo.getPage(),roomTypeVo.getLimit());
        //调用查询的方法
        List<RoomType> roomTypeList =  roomTypeService.findRoomTypeList(roomTypeVo);
        //创建分页对象
        PageInfo<RoomType> pageInfo = new PageInfo<>(roomTypeList);
        //返回对象
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("/uploadFile")
    public String roomTypeList(MultipartFile attach){
        //创建Map集合保存数据（响应到前台页面的数据）
        Map<String,Object> map = new HashMap<>();
        //判断是否有选中文件
        if (!attach.isEmpty()) {
            //获取文件上传地址
            String path = "D:/ADAI/boottest/ssm-hotel-parent/ssm-hotel-web/src/main/webapp/upload/";
            //获取源文件名称
            String oldName = attach.getOriginalFilename();
            //获取文件后缀名
            String extension = FilenameUtils.getExtension(oldName);
            //重命名文件名称
            String newFileName = UUIDUtils.randomUUID()+"."+extension;
            //为了解决同一个文件下文件过多的问题，使用日期作为文件夹管理
            String datePath = new SimpleDateFormat("yyyyMMdd").format(new Date());
            //组装最终的文件名
            String finalName = datePath + "/" + newFileName;
            //创建文件对象
            File destFile = new File(path,finalName);
            //判断文件夹是否存在，文件夹不存在则创建该文件夹
            if (!destFile.getParentFile().exists()) {
                destFile.getParentFile().mkdirs();
            }
            try {
                //将文件保存到硬盘
                attach.transferTo(destFile);
                //保存响应的数据
                map.put("code",0);
                map.put("msg","");
                Map<String,Object> dataMap = new HashMap<>();
                dataMap.put("src","/upload/"+finalName);//文件上传成功的回显地址
                map.put("data",dataMap);
                map.put("imagePath",finalName);//图片名称，目的是给photo隐藏域值
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return JSON.toJSONString(map);
    }

    /**
     * 添加房型
     * @param roomType
     * @return
     */
    @RequestMapping("/addRoomType")
    public String addRoomType(RoomType roomType) {
        Map<String,Object> map = new HashMap<>();
        if (roomType.getTypeName() == null || roomType.getTypeName() == "") {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"添加失败，楼层名称不能为空！");
            return JSON.toJSONString(map);
        }
        RoomType roomType1 = roomTypeService.getRoomTypeName(roomType.getTypeName());
        if (roomType1 != null) {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"添加失败，这个房型已经存在！");
            return JSON.toJSONString(map);
        }
        if (roomTypeService.insert(roomType) > 0) {
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"添加成功");
        } else {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"添加失败");
        }
        return JSON.toJSONString(map);
    }

    /**
     * 修改房型
     * @param roomType
     * @return
     */
    @RequestMapping("/updateRoomType")
    public String updateRoomType(RoomType roomType) {
        Map<String,Object> map = new HashMap<>();
        if (roomType.getTypeName() == null || roomType.getTypeName() == "") {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"添加失败，楼层名称不能为空！");
            return JSON.toJSONString(map);
        }
        RoomType roomType1 = roomTypeService.getRoomTypeNameId(roomType.getTypeName(),roomType.getId());
        if (roomType1 != null) {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"修改失败，这个房型已经存在！");
            return JSON.toJSONString(map);
        }
        if (roomTypeService.updateRoomType(roomType) > 0) {
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"修改成功");
        } else {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"修改失败");
        }
        return JSON.toJSONString(map);
    }

    /**
     * 删除检查房型下是否存在房间
     * @param roomTypeId
     * @return
     */
    @RequestMapping("/checkRoomTypeHasRoom")
    public String checkRoomTypeHasRoom(Integer roomTypeId) {
        Map<String,Object> map = new HashMap<>();
        if (roomTypeService.getRoomCountByRoomTypeId(roomTypeId) > 0) {
            map.put(SystemConstants.EXIST,true);
            map.put(SystemConstants.MESSAGE,"该房型下是否存在房间，无法删除");
        } else {
            map.put(SystemConstants.EXIST,false);
        }
        return JSON.toJSONString(map);
    }

    /**
     * 删除房型
     * @param id
     * @return
     */
    @RequestMapping("/deleteById")
    public String deleteById(Integer id) {
        Map<String,Object> map = new HashMap<>();
        if (roomTypeService.deleteById(id) > 0) {
            map.put(SystemConstants.SUCCESS,true);
            map.put(SystemConstants.MESSAGE,"删除成功");
        } else {
            map.put(SystemConstants.SUCCESS,false);
            map.put(SystemConstants.MESSAGE,"删除失败");
        }
        return JSON.toJSONString(map);
    }

    /**
     * 查询房型列表数据
     * @return
     */
    @RequestMapping("/roomTypeList")
    public String roomTypeList() {
        return roomTypeService.getRoomTypeListByRedis();
    }



}
