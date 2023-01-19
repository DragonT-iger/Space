package com.project.space.reservation;

import java.util.List;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SmsRequestDTO {
	private String type;
	private String contentType;
	private String countryCode;
	private String from;
	private String content;
	private List<MessageDTO> message;
}
