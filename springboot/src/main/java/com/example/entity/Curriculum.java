package com.example.entity;


import java.io.Serializable;

/**
 * 课表信息
 */
public class Curriculum implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 第几大节
     */
    private String segment;

    /**
     * 星期一
     */
private String monday;
    /**
     * 星期二
     */
    private String tuesday;
    /**
     * 星期三
     */
    private String wednesday;
    /**
     * 星期四
     */
    private String thursday;
    /**
     * 星期五
     */
    private String friday;
    /**
     * 星期六
     */
    private String saturday;
    /**
     * 星期日
     */
    private String sunday;

    public String getSegment() {
        return segment;
    }

    public void setSegment(String segment) {
        this.segment = segment;
    }

    public String getMonday() {
        return monday;
    }

    public void setMonday(String monday) {
        this.monday = monday;
    }

    public String getTuesday() {
        return tuesday;
    }

    public void setTuesday(String tuesday) {
        this.tuesday = tuesday;
    }

    public String getWednesday() {
        return wednesday;
    }

    public void setWednesday(String wednesday) {
        this.wednesday = wednesday;
    }

    public String getThursday() {
        return thursday;
    }

    public void setThursday(String thursday) {
        this.thursday = thursday;
    }

    public String getFriday() {
        return friday;
    }

    public void setFriday(String friday) {
        this.friday = friday;
    }

    public String getSaturday() {
        return saturday;
    }

    public void setSaturday(String saturday) {
        this.saturday = saturday;
    }

    public String getSunday() {
        return sunday;
    }

    public void setSunday(String sunday) {
        this.sunday = sunday;
    }
}
