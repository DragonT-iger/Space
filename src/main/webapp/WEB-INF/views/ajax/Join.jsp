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

<style>
* {
  margin: 0px;
  padding: 0px;
  text-decoration: none;
  font-family:sans-serif;
}

body {
  background-image:#34495e;
}

.joinForm {
  position:absolute;
  width:400px;
  height:400px;
  padding: 30px, 20px;
  background-color:#FFFFFF;
  text-align:center;
  top:40%;
  left:50%;
  transform: translate(-50%,-50%);
  border-radius: 15px;
}

.joinForm h2 {
  text-align: center;
  margin: 30px;
}

.textForm {
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.name {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.email {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.nickname {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.cellphoneNo {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.birth {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}
</style>

<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
            <h5 class="section-title ff-secondary text-center text-primary fw-normal">Join Us!</h5>
            <h1 class="mb-5">Sign Up</h1>
        </div>
        <div class="row g-4">
          <form>
            <div class="col-12">
                <div class="row gy-4" id="">
                
               	  <div class="textForm">
			        <input name="name" type="text" class="name" placeholder="NAME">
			      </div>
			      <div class="textForm">
			        <input name="nickname" type="text" class="nickname" placeholder="NICKNAME">
			      </div>
                  	  <div class="textForm">
			        <input name="loginId" type="text" class="id" placeholder="ID">
			      </div>
			      <div class="textForm">
			        <input name="loginPw" type="password" class="pw" placeholder="PASSWORD">
			      </div>
			       <div class="textForm">
			        <input name="loginPwConfirm" type="password" class="pw" placeholder="PASSWORD CHECK">
			      </div>
			      <div class="textForm">
			        <input name="cellphoneNo" type="text" class="cellphoneNo" placeholder="TEL">
			      </div>
			      <div class="textForm">
			        <input name="birth" type="text" class="birth" placeholder="BIRTH DATE">
			      </div>
			       <div class="textForm">
			        <input name="email" type="email" class="email" placeholder="EMAIL">
			      </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="wow fadeInUp" data-wow-delay="0.2s">
                   <div class="row g-3">
                       <div class="col-12">
                       	<a href="javascript:sel_menu('Join')" class="btn btn-primary w-40 py-2">Join</a>
                           <button class="btn btn-primary w-40 py-2" type="reset">Reset</button>
                           <a href="javascript:sel_menu('Login')" class="btn btn-primary w-40 py-2">Cancel</a>
                       </div>
                   </div>
                </div>
            </div>
           </form>
        </div>
    </div>
</div>
<!-- Contact End -->