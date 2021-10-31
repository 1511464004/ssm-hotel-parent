package com.bingbing.controller;


import com.bingbing.entity.Account;
import com.bingbing.entity.Floor;
import com.bingbing.entity.Room;
import com.bingbing.service.AccountService;
import com.bingbing.service.FloorService;
import com.bingbing.service.RoomService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;

@Controller
public class IndexController {

    @Resource
    private FloorService floorService;

    @Resource
    private RoomService roomService;

    @Resource
    private AccountService accountService;



    @RequestMapping("/index")
    public String index(Model model,Principal principal){
        //查询当前登录用户
        if (principal != null) {
            Account account = accountService.getAccountByName(principal.getName());
            model.addAttribute("account",account);
        }
        //调用查询所有楼层列表的方法
        List<Floor> floorList = floorService.findFloorList(null);
        //调用查询房间列表的方法
        List<Room> roomList = roomService.findRoomList(null);
        //将数据添加到模型中
        model.addAttribute("floorList",floorList);
        model.addAttribute("roomList",roomList);
        //返回逻辑视图名
        return "forward:/index.jsp";
    }

    /**
     * 注销
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();//清空session数据
        return "redirect:/";
    }

}
