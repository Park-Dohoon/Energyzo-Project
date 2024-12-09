package com.energyzo.javaproject.service;

import lombok.Data;

@Data
public class EstPicVO {

    private int pic_num;        // 사진 번호
    private int est_id;         // 부동산 ID
    private String ex_in;       // 내부/외부 구분 (예: 'M', 'S', 등)
    private String path;        // 사진 경로
    private String pho_name;    // 사진 이름
}
