package com.imbling.dto;

import lombok.Data;

import java.util.Date;

@Data
public class BoardFaqDto {

    private int faqNo;
    private int faqCategory;
    private String faqTitle;
    private String faqContent;
    private String faqReply;
    private Date faqRegDate;
    private String userId;
    private boolean faqDeleted;

}
