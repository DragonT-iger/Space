<!-- Menu Start -->

<div class="container-xxl py-5">
	<div class="container">
		<!-- 이용안내 ----------------------------------- -->
		<h4 class="h_intro" data-v-7f60aa2e="">이용 안내</h4>
		<p class="p_intro" data-v-7f60aa2e="">
			<br>[가격]<br>낮타임: 11시30분~16시30분<br>- 주중(월-금): 5만9천원(2인
			제한)<br>- 주말(토,일,공휴일): 9만9천원<br> <br>저녁타임: 19시~23시까지<br>-
			주중(일-목): 9만9천원<br>- 주말(금,토,공휴일 전일): 11만9천원<br> <br>올나잇타임:
			19시~익일 8시<br>- 주중(일-목): 11만 9천원<br>- 주말(금, 토, 공휴일 전일):
			13만9천원<br> <br>* 여름, 겨울 성수기 기간 가격 변동<br>* 2인 특가 진행
			중(저녁 또는 올나잇 한정_별도 문의)<br>* 기준 인원 4인(최대 6인) / 4인 초과 시 인당 2만원 추가<br>*
			청소보증금: 5만원(이용 후 문제 없을 시 24시간 내 반환)<br> <br>
		</p>
		<!-- ---------------------------------------------- -->

		<!-- 환불규정안내 ----------------------------------- -->
		<div id="s_refund" class="text_box refund" data-v-7f60aa2e="">
			<h4 class="h_intro" data-v-7f60aa2e="">환불규정 안내</h4><br>
			<p class="txt_notice refund" style="padding-bottom: 20px"
				data-v-7f60aa2e="">
				<em class="warn" style="color: #ff3a48" data-v-7f60aa2e="">이용당일(첫
					날) 이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다.</em><br data-v-7f60aa2e=""> 결제
				후 2시간 이내에는 100% 환불이 가능합니다.(단, 이용시간 전까지만 가능)
			</p>
			<ol class="info_list" data-v-7f60aa2e="">
				<li data-v-7f60aa2e=""><strong class="tit"
					style="color: #656565; font-weight: 400;" data-v-7f60aa2e="">
						이용 8일 전 </strong> <span class="data" style="color: #000" data-v-7f60aa2e="">총
						금액의 100% 환불</span> <!----></li>
				<li data-v-7f60aa2e=""><strong class="tit"
					style="color: #656565; font-weight: 400;" data-v-7f60aa2e="">
						이용 7일 전부터 환불불가 </strong> <!----> <span class="data" style="color: #000"
					data-v-7f60aa2e="">환불 불가</span></li>
				
			</ol>
		</div>
		<br>
		<!-- ---------------------------------------------- -->
		<!-- 게시판 ----------------------------------------- -->
		<div class="container mt-3" style="height: 600px; overflow: auto;">
			<h4>Q&A</h4>
			<br>
			<!-- 검색 폼 시작---------------------------- -->
			<table class="table table-condensed table-striped">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody id="boardBody">

				</tbody>
				<tfoot>

				</tfoot>
			</table>
		</div>
		<!-- ---------------------------------------------- -->
		<!-- 댓글창 ----------------------------------- -->
		<div class="postmeta comment-comment">
			<!--댓글에 댓글을 입력할 경우-->
			<div class="non-member">
				<input title="nick" type="text" id="comment_nink" name="nick"
					placeholder="이름"><input title="password" type="password"
					name="secret_pass" placeholder="비밀번호">
			</div>
			<div class="textarea_block">
				<textarea title="댓글을 남겨주세요" placeholder="댓글을 남겨주세요" rows="1"
					name="body" id="comment_body"
					data-action="btn_c_m20200311c3358c6c69fe5" data-autosize-on="true"
					style="overflow: hidden; overflow-wrap: break-word; height: 62px;"></textarea>
				<div class="file-add-block" style="display: none"
					id="comment_image_box"></div>
				<button class="btn btn-primary btn-sm"
					onclick="POST_COMMENT.mapAdd(); return false;">작성</button>
				<div class="inline-blocked holder">
					<i class="icon-picture icon vertical-middle"></i> <input
						title="comment image upload" type="file"
						class="comment_image_upload" multiple="" name="comment_images"
						id="comment_image_upload_btn">
				</div>
				<!--<i class="zmdi zmdi-play-circle"></i>-->
			</div>
		</div>



	</div>
</div>
<!-- Menu End -->