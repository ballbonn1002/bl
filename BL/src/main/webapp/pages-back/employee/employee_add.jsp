<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<!--     <script src="/assets/js/form-validation.js"></script> -->
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${bean.date}" pattern="dd-MM-yyyy" />



<div class="page-header">
	<h1 class="page-title">Create Employee</h1>
	<div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item" onclick="history.back()"><a
				href="employee_list">Home</a></li>
			<li class="breadcrumb-item text-muted" href="#">Employee</li>
			<li class="breadcrumb-item active" aria-current="page">Create
				Employee</li>
		</ol>
	</div>
</div>

<!-- DepartmentForm -->
<form action="save_employ" name="addEmployeeForm" id="addEmployeeForm"
	class="needs-validation" novalidate method="POST"
	enctype="multipart/form-data">
	<div class="row clearfix">
		<div class="col-xl-4">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Personal Information</h3>
				</div>
				<div class="card-body">

					<div class="form-group text-center">
						<div class="avatar avatar-xxl brround">
						<img id="wizardPicturePreview" class="avatar avatar-xxl brround" title="" >
							<label class="badge rounded-pill avatar-icons bg-primary"><i class="fe fe-edit fs-12"> 
							<input name="fileUpload" id="fileUpload" type="file" class="dropify"
									accept="image/x-png,image/gif,image/jpeg" data-max-width="1000" hidden /> 
							<input style="display: none;" id="filesize" name="filesize" type="text" value="" hidden>
							</i></label>
						</div>
						<!-- <img class="avatar avatar-xxl brround"> <label
							class="badge rounded-pill avatar-icons bg-primary "><i
							class="fe fe-edit fs-12"></i> <input style="text-align: center;"
							name="fileUpload" id="fileUpload" type="file" class="dropify"
							accept="image/x-png,image/gif,image/jpeg" data-max-width="1000"
							hidden /> <input style="display: none;" id="filesize"
							name="filesize" type="text" value="" hidden> </label>
					</div> -->
						<!-- <input style="text-align: center;" name="fileUpload"
							id="fileUpload" type="file" class="dropify"
							accept="image/x-png,image/gif,image/jpeg" data-max-width="1000" />
						<input style="display: none;" id="filesize" name="filesize"
							type="text" value="">  -->
					</div>
					<div class="form-group text-center">
						<div class="form-check form-check-inline">
							<input class="form-check-input form_employee_control"
								type="radio" name="Gender" required id="Gender" value="M">
							<label class="form-check-label" for="genderM">Male</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input form_employee_control"
								type="radio" name="Gender" required id="Gender" value="F">
							<label class="form-check-label" for="genderF">Female</label>
						</div>

					</div>
					<div class="form-group">
						<label class="form-label">Name EN <span class="text-red">*</span></label>
						<div class="input-group">
							<div class="col-md-4">
								<select value=""
									class="form-control select2 form-select form_employee_control"
									name="titleEN" required>
									<option value="" disabled hidden selected>Select</option>
									<option value="Mr.">Mr.</option>
									<option value="Mrs.">Mrs.</option>
									<option value="Miss">Miss</option>
								</select>
							</div>
							<div class="invalid-feedback">Can only fill in English,
								Don't leave this blank.</div>
							<div class="col-md-8">
								<input type="text" class="form-control form_employee_control"
									aria-label="Text input with dropdown button"
									placeholder="Enter Your Name" name="nameEN" autocomplete="no"
									pattern="^[a-zA-Z\s]+$" required>
								<div class="invalid-feedback">Can only fill in English,
									Don't leave this blank.</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label class="form-label">Nickname EN <span
							class="text-red">*</span></label>
						<div class="col-md-12">
							<input type="text" class="form-control form_employee_control "
								id="nicknameEN" placeholder="Enter Your Nickname"
								name="nicknameEN" pattern="^[a-zA-Z\s]+$" required>
						</div>
						<div class="invalid-feedback">Can only fill in English,
							Don't leave this blank.</div>

					</div>
					<div class="form-group">
						<label class="form-label">Name TH <span class="text-red">*</span></label>
						<div class="input-group">
							<div class="col-md-4">
								<select value=""
									class="form-control select2 form-select form_employee_control"
									name="titleTH" required>
									<option value="" disabled hidden selected>Select</option>
									<option value="?????????">?????????</option>
									<option value="?????????">?????????</option>
									<option value="??????????????????">??????????????????</option>
								</select>
							</div>
							<div class="col-md-8">
								<input type="text" class="form-control form_employee_control"
									aria-label="Text input with dropdown button"
									placeholder="Enter Your Name" pattern="^[???-???\s]+$"
									name="nameTH" autocomplete="no" required>
							</div>
							<div class="invalid-feedback">Can only fill in Thai, Don't
								leave this blank.</div>
						</div>
					</div>
					<div class="form-group">
						<label class="form-label">Nickname TH <span
							class="text-red">*</span></label>
						<div class="col-md-12">
							<input type="text" class="form-control form_employee_control "
								id="nicknameTH" placeholder="Enter Your Nickname"
								pattern="^[???-???\s]+$" name="nicknameTH" autocomplete="no"
								required>
						</div>

						<div class="invalid-feedback">Can only fill in Thai, Don't
							leave this blank.</div>
					</div>
				</div>
			</div>

		</div>
		<div class="col-xl-8">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Employee Information</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="form-group">
							<label class="form-label">Employee ID <span
								class="text-red">*</span></label> <input type="text"
								class="form-control form_employee_control" name="employID"
								id="Employee_id" placeholder="Enter Employee ID"
								pattern="[a-zA-Z0-9.]+" autocomplete="no" required>
							<div class="valid-feedback" id="canuse">You can use this id</div>

							<div class="invalid-feedback">Can only fill in English
								numbers . (dot) Don't duplicate the original Id and Don't leave
								this blank.</div>
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="form-group">
								<label class="form-label">Department <span
									class="text-red">*</span></label> <select id="depart_id"
									class="form-control select2 form_employee_control"
									name="departmentID" data-placeholder="Select Department"
									required>
									<option value="" disabled hidden selected>Select
										Department</option>
									<c:forEach var="department" items="${departmentList}">
										<option value="${department.department_id}">${department.department_id}
											- ${department.name}</option>
									</c:forEach>
								</select>
								<div class="valid-feedback"></div>
								<div class="invalid-feedback">Required this field</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="form-group">
								<label class="form-label">Position <span
									class="text-red">*</span></label> <select id="posi_id"
									class="form-control  select2  form-select form_employee_control"
									name="positionID" data-placeholder="Select Position" required>
									<option value="" disabled hidden selected>Select
										Position</option>
									<c:forEach var="position" items="${positionList}">
										<option value="${position.position_id}">${position.position_id}
											- ${position.name}</option>
									</c:forEach>
								</select>
								<div class="valid-feedback"></div>
								<div class="invalid-feedback">Required this field</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="form-group">
								<label class="form-label">Email <span class="text-red">*</span></label>
								<input type="email" class="form-control form_employee_control"
									name="Email" id="email" placeholder="Enter Your Email"
									autocomplete="no" required>
								<div class="invalid-feedback">please enter your email !</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="form-group">
								<label class="form-label">Phone Number <span
									class="text-red">*</span></label> <input type="tel"
									class="form-control form_employee_control" name="Phone"
									id="phone" placeholder="Enter Your Phone Number"
									onkeypress="return numberPressed(event);" required>
								<div class="invalid-feedback">Please enter your phone !</div>
							</div>
						</div>
						<div class="form-group">
							<label class="form-floating">Address</label>
							<textarea class="form-control form_employee_control"
								placeholder="Enter your address" name="Address"
								autocomplete="no"></textarea>
						</div>
						<div class="form-group">
							<!-- <label class="custom-control custom-checkbox mb-0"> 
							<input type="checkbox" id="userIsactive" class="custom-control-input"
								name="user_isactive" value="">
								<input id='checkboxHidden' type='hidden' 
								name='user_isactive'> <span class="custom-control-label">Is
									Active</span>
							</label> -->
							<div class="col-sm-2">
								<label class="custom-control custom-checkbox"> <input
									name="user_isactive" type="checkbox"
									class="custom-control-input" id="userIsactive"><span
									class="custom-control-label">Is Active</span>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 		</form> -->
		</div>
	</div>
	<div style="text-align: right">
		<button type="button" onclick="history.back()" class="btn btn-light">Cancel</button>
		<button type="submit" class="btn btn-success" id="NoSubmit">Save</button>

	</div>
