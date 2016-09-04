package com.vcourse.po;

import java.util.Date;

public class Vrecord {
    private Integer id;

    private Integer vId;

    private Integer vCid;

    private Integer vSid;

    private Date vCreateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getvId() {
        return vId;
    }

    public void setvId(Integer vId) {
        this.vId = vId;
    }

    public Integer getvCid() {
        return vCid;
    }

    public void setvCid(Integer vCid) {
        this.vCid = vCid;
    }

    public Integer getvSid() {
        return vSid;
    }

    public void setvSid(Integer vSid) {
        this.vSid = vSid;
    }

    public Date getvCreateTime() {
        return vCreateTime;
    }

    public void setvCreateTime(Date vCreateTime) {
        this.vCreateTime = vCreateTime;
    }
}