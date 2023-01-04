package com.project.space.reservation;

import java.time.LocalDateTime;


import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
//(access=AccessLevel.PROTECTED)
public class SmsResponseDTO {
	private String requestId;
	private String requestTime;
	private String statusCode;
	private String statusName;
}
