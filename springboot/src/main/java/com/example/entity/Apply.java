package com.example.entity;

import java.io.Serializable;


/** 请假信息表 */
public class Apply implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Integer id;
    /** 学生ID */
    private Integer studentId;
    /** 请假说明 */
    private String content;
    /** 请假时间 */
    private String time;
    /** 请假天数 */
    private Integer day;
    /** 审核状态 */
    private String status;
    /** 审核说明 */
    private String descr;
    /** 请假学生 */
    private String studentName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
}
