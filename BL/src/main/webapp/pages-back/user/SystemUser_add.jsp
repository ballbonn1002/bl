<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="/assets/js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>






<!-- PAGE-HEADER -->

<div class="page-header">
	<c:choose>
            <c:when test="${sysuserList[0].sys_role_id != null && sysuserList[0].sys_user_id != null}"> <h1 class="page-title">Edit System User</h1> </c:when>
            <c:otherwise><h1 class="page-title">Create System User</h1></c:otherwise>
            </c:choose>
    
    <div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item" ><a href="javascript:void(0)" >Home</a></li>
            <li class="breadcrumb-item" ><a href="SystemUser_list">System User</a></li>
            <c:choose>
            <c:when test="${sysuserList[0].sys_role_id != null && sysuserList[0].sys_user_id != null}"> <li class="breadcrumb-item active">Edit System User</li> </c:when>
            <c:otherwise><li class="breadcrumb-item active">Create System User</li></c:otherwise>
            </c:choose>
        </ol>
    </div>
</div>
<!-- PAGE-HEADER END -->



<form id="form"  action="save_sysuser" method="POST" autocomplete="off" class="needs-validation"  enctype="multipart/form-data" novalidate> 
							<div class="row clearfix">
  								<div class="col-sm-8">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="card-title">System User Profile</div>
                                    </div>
                                    <div class="card-body">
                                    
                                        <div class="text-center mb-4">
                                        
                                            <a href="javascript:void(0)" class="avatar avatar-xxl brround cover-image" >
                                            <img alt="" class="avatar avatar-xxl brround cover-image"  id="avatar" <c:if test="${sysuserList[0].path != null}"> src="${sysuserList[0].path}"</c:if> "> 
                                                       <span class="badge rounded-pill avatar-icons bg-primary"><i class="fe fe-edit fs-12"></i></span> 
                                                        </a>
                                           				
                                           				</div>
                                           				<input id="fileUpload" type="file" name="fileUpload" accept="image/x-png,image/gif,image/jpeg" data-max-width="1000">
                                           				<input style="display:none;" id="filesize" name="filesize" type="text" value=""> 
                                           				<input style="display:none;" type="text" class="form-control" name="file_ID" id="file_ID" value="${sysuserList[0].file_id}">
		
			
					<div class="form-row">
							<div class="col-sm-6">
						<div class="form-group">
								<label class="form-label">User ID<span style="color:red;"> *</span></label> 
								<div class="input-group mb-3">
									<input type="text" id="sysuserID" name="userid" class="form-control" pattern="[A-Za-z0-9.]{1,}" value="${sysuserList[0].sys_user_id}" placeholder="Enter User ID"  required>  
                               			<div class="invalid-feedback">
                               			Can only fill in English numbers . (dot) Don't duplicate the original Id and Don't leave this blank.
										</div>
                                </div>  
                              </div>
                       </div>
								
							
								
								
						
                    
                      <div class="col-sm-6">
						<div class="form-group">
								<label class="form-label">Role<span style="color:red;"> *</span></label> 
								<select id="userRole" class="form-control select2" name="role" data-placeholder="Select Role" required>
												 <option value="" disabled selected hidden >Select Role</option> 
												<c:forEach var="sysrole" items="${sysroleList}">	
													<option value="${sysrole.name}"
														<c:if test="${sysuserList[0].sys_role_id eq sysrole.name }"> selected </c:if>>${sysrole.name}</option>
												</c:forEach>
									</select>
									<div class="valid-feedback"></div>
									<div class="invalid-feedback">required this field</div>
						</div>
						</div>    
						</div>  
						
								<div class="form-row">
								<div class="col-sm-6">
									<div class="form-group">
							
									<label class="form-label">Employee ID</label> 	
									<select id="username"  name="name" class="form-control select2" data-placeholder="Select Employee ID">
											 	<option value="" disabled hidden selected>Select Employee ID </option>  
												 <c:forEach var="user" items="${userList}">	
													<option value="${user.employee_id}"
														<c:if test="${sysuserList[0].user_id eq user.employee_id }"> selected </c:if>>${user.employee_id}</option>
												</c:forEach>
									</select>
									
							
							</div>
							</div>
      <div class="col-sm-2">
   		
												
    										<label for="title" class="form-label">Name</label>
    						
      <select id="title" name="title" class="form-control select2" data-placeholder="Select" >
      			<option value="" disabled hidden selected>Select</option>
      			 <option <c:if test="${sysuserList[0].title eq  'Mr.'}"> selected </c:if>>Mr.</option>
                  <option <c:if test="${sysuserList[0].title eq 'Mrs.' }"> selected </c:if>>Mrs.</option>
                   <option <c:if test="${sysuserList[0].title eq 'Miss' }"> selected </c:if>>Miss</option>
          </select>
           </div>
            <div class="col-sm-4">
         <label for='name' class='form-label invisible'>Range end</label>
        <input id="name" type="text" name="nameth" class="form-control"  value="${sysuserList[0].name}" placeholder="Enter Your Name" >
         		 </div>
         		 
      </div>
					
					
					
					
					<div class="form-row">
					<div class="col-sm-6">
							<div class="form-group">
								<label class="form-label">Email</label> 
								 <input id="email" type="email" name="email"  class="form-control email" placeholder="Enter Your Email"  
								 pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$" value="${sysuserList[0].email}">
								 <div class="invalid-feedback">Invalid email address</div>
							</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
								<label class="form-label">Phone</label> 
								<input id="tel" type="text" name="tel" class="form-control mobile-phone-number" pattern=".{12,12}" onkeypress="return numberPressed(event)"
								 value="${sysuserList[0].phone}" placeholder="Enter Your Phone Number">
								 	 
								<div class="invalid-feedback">Not a valid Phone Number</div>
						</div>
					</div>
					</div>
					<div class="form-row">
					<div class="col-sm-6">
					<div class="form-group">
					<label class="custom-control custom-checkbox">
						<input type="checkbox"  id="userIsactive" name="isactive"  value="${sysuserList[0].is_active}" 
							  class="custom-control-input"<c:if test="${fn:contains(sysuserList[0].is_active, '1')}">checked</c:if>>
							  <input id='checkboxHidden'  type='hidden' value='0' name='isactive'>
					
  							 <span class="custom-control-label">Is Active </span>
					
					</label>
							 </div> 
  						</div>
  						</div>
				 </div>
                                        </div>
                               
                                        
			</div>
			
			<div class="col-sm-4">
			  <div class="card">
                                    <div class="card-header">
                                            <h3 class="card-title">Set Up Password</h3>
                                       
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
			<div id="resetpass" style="display:none; padding-left: 13px;">
				<button type="button" class="btn btn-success">Reset password</button>
			</div>
			
			<div id="pass">
				   	<div class="form-group">
                        	<label class="form-label">New Password<span style="color:red;"> *</span></label>
                        <div class="input-group" id="togglePassword">
                            <input type="password" class="form-control"  id="password" name="password" placeholder="Enter Your Password" >	
                      		<button type="button" class="btn btn-outline-default"> <i class="bi bi-eye-slash"  ></i></button>
						</div>
 					</div>
				   <div class="form-group">
                        <label class="form-label">Confirm Password<span style="color:red;"> *</span></label>
                        <div class="input-group" id="togglePassword_c">
                             <input type="password" class="form-control" id="password_c" name="password_confirm" placeholder="Enter Your Password">
                   			 <button type="button" class="btn btn-outline-default"> <i class="bi bi-eye-slash" ></i></button>
						</div>
                   </div>
                   
                    
                   
                   <div id="notsame" style="color:#E7505A; text-color:#E7505A; display:none;">
                   		<i class="fa fa-exclamation-circle" ></i>&nbsp;&nbsp;Not Matching
                   </div>
                   <div id="same" style="color:#28A745; text-color:#28A745; display:none;">
                   		<i class="fa fa-exclamation-circle" ></i>&nbsp;&nbsp;Matching
                   </div>
               </div>
          
                
				</div>
					<div class="form-row mt-4">
                <div id="chkpass">
                		
                      			<i id="aaa" class="icon-check" style="opacity:0.3; font-size: 16px; font-weight: bold;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Password must be a minimum of 8 characters <br><br>
                      			<i id="up" class="icon-check" style="opacity:0.3; font-size: 16px; font-weight: bold;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Password must include at least one uppercase letter (A-Z) <br><br>
                      			<i id="low" class="icon-check" style="opacity:0.3; font-size: 16px; font-weight: bold;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Password must include at least one lowercase letter (a-z) <br><br>
                      			<i id="num" class="icon-check" style="opacity:0.3; font-size: 16px; font-weight: bold;"></i>&nbsp;&nbsp;&nbsp;&nbsp;Password must include at least one number (0-9)
                      
                
                </div>
				 </div>
				 </div>
                                    </div>
                                </div>
                            
					</div>
					<div class="row">
                                <div class="text-end">
						<a id="edit" type="reset" class="btn btn-default" href="SystemUser_list" >Cancel</a>
						<button id="sub" type="submit" class="btn btn-success" onclick="redirect()" <c:if test="${sysuserList[0].sys_role_id == null && sysuserList[0].sys_user_id == null}">disabled</c:if>>Save</button>
				</div>
					         </div>   
						
      </form>  
    
      
