<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- function taglib -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/Spacetop" />


<div class="1">
	
	<div class="2">
		<div class="space_header">
			<h6 class="loc_space">${sdvo.saddr1}</h6>
			<h1 id="place_title">${sdvo.sname}</h1>
			<p>리뷰 ${rc}개</p>
		</div>
		<a class="goReservation" href="/space/Reservation" onclick="payment()">예약하기</a>
		<a class="btn_share_detail naver-splugin meet">공유</a>
		<a class="btn_love_detail meet">찜</a>
	</div>

		<div class="3">
			<div class="body">
			
				<div class="photo_box_wrap type9">
					<ul class="swiper-wrapper slides">
						<li class="swiper-slide1">이미지1</li>
						<li class="swiper-slide2">이미지2</li>
						<li class="swiper-slide3">이미지3</li>
						<li class="swiper-slide4">이미지4</li>
					</ul>
				</div>
				
				<hr>

				<div class="h_row_center">
					<div>
						<div>
							<p>호스트 ${sdvo.userid}</p>
							<p>호스트 정보</p>
						</div>
					</div>
					
					<div>
						<div class="h_center">
							<p>장소번호 ${sdvo.snum}</p>
						</div>
					</div>
				</div>

				<hr>
				
				
				<div class="h_column_center">
				
					<div class="space_nav">
					<div class="h_place_select_button h_row_center" v-bind:class="{'on': sub_tab === 0}"
						style="width: 180px; cursor: pointer;" v-on:click="scrollTab(0)">
						<p>장소 소개</p>
					</div>
					<div class="h_place_select_button h_row_center" v-bind:class="{'on': sub_tab === 1}"
						style="width: 180px; cursor: pointer;" v-on:click="scrollTab(1)">
						<p>이용 규칙</p>
					</div>
					<div class="h_place_select_button h_row_center" v-bind:class="{'on': sub_tab === 2}"
						style="width: 180px; cursor: pointer;" v-on:click="scrollTab(2)">
						<p>
							리뷰 <label style="font-weight: 500; color: #9EA4AA;">리뷰개수</label>
						</p>
					</div>
					<div class="h_place_select_button h_row_center" v-bind:class="{'on': sub_tab === 3}"
						style="width: 180px; cursor: pointer;" v-on:click="scrollTab(3)">
						<p>
							질문 <label style="font-weight: 500; color: #9EA4AA;" v-show="isQna() === true">질문개수</label>
						</p>
					</div>
					</div>
		
				<hr>

					<div id="sub_tab_0">
						<p>장소 소개</p>
						${sdvo.scontents}
	
	
							<div style="width: 100%; height: 1px; background-color: #e7eaee;"></div>
					</div>



					<div id="sub_tab_1">
						<p>장소 이용 규칙</p>
						${sdvo.srule}
	
	
							<div style="width: 100%; height: 1px; background-color: #e7eaee;"></div>
					</div>
				
					<div id="sub_tab_2">
						
						<div id="feedback">
							<p>장소 리뷰</p>
							<p>feedback_count</p>
						</div>

						<div class="h_center" style="display: none; padding: 80px 0;" v-show="feedbacks.length === 0">
								<p>아직 등록된 리뷰가 없습니다.</p>
							</div>

							<div v-for="(feedback, index) in feedbacks"
								style="position: relative; margin-top: 30px; width: 100%; padding-bottom: 32px;"
								v-bind:style="{'border-bottom': (index === feedbacks.length - 1) ? '0px solid #e7eaee' : '1px solid #e7eaee' }">
								<div class="h_row_center"
									style="justify-content: space-between; position: relative;">
									<p class="h_ellipsis_1"
										style="width: calc(100% - 30px); font-size: 16px; font-weight: bold; font-stretch: normal; line-height: 1.38; letter-spacing: -0.1px; color: #1b1d1f;">
										{{ feedback.name }}</p>






									<div class="h_center"
										style="position: absolute; width: 40px; height: 40px; top: -13px; right: -10px; cursor: pointer;"
										v-on:click="h_show_popup(`#more_review_${feedback.id}`)">
										<img
											src="https://s3.hourplace.co.kr/web/images/icon/more_grey.svg"
											style="width: 16px; height: 16px; object-fit: contain;" />
									</div>
									<div class="more_menu h_modal"
										v-bind:id="`more_review_${feedback.id}`"
										style="position: absolute; z-index: 1; display: none; top: 28px; right: 0; width: 160px; padding: 10px 0; border-radius: 8px; box-shadow: 2px 2px 8px 0 rgba(0, 0, 0, 0.1); border: solid 1px #eff3f5; background-color: #ffffff;">
										<div class="h_my_menu_button h_hover_button"
											v-if="feedback.feedback_answer === null && user_id === 39064"
											v-on:click="feedbackAnswer(feedback), h_hide_popup(`#more_review_${feedback.id}`)">
											<p>답글 작성하기</p>
										</div>
										<div class="h_my_menu_button h_hover_button"
											v-if="user_id === feedback.user_id && !(feedback.delete === 1 || feedback.blind === 1)"
											v-on:click="feedbackEdit(feedback), h_hide_popup(`#more_review_${feedback.id}`)">
											<p>수정하기</p>
										</div>
										<div class="h_my_menu_button h_hover_button"
											v-if="user_id === feedback.user_id"
											v-on:click="feedbackDelete(feedback), h_hide_popup(`#more_review_${feedback.id}`)">
											<p style="color: #ff4b3e;">삭제하기</p>
										</div>
										<div class="h_my_menu_button h_hover_button"
											v-if="user_id !== feedback.user_id"
											v-on:click="report_feedback_vue.report(feedback.id), h_hide_popup(`#more_review_${feedback.id}`)">
											<p style="color: #ff4b3e;">신고하기</p>
										</div>
									</div>
								</div>
								<div class="h_row_center" style="margin-top: 6px;">
									<div class="review_star" style="margin-top: 0;">
										<span
											v-bind:style="{ width: (100 * (feedback.rating/5)) + '%'}">{{
											feedback.rating }}</span>
									</div>
									<p
										style="margin-left: 6px; font-weight: 500; font-size: 12px; color: #9EA4AA;">
										{{ feedback.created_at }}</p>
								</div>
								<div style="margin-top: 16px"
									v-if="place != null && place.place_group_id > 0">
									<p style="font-weight: 500; font-size: 12px; color: #9EA4AA;">
										{{ feedback.place_title }}</p>
								</div>
								<div class="h_row"
									style="margin-top: 16px; justify-content: space-between;">
									<div>
										<p
											style="margin-bottom: 16px; font-size: 16px; font-weight: normal; font-stretch: normal; line-height: 1.38; letter-spacing: -0.1px;"
											v-bind:style="{'color':feedback.delete === 1 || feedback.blind === 1 ? '#9EA4AA' : '#72787F'}"
											v-if="feedback.comment.length > 0 && !(feedback.delete === 1 || feedback.blind === 1)"
											v-html="feedback.comment.replace(/(?:\r\n|\r|\n)/g, '<br />')">
										</p>
										<div class="h_center"
											style="min-width: 77px; width: fit-content; height: 29px; box-sizing: border-box; border-radius: 4px; cursor: pointer;"
											v-on:click="feedbackLike(feedback, 0)"
											v-bind:style="{'border': feedback.like === 1 ? '1px solid #246FF8' : '1px solid #DFE2E7', 'margin-top': feedback.comment.length === 0 && feedback.feedback_image_path_arr.length > 0 ? '11px' : '0'}">
											<div class="h_row_center"
												style="font-weight: 500; font-size: 12px; line-height: 14px;"
												v-bind:style="{'color': feedback.like === 1 ? '#246FF8' : '#72787F'}">
												<p>도움돼요 {{feedback.like_count.toLocaleString('en-US')}}
												</p>
											</div>
										</div>
									</div>
									<div
										style="min-width: 40px; width: 40px; height: 40px; margin-left: 20px; border-radius: 4px; overflow: hidden; cursor: pointer;"
										v-on:click.stop="show_photo_feedback_v2(feedback)"
										v-if="feedback.feedback_image_path_arr.length > 0 && !(feedback.delete === 1 || feedback.blind === 1)">
										<img
											v-bind:src="'//img.hourplace.co.kr/' + feedback.feedback_image_path_arr[0] + '?s=200x200&t=cover&q=80'"
											style="width: 100%; height: 100%;" />
									</div>
								</div>

								<div
									style="margin-top: 16px; width: 100%; padding: 16px; background: #F5F7F8; border-radius: 8px; display: none;"
									v-if="feedback.feedback_answer !== null"
									v-show="feedback.feedback_answer !== null">
									<div class="h_row_center"
										style="justify-content: space-between; position: relative;">
										<p
											style="font-weight: 500; font-size: 12px; line-height: 14px; color: #9EA4AA;">
											호스트 답글 ・ {{feedback.feedback_answer.created_at}}</p>
										<div class="h_center"
											style="position: absolute; width: 40px; height: 40px; top: -13px; right: -10px; cursor: pointer;"
											v-on:click="h_show_popup(`#more_review_answer_${feedback.id}`)">
											<img
												src="https://s3.hourplace.co.kr/web/images/icon/more_grey.svg"
												style="width: 16px; height: 16px; object-fit: contain;" />
										</div>
										<div class="more_menu h_modal"
											v-bind:id="`more_review_answer_${feedback.id}`"
											style="position: absolute; z-index: 1; display: none; top: 28px; right: 0; width: 160px; padding: 10px 0; border-radius: 8px; box-shadow: 2px 2px 8px 0 rgba(0, 0, 0, 0.1); border: solid 1px #eff3f5; background-color: #ffffff;">
											<div class="h_my_menu_button h_hover_button"
												v-if="user_id === 39064 && !(feedback.feedback_answer.delete === 1 || feedback.feedback_answer.blind === 1)"
												v-on:click="feedbackAnswerEdit(feedback), h_hide_popup(`#more_review_answer_${feedback.id}`)">
												<p>답글 수정하기</p>
											</div>
											<div class="h_my_menu_button h_hover_button"
												v-if="user_id === 39064"
												v-on:click="feedbackAnswerDelete(feedback), h_hide_popup(`#more_review_answer_${feedback.id}`)">
												<p style="color: #ff4b3e;">삭제하기</p>
											</div>
											<div class="h_my_menu_button h_hover_button"
												v-if="user_id !== 39064"
												v-on:click="report_feedback_answer_vue.report(feedback.feedback_answer.id), h_hide_popup(`#more_review_answer_${feedback.id}`)">
												<p style="color: #ff4b3e;">신고하기</p>
											</div>
										</div>
									</div>
									<p
										style="margin-top: 8px; font-weight: 500; font-size: 14px; line-height: 20px;"
										v-bind:style="{'color':feedback.feedback_answer.delete === 1 || feedback.feedback_answer.blind === 1 ? '#9EA4AA' : '#72787F'}"
										v-html="feedback.feedback_answer.comment.replace(/(?:\r\n|\r|\n)/g, '<br />')">
									</p>
								</div>
							</div>
						</div>

						<div class="h_column_center" style="margin-bottom: 40px;"
							v-show="feedback_count > 5">
							<div class="h_row_center">
								<div class="h_row_center" style="width: 22px; height: 40px;">
									<img
										src="https://s3.hourplace.co.kr/web/images/icon/chevron_left_double_grey.svg"
										style="width: 14px; height: 14px; margin-right: 8px;"
										v-if="feedback_page === 1"> <img
										src="https://s3.hourplace.co.kr/web/images/icon/chevron_left_double_black.svg"
										style="width: 14px; height: 14px; margin-right: 8px; cursor: pointer;"
										v-on:click="getFeedback(1),scrollTab(2)" v-else>
								</div>
								<div class="h_row_center" style="width: 22px; height: 40px;">
									<img
										src="https://s3.hourplace.co.kr/web/images/icon/chevron_left_grey.svg"
										style="width: 14px; height: 14px; margin-right: 8px;"
										v-if="feedback_page === 1"> <img
										src="https://s3.hourplace.co.kr/web/images/icon/chevron_left_black.svg"
										style="width: 14px; height: 14px; margin-right: 8px; cursor: pointer;"
										v-on:click="getFeedback(feedback_page - 1),scrollTab(2)"
										v-else>
								</div>

								<div class="h_row_center" style="height: 40px;" v-for="i in 10"
									v-if="((parseInt((feedback_page-1) / 10) * 10) + i) <= feedback_last_page">
									<div class="h_center"
										style="padding: 6px 10px 5px; border-radius: 4px; cursor: pointer;"
										v-bind:style="{'background': (feedback_page === ((parseInt((feedback_page-1) / 10) * 10) + i)) ? 'rgba(36, 111, 248, 0.1)' : '#FFF'}"
										v-on:click="getFeedback((parseInt((feedback_page-1) / 10) * 10) + i),scrollTab(2)">
										<p style="font-weight: bold; font-size: 14px;"
											v-bind:style="{'color': (feedback_page === ((parseInt((feedback_page-1) / 10) * 10) + i)) ? '#246FF8' : '#1B1D1F'}">
											{{ (parseInt((feedback_page-1) / 10) * 10) + i }}</p>
									</div>
								</div>

								<div class="h_row_center" style="width: 22px; height: 40px;">
									<img
										src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_grey.svg"
										style="width: 14px; height: 14px; margin-left: 8px;"
										v-if="feedback_page === feedback_last_page"> <img
										src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_black.svg"
										style="width: 14px; height: 14px; margin-left: 8px; cursor: pointer;"
										v-on:click="getFeedback(feedback_page + 1),scrollTab(2)"
										v-else>
								</div>
								<div class="h_row_center" style="width: 22px; height: 40px;">
									<img
										src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_double_grey.svg"
										style="width: 14px; height: 14px; margin-left: 8px;"
										v-if="feedback_page === feedback_last_page"> <img
										src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_double_black.svg"
										style="width: 14px; height: 14px; margin-left: 8px; cursor: pointer;"
										v-on:click="getFeedback(feedback_last_page),scrollTab(2)"
										v-else>
								</div>
							</div>
						</div>

					</div>
				</div>

				<div id="qna" v-cloak>
					<div v-if="place !== null">
						<div style="width: 100%; height: 1px; background-color: #e7eaee;">

						</div>
						<div class="h_row_center"
							style="margin-top: 40px; position: relative;">
							<p
								style="font-size: 24px; font-weight: bold; font-stretch: normal; line-height: 1.33; letter-spacing: -0.3px; color: #1b1d1f;">
								질문하기</p>
							<p
								style="margin-left: 9px; font-weight: bold; font-size: 20px; letter-spacing: -0.5px; color: #246FF8;"
								v-if="isQna() === true">{{ place.place_qna_count }}</p>
							<div class="h_center"
								style="display: none; position: absolute; right: 0; padding: 0 8px; height: 40px; background: #FFFFFF; border: 1px solid #DFE2E7; box-sizing: border-box; border-radius: 4px; cursor: pointer;"
								v-show="isQna()" v-on:click="show_place_qna()">
								<div class="h_row_center">
									<img src="//s3.hourplace.co.kr/web/images/icon/edit.svg"
										style="width: 20px; height: 20px; margin-right: 3px;" />
									<p style="font-weight: 500; font-size: 15px; color: #454B50;">
										질문하기</p>
								</div>
							</div>
						</div>

						<div class="h_center" style="display: none; padding: 80px 0;"
							v-show="place.place_qna_count === 0 || isQna() === false">
							<p
								style="font-weight: 500; font-size: 18px; letter-spacing: -0.1px; color: #9EA4AA;">
								{{ isQna() === true ? '아직 등록된 질문이 없어요.' : '예약 후 문의할 수 있는 장소입니다.'
								}}</p>
						</div>

						<div style="margin-top: 5px;" v-if="place.place_qnas.length > 0"
							v-show="isQna() === true">

							<div v-for="(qna, index) in qna_popup_lists"
								style="margin-top: 30px; width: 100%; padding-bottom: 20px;"
								v-bind:style="{'border-bottom': qna_popup_lists.length - 1 === index ? '0px solid #e7eaee' : '1px solid #e7eaee'}">
								<div class="h_row_center"
									style="justify-content: space-between;">
									<div class="h_row_center" style="margin-right: 20px;">
										<p class="h_ellipsis_1"
											style="font-weight: 500; font-size: 12px; color: #9EA4AA;">
											{{ qna.guest_name }}</p>
										<p
											style="min-width: 90px; font-weight: 500; font-size: 12px; color: #9EA4AA;">
											&nbsp;・ {{ moment(qna.created_at).format('YYYY.MM.DD') }}</p>
									</div>
									<div v-if="qna.delete === 0 && qna.blind === 0">
										<div class="h_row_center" v-if="user_id === qna.user_id">
											<p
												style="width: 24px; font-weight: 500; font-size: 12px; color: #9EA4AA; cursor: pointer;"
												v-on:click="qnaEdit(qna)">수정</p>
											<p
												style="padding: 0 6px; font-weight: 500; font-size: 12px; color: #9EA4AA;">
												・</p>
											<p
												style="width: 24px; font-weight: 500; font-size: 12px; color: #9EA4AA; cursor: pointer;"
												v-on:click="qnaDelete(qna)">삭제</p>
										</div>
										<div v-else>
											<p
												style="width: 24px; font-weight: 500; font-size: 12px; color: #9EA4AA; cursor: pointer;"
												v-on:click="user_id > 0 ? show_report_place_qna_popup(qna.id) : show_login()">
												신고</p>
										</div>
									</div>
								</div>
								<p
									style="margin-top: 16px; font-weight: normal; font-size: 16px; line-height: 22px;"
									v-bind:style="{'color':qna.delete === 1 || qna.blind === 1 ? '#9EA4AA' : '#454B50'}"
									v-html="qna.content.replace(/(?:\r\n|\r|\n)/g, '<br />')">
								</p>
								<div class="h_row_center"
									style="display: none; margin-top: 16px; cursor: pointer;"
									v-show="qna.answer !== undefined"
									v-on:click="qna.answer_show = !qna.answer_show">
									<p style="font-weight: bold; font-size: 12px; color: #246FF8;">
										답변 보기</p>
									<img
										src="//s3.hourplace.co.kr/web/images/icon/chevron_down_grey.svg"
										style="width: 12px; height: 12px; margin-left: 6px;"
										v-show="!qna.answer_show" /> <img
										src="//s3.hourplace.co.kr/web/images/icon/chevron_up_grey.svg"
										style="width: 12px; height: 12px; margin-left: 6px;"
										v-show="qna.answer_show" />
								</div>
								<div
									style="margin-top: 16px; padding: 12px 14px; background: #F5F7F8; border-radius: 8px; display: none;"
									v-if="qna.answer !== undefined"
									v-show="qna.answer_show === true">
									<div class="h_row_center"
										style="justify-content: space-between;">
										<p style="font-weight: 500; font-size: 12px; color: #9EA4AA;">
											호스트 답변 ・ {{
											moment(qna.answer.created_at).format('YYYY.MM.DD') }}</p>
										<div v-if="qna.answer.delete === 0 && qna.answer.blind === 0">
											<div class="h_row_center"
												v-if="user_id === qna.answer.user_id">
												<p
													style="font-weight: 500; font-size: 12px; color: #9EA4AA; cursor: pointer;"
													v-on:click="answerEdit(qna)">수정</p>
												<p
													style="padding: 0 6px; font-weight: 500; font-size: 12px; color: #9EA4AA;">
													・</p>
												<p
													style="font-weight: 500; font-size: 12px; color: #9EA4AA; cursor: pointer;"
													v-on:click="answerDelete(qna)">삭제</p>
											</div>
											<div v-else>
												<p
													style="font-weight: 500; font-size: 12px; color: #9EA4AA; cursor: pointer;"
													v-on:click="user_id > 0 ? show_report_place_qna_popup(qna.answer.id) : show_login()">
													신고</p>
											</div>
										</div>
										<div
											v-else-if="qna.answer.delete === 1 && qna.answer.blind === 0">
											<div class="h_row_center"
												v-if="user_id === qna.answer.user_id">
												<p
													style="font-weight: 500; font-size: 12px; color: #9EA4AA; cursor: pointer;"
													v-on:click="answerEdit(qna)">다시 답변</p>
											</div>
										</div>
									</div>
									<p
										style="margin-top: 8px; font-weight: 500; font-size: 14px; line-height: 20px;"
										v-bind:style="{'color':qna.answer.delete === 1 || qna.answer.blind === 1 ? '#9EA4AA' : '#72787F'}"
										v-html="qna.answer.content.replace(/(?:\r\n|\r|\n)/g, '<br />')">
									</p>
								</div>
							</div>

							<div class="h_column_center" style="margin-bottom: 40px;"
								v-show="place.place_qna_count > 5">
								<div class="h_row_center">
									<div class="h_row_center" style="width: 22px; height: 40px;">
										<img
											src="https://s3.hourplace.co.kr/web/images/icon/chevron_left_double_grey.svg"
											style="width: 14px; height: 14px; margin-right: 8px;"
											v-if="qna_popup_list_page === 1"> <img
											src="https://s3.hourplace.co.kr/web/images/icon/chevron_left_double_black.svg"
											style="width: 14px; height: 14px; margin-right: 8px; cursor: pointer;"
											v-on:click="getQna(1),scrollTab(3)" v-else>
									</div>
									<div class="h_row_center" style="width: 22px; height: 40px;">
										<img
											src="https://s3.hourplace.co.kr/web/images/icon/chevron_left_grey.svg"
											style="width: 14px; height: 14px; margin-right: 8px;"
											v-if="qna_popup_list_page === 1"> <img
											src="https://s3.hourplace.co.kr/web/images/icon/chevron_left_black.svg"
											style="width: 14px; height: 14px; margin-right: 8px; cursor: pointer;"
											v-on:click="getQna(qna_popup_list_page - 1),scrollTab(3)"
											v-else>
									</div>

									<div class="h_row_center" style="height: 40px;" v-for="i in 10"
										v-if="((parseInt((qna_popup_list_page-1) / 10) * 10) + i) <= qna_popup_last_page">
										<div
											style="padding: 6px 10px 5px; border-radius: 4px; cursor: pointer;"
											v-bind:style="{'background': (qna_popup_list_page === ((parseInt((qna_popup_list_page-1) / 10) * 10) + i)) ? 'rgba(36, 111, 248, 0.1)' : '#FFF'}"
											v-on:click="getQna((parseInt((qna_popup_list_page-1) / 10) * 10) + i),scrollTab(3)">
											<p style="font-weight: bold; font-size: 14px;"
												v-bind:style="{'color': (qna_popup_list_page === ((parseInt((qna_popup_list_page-1) / 10) * 10) + i)) ? '#246FF8' : '#1B1D1F'}">
												{{ (parseInt((qna_popup_list_page-1) / 10) * 10) + i }}</p>
										</div>
									</div>

									<div class="h_row_center" style="width: 22px; height: 40px;">
										<img
											src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_grey.svg"
											style="width: 14px; height: 14px; margin-left: 8px;"
											v-if="qna_popup_list_page === qna_popup_last_page"> <img
											src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_black.svg"
											style="width: 14px; height: 14px; margin-left: 8px; cursor: pointer;"
											v-on:click="getQna(qna_popup_list_page + 1),scrollTab(3)"
											v-else>
									</div>
									<div class="h_row_center" style="width: 22px; height: 40px;">
										<img
											src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_double_grey.svg"
											style="width: 14px; height: 14px; margin-left: 8px;"
											v-if="qna_popup_list_page === qna_popup_last_page"> <img
											src="https://s3.hourplace.co.kr/web/images/icon/chevron_right_double_black.svg"
											style="width: 14px; height: 14px; margin-left: 8px; cursor: pointer;"
											v-on:click="getQna(qna_popup_last_page),scrollTab(3)" v-else>
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>

				<div id="qna_bottom"
					style="width: 100%; margin-top: 20px; height: 1px; background: #E7EAEE;"
					v-bind:style="{'margin-bottom': (place !== null && place.other_places.length === 0) ? '120px' : '0' }"></div>

				<div style="display: none"
					v-if="place !== null && place.other_places.length > 0"
					v-show="place !== null && place.other_places.length > 0">
					<div class='h_column_center'>
						<div style="margin-top: 40px;">
							<div class="h_row_center" style="position: relative;">
								<div class="h_row_center">
									<p
										style="font-weight: bold; font-size: 24px; line-height: 32px; letter-spacing: -0.3px; color: #1B1D1F;">
										호스트의 다른 장소</p>
									<p
										style="margin-left: 6px; font-weight: bold; font-size: 20px; line-height: 14px; text-align: center; letter-spacing: -0.666667px; color: #246FF8;">
										{{ place.other_places.length }}</p>
								</div>
								<div class="h_row_center" style="position: absolute; right: 0;">
									<div class="h_center"
										style="width: 40px; height: 40px; border: solid 1px #eff3f5; background-color: #ffffff; border-radius: 20px; margin-right: 10px;"
										id="flipsnap_other_prev">
										<img
											src="https://s3.hourplace.co.kr/web/images/icon/chevron_left_g.svg"
											id="flipsnap_other_prev_img"
											style="width: 16px; height: 16px;" />
									</div>
									<div class="h_center"
										style="width: 40px; height: 40px; border: solid 1px #eff3f5; background-color: #ffffff; border-radius: 20px;"
										id="flipsnap_other_next">
										<img
											src="https://s3.hourplace.co.kr/web/images/icon/chevron_left_g.svg"
											id="flipsnap_other_next_img"
											style="width: 16px; height: 16px; -webkit-transform: rotate(180deg);" />
									</div>
								</div>
							</div>

							<div class="flipsnap_container_other" :ref="'other'"
								style="margin-top: 30px; margin-left: -11px; overflow: hidden; display: flex; width: 730px;">
								<div class="flipsnap_list"
									style="display: -ms-flex; display: flex; width: 100%; min-width: 100%;">
									<div
										style="width: 274px; margin: 0 10px 60px; position: relative; -webkit-transform: translate3d(0, 0, 0); -webkit-backface-visibility: hidden; flex-shrink: 0; cursor: pointer;"
										v-for="(item, index) in place.other_places"
										v-on:click="hourplace_v2.userLog('W', '/place/32344', 'click', 'place', 'other', index, item.id, '/place/'+item.id)">
										<div
											style="position: relative; height: 182px; border-radius: 8px; overflow: hidden">
											<img v-bind:src="item.image_url"
												style="width: 100%; height: 100%; object-fit: cover">
											<div class="h_center"
												style="position: absolute; top: 10px; left: 10px;"
												v-show="item.super === 1 || item.cal === 1">
												<img
													src="https://s3.hourplace.co.kr/web/images/icon/badge_superplace.svg"
													style="width: 24px; height: 24px; margin-right: 4px; z-index: 1;"
													v-show="item.super === 1"> <img
													src="https://s3.hourplace.co.kr/web/images/icon/badge_calendar.svg"
													style="width: 24px; height: 24px; margin-right: 4px; z-index: 1;"
													v-show="item.cal === 1">
											</div>
										</div>
										<div style="position: relative; padding: 10px 0 18px;">
											<div class="h_row_center"
												style="justify-content: space-between">
												<p
													style="margin-top: 2px; font-weight: bold; font-size: 10px; line-height: 14px; color: #26282B;">
													{{ item.category_sub }} · {{ item.local }}</p>
												<div class="h_row_center">
													<div class="h_center"
														style="width: 30px; height: 19px; border-radius: 2px; border: solid 1px var(- -grey-025);">
														<img
															src="https://s3.hourplace.co.kr/web/images/icon/person.svg"
															style="width: 14px; height: 14px" />
														<p
															style="font-size: 10px; font-stretch: normal; line-height: 1.17; letter-spacing: normal; color: var(- -grey-070);">
															{{ item.people }}</p>
													</div>
													<div class="h_center"
														style="margin-left: 4px; width: 30px; height: 19px; border-radius: 2px; border: solid 1px var(- -grey-025);">
														<img
															src="https://s3.hourplace.co.kr/web/images/icon/parking.svg"
															style="width: 14px; height: 14px" />
														<p
															style="font-size: 10px; font-stretch: normal; line-height: 1.17; letter-spacing: normal; color: var(- -grey-070);">
															{{ item.parking }}</p>
													</div>
												</div>
											</div>
											<p class="h_ellipsis_1"
												style="margin-top: 14px; font-weight: 500; font-size: 12px; line-height: 14px; color: #1B1D1F;">
												{{ item.title }}</p>
											<div class="h_row_center" style="margin-top: 10px;">
												<p
													style="margin-right: 8px; font-size: 15px; font-weight: 500; font-stretch: normal; line-height: 1.6; letter-spacing: -0.1px; color: #1b1d1f;">
													{{ item.price_guest }}원{{ item.price_type === 1 ? '~' : ''
													}}</p>
												<div class="h_row_center" style="margin-top: 2px;">
													<img
														src="https://s3.hourplace.co.kr/web/images/icon/gold_star.svg"
														style="width: 16px; height: 16px" />
													<p
														style="margin-left: 1px; font-size: 12px; font-weight: bold; font-stretch: normal; line-height: 1.17; letter-spacing: normal; color: var(- -grey-070);"
														v-if="item.feedback_count > 0">{{ item.feedback_rating
														}}</p>
													<p
														style="margin-left: 6px; font-weight: 500; font-size: 12px; line-height: 14px; color: #72787F;"
														v-if="item.feedback_count > 0">리뷰 {{
														item.feedback_count }}</p>
													<p
														style="margin-left: 1px; font-weight: 500; font-size: 12px; line-height: 14px; color: #72787F;"
														v-else>리뷰 없음</p>
												</div>
											</div>
										</div>
										<div class="bookmark"
											style="position: absolute; right: 0; bottom: 18px; z-index: 1;"
											v-bind:class="{'cancel':item.interested === 1}"
											v-bind:id="'bookmark_' + item.id"
											v-on:click.stop="click_interest(item)">
											<img
												src="https://s3.hourplace.co.kr/web/images/icon/bookmark_g.svg"
												style="width: 24px; height: 24px;" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>
					</div>
					</div>
					



<c:import url="/Spacefoot" />