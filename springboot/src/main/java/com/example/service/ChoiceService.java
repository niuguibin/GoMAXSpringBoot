package com.example.service;

import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.common.enums.SegmentEnum;
import com.example.common.enums.WeekEnum;
import com.example.entity.Account;
import com.example.entity.Choice;
import com.example.entity.Course;
import com.example.entity.Curriculum;
import com.example.exception.CustomException;
import com.example.mapper.ChoiceMapper;
import com.example.mapper.CourseMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ChoiceService {

    @Resource
    private ChoiceMapper choiceMapper;
    @Resource
    private CourseMapper courseMapper;

    /**
     * 新增
     */
    public void add(Choice choice) {
        // 当前选的课
        Course course = courseMapper.selectById(choice.getCourseId());//查询这门课，再获取这门课的数量num
        // 1. 先判断一下该门课选满了没有
        // 1) 我们可以在选课信息表里面查询该门课被选的次数（用这种方式）
        // 2) 这种方式大家自己去尝试：在课程信息表里面加个字段（已选人数），判断当前这门课的这个已选人数字段是否已经等于上课人数字段的值
        List<Choice> list = choiceMapper.selectByCourseId(choice.getCourseId());
        if (course.getNum().equals(list.size())) {
            //如果该门课 选课的数量 等于 该门课的num的话 ，表示该门课已经选满了，不能在进行选课了
            //也就是选课信息表里该们课被选的次数等于课程表中的num的时候，说明该门课已经选满了，不能进行选课了
            throw new CustomException(ResultCodeEnum.COURSE_NUM_ERROR);
        }
        //如果该门课没被选，则可以继续选课
        // 2. 判断该学生选的这门课的开课时间有没有和他之前选的课有冲突
        List<Choice> sList = choiceMapper.selectByStudentId(choice.getStudentId());//拿到该学生的选课信息
        for (Choice dbChoice : sList) {
            //根据该学生的选课信息，获取这个学生选的这门课的课程信息
            Course tmpCourse = courseMapper.selectById(dbChoice.getCourseId());
            //如果该学生当前选的这门课的上课时间和他之前选的课的上课时间产生冲突的时候 且 该学生当前选的这门课的第几大节和他之前选的课的第几大节参生冲突的时候。抛出异常
            if (course.getWeek().equals(tmpCourse.getWeek()) && course.getSegment().equals(tmpCourse.getSegment())) {
                throw new CustomException("-1", "您之前已经选过" + tmpCourse.getName() + ", 与该门课的上课时间冲突，请重新选择");
            }
        }

        choiceMapper.insert(choice);
    }

    /**
     * 删除
     */
    public void deleteById(Integer id) {
        choiceMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            choiceMapper.deleteById(id);
        }
    }

    /**
     * 修改
     */
    public void updateById(Choice choice) {
        choiceMapper.updateById(choice);
    }

    /**
     * 根据ID查询
     */
    public Choice selectById(Integer id) {
        return choiceMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Choice> selectAll(Choice choice) {
        return choiceMapper.selectAll(choice);
    }

    /**
     * 分页查询
     */
    public PageInfo<Choice> selectPage(Choice choice, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.TEACHER.name().equals(currentUser.getRole())) {
            //老师只能查自己的信息
            choice.setTeacherId(currentUser.getId());
        }
        if (RoleEnum.STUDENT.name().equals(currentUser.getRole())) {
            //学生只能查自己的信息
            choice.setStudentId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Choice> list = choiceMapper.selectAll(choice);
        return PageInfo.of(list);
    }


    /**
     * 生成对应学生的选课课表
     */
    public List<Curriculum> getCurriculum() {
        //获取当前用户
        Account currentUser = TokenUtils.getCurrentUser();
        // 查询出该学生所有的选课信息
        Choice choice = new Choice();
        choice.setStudentId(currentUser.getId());
        List<Choice> choiceList = choiceMapper.selectAll(choice);//查询出这个学生的所有的选课信息



        List<Curriculum> list = new ArrayList<>();//将最后生成的数据塞到这list里面去，再将这个list将选的课表信息返回给前台
        // 按照第几大节和周几来处理数据（总共有5大节，8列数据）
        // 第一大节（08:00 ~ 09:30）
        Curriculum first = new Curriculum();
        //处理第一大节
        first.setSegment(SegmentEnum.FIRST.segment);
        //处理周几，第一大节分别与周一~周五进行组合
        processWeek(first, getWeekChoiceList(choiceList, SegmentEnum.FIRST.segment));

        list.add(first);

        // 第二大节（09:40 ~ 12:00）
        Curriculum second = new Curriculum();
        second.setSegment(SegmentEnum.SECOND.segment);
        processWeek(second, getWeekChoiceList(choiceList, SegmentEnum.SECOND.segment));
        list.add(second);

        // 第三大节（14:00 ~ 15:30）
        Curriculum third = new Curriculum();
        third.setSegment(SegmentEnum.THIRD.segment);
        processWeek(third, getWeekChoiceList(choiceList, SegmentEnum.THIRD.segment));
        list.add(third);

        // 第四大节（15:40 ~ 17:00）
        Curriculum forth = new Curriculum();
        forth.setSegment(SegmentEnum.FORTH.segment);
        processWeek(forth, getWeekChoiceList(choiceList, SegmentEnum.FORTH.segment));
        list.add(forth);

        // 第五大节（18:00 ~ 20:00）
        Curriculum fifth = new Curriculum();
        fifth.setSegment(SegmentEnum.FIFTH.segment);
        processWeek(fifth, getWeekChoiceList(choiceList, SegmentEnum.FIFTH.segment));
        list.add(fifth);

        return list;
    }

    /**
     * 处理当前第几大节的所有选课信息（周一到周日）
     */
    private List<Choice> getWeekChoiceList(List<Choice> choiceList, String segment) {
        //过滤筛选出，选课课表Choice中的第几大节等于SegmentEnum(枚举)中第几大节，如果相等的，帅选出来
        return choiceList.stream().filter(x -> x.getSegment().equals(segment)).collect(Collectors.toList());
    }

    /**
     * 处理周一到周日的数据
     */
    private void processWeek(Curriculum curriculum, List<Choice> choiceList) {//choiceList表示传入处理好后的第几大节。
        // 周一
        //从处理好的choiceList(已经筛选出选课的第几大节等于SegmentEnum(枚举)中的第几大节)再继续找出选课表中周几上课与WeekEnum(枚举)中周几上课相等的过滤出来
        Optional<Choice> first = choiceList.stream().filter(x -> x.getWeek().equals(WeekEnum.MONDAY.week)).findFirst();
        //如果过滤出来，如果有的话，说明选课课表里，在周一这个时候有这个课,就把这个课表塞到这个curriculum对象里面中去
        first.ifPresent(choice -> curriculum.setMonday(choice.getName() + " (" + choice.getTeacherName() + ")"));
        // 周二
        Optional<Choice> second = choiceList.stream().filter(x -> x.getWeek().equals(WeekEnum.TUESDAY.week)).findFirst();
        second.ifPresent(choice -> curriculum.setTuesday(choice.getName() + " (" + choice.getTeacherName() + ")"));
        // 周三
        Optional<Choice> third = choiceList.stream().filter(x -> x.getWeek().equals(WeekEnum.WEDNESDAY.week)).findFirst();
        third.ifPresent(choice -> curriculum.setWednesday(choice.getName() + " (" + choice.getTeacherName() + ")"));
        // 周四
        Optional<Choice> forth = choiceList.stream().filter(x -> x.getWeek().equals(WeekEnum.THURSDAY.week)).findFirst();
        forth.ifPresent(choice -> curriculum.setThursday(choice.getName() + " (" + choice.getTeacherName() + ")"));
        // 周五
        Optional<Choice> fifth = choiceList.stream().filter(x -> x.getWeek().equals(WeekEnum.FRIDAY.week)).findFirst();
        fifth.ifPresent(choice -> curriculum.setFriday(choice.getName() + " (" + choice.getTeacherName() + ")"));
        // 周六
        Optional<Choice> sixth = choiceList.stream().filter(x -> x.getWeek().equals(WeekEnum.SATURDAY.week)).findFirst();
        sixth.ifPresent(choice -> curriculum.setSaturday(choice.getName() + " (" + choice.getTeacherName() + ")"));
        // 周日
        Optional<Choice> seventh = choiceList.stream().filter(x -> x.getWeek().equals(WeekEnum.SUNDAY.week)).findFirst();
        seventh.ifPresent(choice -> curriculum.setSunday(choice.getName() + " (" + choice.getTeacherName() + ")"));
    }

}
