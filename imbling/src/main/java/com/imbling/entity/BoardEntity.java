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
@Table(name = "imb_board")
public class BoardEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int boardNo;

    @Column(nullable = false)
    private int boardCategory;

    @Column(nullable = false)
    private String boardTitle;

    @Column(nullable = false, length = 1000)
    private String boardContent;

    @Builder.Default
    @Column
    private Date boardRegdate = new Date();

    @Builder.Default
    @Column
    private int boardCount = 0;

    @Column(nullable = false)
    private int userNo;

    @Builder.Default
    @Column
    public boolean boardDeleted = false;

    //board attach
}