</form>


<script>
	var duplicate_id = false

	function datechenge() {
		var fulldate = "${fulldate}".trim();
		var Userdate = $("#mydate").val();
		if (fulldate != Userdate) {
			$("#detail").show();
			$("#labeldetail").show();
		} else {
			$("#detail").hide();
			$("#labeldetail").hide();
		}
	}
	function checkDupId() {
		//$('#depart_id').on('keyup blur', function() {
		var flag = true;
		var id = $('#Employee_id').val();

		if (id != "") {
			$.ajax({
				url : "CheckDuplicateEmploy",
				method : "POST",
				type : "JSON",
				data : {
					"Employee_id" : id
				},
				success : function(data) {
					console.log(data)
					var input = document.getElementById('Employee_id')
					input.classList.remove('is-invalid')
					input.classList.remove('is-valid')

					if (data.flag == 0 && input.checkValidity() == true) {
						duplicate_id = true
						$("#canuse").show();
						$("#Employee_id").addClass('is-valid');
					} else {
						duplicate_id = false
						$("#canuse").hide();
						$("#Employee_id").addClass('is-invalid');

					}
				}
			})

		} else {
			duplicate_id = false
			var input = document.getElementById('Employee_id')
			input.classList.add('is-invalid')
			$("#canuse").hide();

		}

	}

	function validate() {
		'use strict';
		window.addEventListener('load', function() {
			var forms = document.getElementsByClassName('needs-validation');
			var inputs = document.getElementsByClassName('form_employee_control')

			Array.prototype.filter.call(forms, function(form) {

				form.addEventListener('submit',function(event) {

							showWasValidate()
							//form.classList.add('was-validated');
							if (form.checkValidity() === false || duplicate_id == false) {
						          event.preventDefault();
						          event.stopPropagation();
						        }		        
						        
						      }, false);
						      
						    });

			Array.prototype.filter.call(inputs, function(input) {

				input.addEventListener('blur', function(event) {
					checkDupId()//check duplicate id

					if (input.id != 'Employee_id') {
						// reset
						input.classList.remove('is-invalid')
						input.classList.remove('is-valid')

						if (input.checkValidity() === false) {
							input.classList.add('is-invalid')
						} else {
							input.classList.remove()
						}
					}
				}, false);
			});

		}, false);
	};

	function showWasValidate() {

		var inputs = document.getElementsByClassName('form_employee_control')
		Array.prototype.filter.call(inputs, function(input) {

			if (input.id != 'Employee_id') {
				// reset
				checkDupId()
				input.classList.remove('is-invalid')
				input.classList.remove('is-valid')

				if (input.checkValidity() === false) {
					input.classList.add('is-invalid')
				} else {
					input.classList.remove()
				}
			}

		});
	}

