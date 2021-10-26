package com.bingbing.dao;

import com.bingbing.entity.Dept;
import com.bingbing.vo.DeptVo;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface DeptMapper {

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
     * 根据部门名查询部门信息
     * @param deptName
     * @return
     */
    @Select("select * from sys_dept where deptName = #{deptName}")
    Dept getDeptByDeptName(String deptName);

}