<script>
 function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      $('#avatar').attr('src', e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	  } else {
	   
	  }
	} 


$('#fileUpload').on('change', function() {
	 var fs;
	 var size = this.files[0].size;
	 fs = $("#filesize").val(size);
	 console.log(fs);
	 readURL(this);
})

		 $('#fileUpload').hide(); 
		 $("#avatar").click(function(e){
			 e.preventDefault();
			 console.log('clicked')
		   $('#fileUpload').trigger('click');
		 });
		 
		

		
 
</script>      
  
<script>
$(document).ready(function() {
	const togglePassword = document.querySelector("#togglePassword button");
	const password = document.querySelector("#password");
    togglePassword.addEventListener('click', function (e) {
        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        password.setAttribute('type', type);
        $('#togglePassword i').toggleClass('bi-eye');
    });
    });
</script>
<script>
$(document).ready(function() {
	const togglePassword = document.querySelector("#togglePassword_c button");
	const password = document.querySelector("#password_c");
    togglePassword.addEventListener('click', function (e) {
        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        password.setAttribute('type', type);
        $('#togglePassword_c i').toggleClass('bi-eye');
    });
    });
</script>
<script>
function checkUserRole() {
	var userRole = document.getElementById("userRole");
	console.log("select");
	userRole.classList.remove('is-invalid')
    userRole.classList.remove('is-valid')
    if (userRole.checkValidity() === false) {
    	userRole.classList.add('is-invalid')
    	
    }
    else {
    	userRole.classList.add('is-valid')
   
    
    }
	
}
document.getElementById('email').addEventListener('blur',function(evt){
	checkEmail()
});
function checkEmail() {
	var input = document.getElementById("email");
	input.classList.remove('is-invalid')
	if (input.checkValidity() === false && input.value.trim != "") {
		input.classList.add('is-invalid')
	}
	else{
		input.classList.remove('is-invalid')
	}	
	
}




