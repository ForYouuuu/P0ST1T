package com.p0st1t.p0st1t.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CertificationVO {

    private int id;
    private String qname;
    private String area;
    private String grade;
    private int pilgicost;
    private int silgicost;
    private String organizer;
    private String summary;
    private String pilginum;
    private String pilgiform;
    private String pilgitime;
}
