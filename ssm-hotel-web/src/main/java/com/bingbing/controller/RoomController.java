package com.bingbing.controller;

import com.alibaba.fastjson.JSON;
import com.bingbing.entity.Room;
import com.bingbing.service.RoomService;
import com.bingbing.utils.DataGridViewResult;
import com.bingbing.utils.UUIDUtils;
import com.bingbing.vo.RoomVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/room")
public class RoomController {

    @Resource
    private RoomService roomService;

    /**
     * 查询房间列表
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public DataGridViewResult roomTypeList(RoomVo roomVo){
        //设置分页信息
        PageHelper.startPage(roomVo.getPage(),roomVo.getLimit());
        //调用查询的方法
        List<Room> roomList =  roomService.findRoomList(roomVo);
        //创建分页对象
        PageInfo<Room> pageInfo = new PageInfo<>(roomList);
        //返回对象
        return new DataGridViewResult(pageInfo.getTotal(),pageInfo.getList());
    }

    /**
     * 查询房间详情
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/detail/{id}.html")
    public String detail(@PathVariable Integer id, Model model){
        Room room = roomService.findById(id);
        model.addAttribute("room",room);
        return "detail";
    }

    /**
     * 查询房间列表
     * @param model
     * @return
     */
    @RequestMapping("/list.html")
    public String list(Model model){
        RoomVo roomVo = new RoomVo();
        roomVo.setStatus(1);//可预订
        //调用查询房间列表的方法
        List<Room> roomList = roomService.findRoomList(roomVo);
        //将房间列表放到模型中
        model.addAttribute("roomList",roomList);
        return "roomList";
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
     * 根据房型查询
     * @param typeId
     * @param model
     * @return
     */
    @RequestMapping("/list/{typeId}.html")
    public String list(@PathVariable Integer typeId, Model model){
        RoomVo roomVo = new RoomVo();
        roomVo.setStatus(1);//可预订
        roomVo.setRoomTypeId(typeId);//房型
        //调用查询房间列表的方法
        List<Room> roomList = roomService.findRoomList(roomVo);
        //将房间列表放到模型中
        model.addAttribute("roomList",roomList);
        //将房型ID保存到模型中，目的在房间列表页面进行回显
        model.addAttribute("typeId",typeId);//null
        return "roomList";
    }

}