$(document).ready(function() {
	var tel = document.getElementById("tel");
	var sysUserId = document.getElementById("sysuserID");
	var email = document.getElementById("email");
	var forms = document.getElementsByClassName('needs-validation');
	   Array.prototype.filter.call(forms, function(form) {
		    
		    
		      form.addEventListener('submit', function(event) { 
		    	  checkTel()
		    	  checkSysUserId()
		    	  checkUserRole()
		    	  checkEmail()
		    	//form.classList.add('was-validated');
		        if (form.checkValidity() === false && !$('input').is('[readonly]') ) { 
		          event.preventDefault();
		          event.stopPropagation();
		        }		        
		        
		      }, false);
		      
		    });
	        
	
	   $("#userRole").on("select2:close", function (e) {  
		   checkUserRole()
	    });
});
</script>

<script>
 $(document).ready(function(){
	 var sysuserID = $('#sysuserID').val();
	 var userRole = $('#userRole').val();
	 var userID = $('#username').val();
	 var name = $('#name').val();
	 var email = $('#email').val();
	 var tel = $('#tel').val();
	 var isactive = $('#userIsactive').val();
	 
		/*  $("#userRole").find("option").eq(0).remove(); */
		
	 if(sysuserID != null && userRole != null && sysuserID.trim() !=""){
		 console.log(sysuserID+" "+userRole)
		 $('#sysuserID').prop('readonly', true);
		 $('#checkID').hide();
		 $('#save2').show();
		 $('#pass').hide();
		 $('#chkpass').hide();
		 $('#resetpass').show();
		 $('#sub').hide();
		 $('#edit').hide();
		 $('#userRole , #username , #title, #name , #email , #tel , #userIsactive, #fileUpload').on('change', function() {
			 $('#bt').fadeIn();
			 $('#resetpass').show();
			 $('#pass').hide();
			 $('#chkpass').hide();
			 $('#sub').show();
			 $('#edit').show();
		 }); 
	 }	
	 $('#resetpass').on('click', function() {
		 $('#resetpass').hide();
		 $('#pass').fadeIn();
		 $('#chkpass').fadeIn();
		 $('#sub').fadeIn();
		 $('#edit').fadeIn();
		 $('#bt').hide();
	 });
	 
	 $("#reset").on("click", function () {
		 $('#username')[0].selectedIndex = 0; 
			if(sysuserID != null && userRole != null ){
			$('#bt').fadeIn();
			 $('#resetpass').show();
			 $('#pass').hide();
			 $('#chkpass').hide();
			 $('#sub').hide();
			 $('#edit').hide();
			}
		});
 });
