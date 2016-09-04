package com.vcourse.po;

import java.util.Date;

public class Video {
    private Integer id;

    private Integer cid;

    private String vtitle;

    private String vdescription;

    private String vpath;

    private Integer vsort;

    private Date vctime;
    
    private Integer viewCount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getVtitle() {
        return vtitle;
    }

    public void setVtitle(String vtitle) {
        this.vtitle = vtitle == null ? null : vtitle.trim();
    }

    public String getVdescription() {
        return vdescription;
    }

    public void setVdescription(String vdescription) {
        this.vdescription = vdescription == null ? null : vdescription.trim();
    }

    public String getVpath() {
        return vpath;
    }

    public void setVpath(String vpath) {
        this.vpath = vpath == null ? null : vpath.trim();
    }

    public Integer getVsort() {
        return vsort;
    }

    public void setVsort(Integer vsort) {
        this.vsort = vsort;
    }

    public Date getVctime() {
        return vctime;
    }

    public void setVctime(Date vctime) {
        this.vctime = vctime;
    }

	public Integer getViewCount() {
		return viewCount;
	}

	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}
    
    
}