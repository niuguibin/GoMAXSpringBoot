package com.example.entity;

import java.io.Serializable;
import java.math.BigDecimal;

/** 课程信息表 */
public class Course implements Serializable {
    /**implements Serializable：这是一个接口实现，表示Course类实现了Serializable接口。Serializable接口是Java中的一个标记接口，
     *   用来表示类的对象可以被序列化，即可以将对象转换为字节流以便在网络上传输或者持久化到硬盘等操作
     *   private static final long serialVersionUID = 1L;：这是Course类中声明的一个静态常量，用来指定序列化版本号。
     *   serialVersionUID是Java序列化机制中用来识别类版本的一个唯一标识符，用于确保序列化和反序列化的兼容性。
     *   当类的结构发生变化时，比如新增或删除字段，修改方法等，serialVersionUID的值也应该相应地更新，以便正确地反序列化旧版本的对象。
     *
     *   综合起来，这段代码的含义是定义了一个名为Course的Java类，并实现了Serializable接口，同时声明了一个用于版本控制的serialVersionUID常量。
     *   这样做的目的是使得Course类的对象可以进行序列化和反序列化操作，并确保在类结构变化时仍然保持兼容性。
     */

    private static final long serialVersionUID = 1L;

    /** ID */
    private Integer id;
    /** 课程名称 */
    private String name;
    /** 课程类型 */
    private String type;
    /** 课程类型2 */
    private String type2;
    /** 课程类型3 */
    private String type3;
    /** 授课开始时间 */
    private String times;
    /** 授课结束时间 */
    private String timef;
    /** 价格 */
    private BigDecimal price;
    /** 授课教师 */
    private Integer teacherId;
    /** 课程学分 */
    private Integer score;
    /** 上课人数 */
    private Integer num;
    /** 上课教室 */
    private String room;
    /** 周几 */
    private String week;
    /** 第几大节 */
    private String segment;
    /** 上课状态 */
    private String status;
    /** 老师名称 */
    private String teacherName;

    public String getType2() {
        return type2;
    }

    public void setType2(String type2) {
        this.type2 = type2;
    }

    public String getType3() {
        return type3;
    }

    public void setType3(String type3) {
        this.type3 = type3;
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times;
    }

    public String getTimef() {
        return timef;
    }

    public void setTimef(String timef) {
        this.timef = timef;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public String getSegment() {
        return segment;
    }

    public void setSegment(String segment) {
        this.segment = segment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
}