</script>

<script>
$('#userIsactive').on('change', function(){
	   this.value = this.checked ? 1 : 0;
	   console.log(this.value);
	});
	
$("#submit").click(function () {
	if(document.getElementById("user_isactive").checked){
	document.getElementById('checkboxHidden').disabled = true;
	}
	});
	
	$(document).ready(function () {
		$('#username').on('change', function() {
			var value = $('#username').val();
			//var role = $('#userRole').val();
			//console.log(role);
			//console.log(value);
			
			if(value == null){
				$('#email').empty();
				$('#name').empty();
				$('#tel').empty();
			} 
			
			$.ajax({
				url: "CheckID"	,
				method: "POST" ,
				type: "JSON" ,
				data: {
						"userid" : value ,
					},
					success:function(data){
						console.log(data);
						   $('#email').val(data.email);
						   $('#name').val(data.name);
						   $('#tel').val(data.phoneNum);
					}
			})
		});
			return false;
	});

</script>
<script>

function checkPattern() {
	var id = $('#sysuserID').val();
	let pattern = /^[a-zA-Z\s\d.]+$/;
	var sysuserID = document.getElementById('sysuserID');
	//console.log(pattern.test(text));
	if (pattern.test(id) == true && sysuserID.checkValidity() === true) {
		
		return true;
	} else {
		/* $("#canuse").hide();
		$("#cannotuse").show();
		$("#nofill").hide() */
	
		return false;
	}

}

