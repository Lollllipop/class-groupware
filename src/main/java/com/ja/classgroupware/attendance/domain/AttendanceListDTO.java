package com.ja.classgroupware.attendance.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter // 각 필드에 대한 getter 자동 생성
@Setter // 각 필드에 대한 setter 자동 생성
@NoArgsConstructor // 파라미터가 하나도 없는 기본 생성자 자동 생성
@AllArgsConstructor // 모든 필드를 파라미터로 가지는 생성자 자동 생성
public class AttendanceListDTO {

	private List<AttendanceDTO> check;
}

