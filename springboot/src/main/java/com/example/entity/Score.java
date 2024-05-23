package com.example.entity;

import java.io.Serializable;

/** 成绩信息表 */
public class Score implements Serializable {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Integer id;
    /** 学生ID */
    private Integer studentId;
    /** 课程ID */
    private Integer courseId;
    /** 教师ID */
    private Integer teacherId;
    /** 平时分 */
    private Double ordinaryScore;
    /** 考试分 */
    private Double examScore;
    /** 总成绩 */
    private Double score;


    /** 学生姓名 */
    private String studentName;
    /** 课程姓名 */
    private String courseName;
    /** 老师姓名 */
    private String teacherName;

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

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Double getOrdinaryScore() {
        return ordinaryScore;
    }

    public void setOrdinaryScore(Double ordinaryScore) {
        this.ordinaryScore = ordinaryScore;
    }

    public Double getExamScore() {
        return examScore;
    }

    public void setExamScore(Double examScore) {
        this.examScore = examScore;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
}