function checkSysUserId() {
	var input = document.getElementById('sysuserID');
	input.classList.remove('is-invalid')
	var id = $('#sysuserID').val();
	
	if(id.trim() != "" &&  !$('input').is('[readonly]') ){
		console.log(id)
	 	$.ajax({
			url: "CheckUserID",
			method: "POST" ,
			type: "JSON" ,
			data: {
				"sysuserCheckID" : id
			},
			success:function(data){
			
				
				console.log(data);
				if (data.toString().indexOf("1") != -1) {
					input.classList.add('is-invalid')
				}
				
				else if(checkPattern()!=true){
					input.classList.add('is-invalid')
					
					
				}
				
				else {
					input.classList.remove('is-invalid')					
			} 
			}
		}) 
		}else if (id.trim() == "")  {
			input.classList.add('is-invalid')
}
	
	
	
	
}




$(document).ready(function () {
	$('#sysuserID').keyup(function() {
		checkSysUserId()

		})
	});
</script>
<script>
	 $(document).ready(function(){
		 
		    $('#password , #password_c').on('keypress', function(e) {
	            if (e.which == 32){
	                return false;
	            }
	        });
		$('#password , #password_c').keyup(function(){
			var pw = $('#password').val();
			var pwc = $('#password_c').val();
			
			if(pw == pwc && pw.length >= 8 && pwc.search(/[a-z]/) != -1 && pwc.search(/[A-Z]/) != -1 && pwc.search(/[0-9]/) != -1 ){
				document.getElementById("sub").disabled = false;
			}
			
				if(pw.length >= 8){
					$("#aaa").css({"color":"#28A745","opacity":"1"});
				}if(pw.length < 8){
					$("#aaa").css({"color":"none","opacity":"0.3"});
				}if(pw.search(/[a-z]/) != -1){
					$("#low").css({"color":"#28A745","opacity":"1"});
				}if(pw.search(/[a-z]/) == -1){
					$("#low").css({"color":"#none","opacity":"0.3"});
				}if(pw.search(/[A-Z]/) != -1){
					$("#up").css({"color":"#28A745","opacity":"1"});
				}if(pw.search(/[A-Z]/) == -1){
					$("#up").css({"color":"#none","opacity":"0.3"});
				}if(pw.search(/[0-9]/) != -1){
					$("#num").css({"color":"#28A745","opacity":"1"});
				}if(pw.search(/[0-9]/) == -1){
					$("#num").css({"color":"#none","opacity":"0.3"});
				}
				if(pw == pwc){
					/* $("#same").show(); */
					$("#notsame").hide();
				
				}else{
					$("#same").hide();
					$("#notsame").show();
			}
		
		})	
	}); 
</script>
<script>
document.getElementById('tel').addEventListener('blur',function(evt){
	checkTel()
});
document.getElementById('tel').addEventListener('keyup',function(evt){
    var phoneNumber = document.getElementById('tel');
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    phoneNumber.value = phoneFormat(phoneNumber.value);
});


document.getElementById('tel').value = phoneFormat(document.getElementById('tel').value);

function numberPressed(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if(charCode > 31 && (charCode < 48  && charCode > 57) && (charCode < 36  && charCode > 40)){
            return false;
    }
    
}

function checkTel() {
	var telInput = document.getElementById('tel');
	telInput.classList.remove('is-invalid')
  

	if (telInput.checkValidity() === false && telInput.value.trim != "") {
    	
		telInput.classList.add('is-invalid')
	}
	else{
		telInput.classList.remove('is-invalid')
	}		
}

function phoneFormat(input){
	
    input = input.replace(/\D/g,'');
    input = input.substring(0,10);
    var size = input.length;
    if(size == 0){
            input = input;
    }else if(size < 4){
            input = ''+input;
    }else if(size < 7){
            input = ''+input.substring(0,3)+'-'+input.substring(3,6);
    }else{
            input = ''+input.substring(0,3)+'-'+input.substring(3,6)+'-'+input.substring(6,10);
    }
    
    
    
    return input; 
   
}
</script>