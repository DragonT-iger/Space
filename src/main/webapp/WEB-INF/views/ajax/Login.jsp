<!-- Login Start -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
            <h5 class="section-title ff-secondary text-center text-primary fw-normal">Welcome to Space</h5>
            <h1 class="mb-5">Login</h1>
        </div>
        <div class="row g-4">
            <div class="col-12">
                <div class="row gy-4">
                    <div class="col-md-4">
                        <h5 class="section-title ff-secondary fw-normal text-start text-primary">ID</h5>
                        <div class="col-md-6">
	                        <input type="text" class="form-control" id="userId" name="userId" placeholder="Your Id" required>
	                        <label for="saveId">
							<input type="checkbox" name="saveId" id="saveId">Save ID
							</label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <h5 class="section-title ff-secondary fw-normal text-start text-primary">PASSWORD</h5>
                        <div class="col-md-6">
                            <input type="password" name="pwd" class="form-control" id="pwd" required placeholder="Your Password">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="wow fadeInUp" data-wow-delay="0.2s">
                    <form>
                        <div class="row g-3">
                            <div class="col-12">
                                <button class="btn btn-primary w-40 py-2" id="btn1">Login</button>
                                <a href="javascript:sel_menu('Join')" class="btn btn-primary w-40 py-2">Join</a>
                                <div id="naver_id_login">
                                	<a href="${url}">
										<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
									</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Contact End -->