/* 	function submitAddEmployee() {
		var values = $("#addEmployeeForm").serializeArray()
		console.log(values);
		$.ajax({
			url : "save_employ",
			type : "post",
			data : values,
			success : function(values) {
				document.location = "employee_list"; 
				console.log(values);
				// You will get response from your PHP page (what you echo or print)
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus, errorThrown);
			}
		});
	} */

	$('#userIsactive').on('change', function() {
		this.value = this.checked ? 1 : 0;
		console.log(this.value);
	});

	$("#submit").click(function() {
		if (document.getElementById("user_isactive").checked) {
			document.getElementById('checkboxHidden').disabled = true;
		}
	});
	$(document).ready(function() {
		validate()

	});
	
	document.getElementById('phone').addEventListener('keyup',function(evt){
	    var phoneNumber = document.getElementById('phone');
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    phoneNumber.value = phoneFormat(phoneNumber.value);
	});

	//We need to manually format the phone number on page load
	document.getElementById('phone').value = phoneFormat(document.getElementById('phone').value);
	function numberPressed(evt){
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if(charCode > 31 && (charCode < 48 || charCode > 57) && (charCode < 36 || charCode > 40)){
	            return false;
	    }
	    return true;
	}

	//A function to format text to look like a phone number
	function phoneFormat(input){
	    // Strip all characters from the input except digits
	    input = input.replace(/\D/g,'');
	    
	    // Trim the remaining input to ten characters, to preserve phone number format
	    input = input.substring(0,10);

	    // Based upon the length of the string, we add formatting as necessary
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
<script>
$('#fileUpload').bind('change', function() {
	 var fs;
	 var size = this.files[0].size;
	 fs = $("#filesize").val(size);
	 console.log(fs);
})
</script>
<script>
$(document).ready(function(){
	// Prepare the preview for profile picture
	    $("#fileUpload").change(function(){
	        readURL(this);
	    });
	});
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#wizardPicturePreview').attr('src', e.target.result).fadeIn('slow');
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
</script>
