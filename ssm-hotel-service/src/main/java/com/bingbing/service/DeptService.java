package com.bingbing.service;

import com.bingbing.entity.Dept;
import com.bingbing.vo.DeptVo;

import java.util.List;

public interface DeptService {

    /**
     * 查询部门列表
     * @param deptVo
     * @return
     */
    List<Dept> findDeptList(DeptVo deptVo);

    /**
     * 添加部门
     * @param record
     * @return
     */
    int insert(Dept record);

    /**
     * 修改部门
     * @param dept
     * @return
     */
    int updateDept(Dept dept);

    /**
     * 删除部门
     * @param id
     * @return
     */
    int deleteById(Integer id);

    /**
     * 查询部门数据并进行缓存处理
     * @return
     */
    String findDeptList();

    Dept getDeptByDeptName(String deptName);

    /**
     * 根据部门名称-id查询部门
     * @param deptName
     * @param id
     * @return
     */
    Dept getDeptNameId(String deptName,Integer id);

}
