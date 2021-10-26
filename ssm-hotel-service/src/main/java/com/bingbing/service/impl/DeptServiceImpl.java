package com.bingbing.service.impl;

import com.alibaba.fastjson.JSON;
import com.bingbing.dao.DeptMapper;
import com.bingbing.entity.Dept;
import com.bingbing.service.DeptService;
import com.bingbing.utils.JedisPoolUtils;
import com.bingbing.utils.RedisKey;
import com.bingbing.vo.DeptVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import redis.clients.jedis.Jedis;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@Service
@Transactional
public class DeptServiceImpl implements DeptService {

    @Resource
    private DeptMapper deptMapper;

    /**
     * 查询部门列表
     *
     * @param deptVo
     * @return
     */
    public List<Dept> findDeptList(DeptVo deptVo) {
        return deptMapper.findDeptList(deptVo);
    }

    public int insert(Dept record) {
        record.setCreateDate(new Date());
        //调用添加方法
        int count = deptMapper.insert(record);
        //如果添加成功
        if(count>0){
            //清空缓存
            JedisPoolUtils.getJedis().del(RedisKey.DEPT_LIST);
        }
        return count;
    }

    public int updateDept(Dept dept) {
        int count = deptMapper.updateDept(dept);
        if(count>0){
            //清空缓存
            JedisPoolUtils.getJedis().del(RedisKey.DEPT_LIST);
        }
        return count;
    }

    public int deleteById(Integer id) {
        int count = deptMapper.deleteById(id);
        if(count>0){
            //清空缓存
            JedisPoolUtils.getJedis().del(RedisKey.DEPT_LIST);
        }
        return count;
    }

    public String findDeptList() {
        //获取Jedis对象
        Jedis jedis = JedisPoolUtils.getJedis();
        //读取缓存中的数据
        String dept_list = jedis.get(RedisKey.DEPT_LIST);
        //如果缓存中没有对应的数据：
        if(StringUtils.isEmpty(dept_list)){
            //1.从数据库中查询数据
            List<Dept> deptList = deptMapper.findDeptList(null);
            //2.将数据保存到缓存中
            dept_list = jedis.set(RedisKey.DEPT_LIST, JSON.toJSONString(deptList));
        }
        //返回缓存数据
        return dept_list;
    }

    @Override
    public Dept getDeptByDeptName(String deptName) {
        return deptMapper.getDeptByDeptName(deptName);
    }


}
