package com.bingbing.controller;

import com.bingbing.entity.Room;
import com.bingbing.service.RoomService;
import com.bingbing.vo.RoomVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/room")
public class RoomController {

    @Resource
    private RoomService roomService;

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
