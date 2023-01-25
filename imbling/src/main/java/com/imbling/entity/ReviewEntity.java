package com.imbling.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "imb_review")
public class ReviewEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int reviewNo;

    @Column
    private int orderNo;

    @Column
    private int productNo;

    @Column
    private int  userNo;

    @Column(nullable = false)
    private String reviewTitle;

    @Column(nullable = true)
    private String reviewContent;

    @Builder.Default
    @Column
    private Date reviewRegdate = new Date();

    @Builder.Default
    @Column
    private int reviewStar = 5;

    @Builder.Default
    @Column
    private int reviewCount = 0;

    @Builder.Default
    @Column
    private boolean reviewDeleted = false;

}
