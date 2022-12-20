<!-- Login Start -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script>

const sel_menu = function(m_name){
	fetch(m_name).then(function(response){
              response.text().then(function(text){
              $('tab').html(text);
              $('#selmenu').html(m_name);
              $('li[id$="Tab"]').removeClass('active');
              $('#'+m_name+'Tab').addClass('active');
              })
          })
	}
</script>

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
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Contact End -->