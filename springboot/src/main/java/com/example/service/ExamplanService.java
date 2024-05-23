package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.entity.Examplan;
import com.example.mapper.ExamplanMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 考试安排处理
 */
@Service
public class ExamplanService {

    @Resource
    private ExamplanMapper examplanMapper;

    /**
     * 新增
     */
    public void add(Examplan examplan) {
        //新增的时候, 根据当前时间，会自动生成创建时间
        examplan.setTime(DateUtil.now());
        examplanMapper.insert(examplan);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        examplanMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            examplanMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Examplan examplan) {
        examplanMapper.updateById(examplan);
    }

    /**
     * 根据ID查询
     */
    public Examplan selectById(Integer id) {
        return examplanMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Examplan> selectAll(Examplan examplan) {
        return examplanMapper.selectAll(examplan);
    }

    /**
     * 分页查询
     */
    public PageInfo<Examplan> selectPage(Examplan examplan, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Examplan> list = examplanMapper.selectAll(examplan);
        return PageInfo.of(list);
    }

}