<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<!-- JQUERY JS -->
<script src="/assets/js/jquery.min.js"></script>

<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${bean.date}" pattern="dd-MM-yyyy" />


<!-- PAGE-HEADER -->

<div class="page-header">
	<h1 class="page-title">Create Position</h1>
	<div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
			<li class="breadcrumb-item"><a href="position_list">Position</a></li>
			<li class="breadcrumb-item active" aria-current="page">Create
				Position</li>
		</ol>
	</div>
</div>
<!-- PAGE-HEADER END -->

<form id="form_send" action="javascript:sendData()"
	class="needs-validation" novalidate>
	<div class="card">
		<div class="card-header">
			<h3 class="card-title">Create Position</h3>
		</div>

		<div class="card-body">
			<div class="col-md-12">
				<div class="form-group">
					<label class="form-label ">Position ID <span
						class="text-red">*</span></label> <input type="text"
						class="form-control form_position_control" id="position_id"
						name="positionId" maxlength="4" pattern="[A-Za-z0-9.]{1,}"
						placeholder="Enter ID" required>
					<!-- <div id="canuse"
							style="color: #28A745; text-color: #28A745; display: none; width: 100%;">
						</div>
						<div id="cannotuse"
							style="color: #FAAD14; text-color: #FAAD14; display: none;">
							You can not use this id
						</div>
						<div id="nofill"
							style="color: #FAAD14; text-color: #FAAD14; display: none;">
							Please, Enter userID
						</div> -->

					<div class="valid-feedback">You can use this id</div>
					<div class="invalid-feedback">Can only fill in English
						numbers . (dot) Don't duplicate the original Id and Don't leave
						this blank.</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="form-group">
					<label class="form-label">Department <span class="text-red">*</span></label>
					<select id="depart_id"
						class="form-control form-select select2 form_position_control"
						name="user.departmentId" data-placeholder="Select Department"
						required>
						<option value="" disabled hidden selected>Select
							Department</option>
						<c:forEach var="department" items="${departmentList}">
							<option value="${department.department_id}">${department.department_id}
								- ${department.name}</option>
						</c:forEach>
					</select>
					<div class="valid-feedback"></div>
					<div class="invalid-feedback">required this field</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<label class="form-label">Name <span class="text-red">*</span></label>
					<input type="text" name="name"
						class="form-control form_position_control" id="name_position"
						placeholder="Enter Name" required>
					<div class="valid-feedback"></div>
					<div class="invalid-feedback">required this field</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="form-group">
					<label class="form-label">Description</label> <input type="text"
						name="description" class="form-control"
						placeholder="Enter Description">

				</div>
			</div>
			<!--  <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="form-label">Prefix ID:</label>
                                                    <input type="text" name="prefix" class="form-control" >
  
                                                </div>
                                            </div> -->
		</div>
	</div>


	<div class="text-end">
		<a type="reset" class="btn btn-default" href="position_list">Cancel</a>
		<button id="submit_position" type="submit" class="btn btn-success">Save</button>
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

	function sendData() {
		var form_data = $("#form_send").serializeArray();
		console.log(form_data);
		 $.ajax({
			url : "savePosition",
			method : "POST",
			type : "JSON",
			data : form_data,

			success : function(data) {
				if (data == null) {
					window.location = "position_list";
					

				} else {
					console.log(data);
					swal('Position ID', 'มีข้อมูลซ้ำกัน โปรดกรอกใหม่',
							'warning');
				}

			}
		}) 
	}

	function checkPattern(data) {
		let text = data;
		let pattern = /^[a-zA-Z\s\d.]+$/;

		//console.log(pattern.test(text));
		if (pattern.test(text) == true) {
			return true;
		} else {
			return false;
		}
	}
	
	function checkId(){
		var id = $('#position_id').val();
		
		if (id.trim() != "") {
			
			 $.ajax({
				url : "checkPositionID",
				method : "POST",
				type : "JSON",
				data : {
					"position_id" : id
				},
				success : function(data) {
				
					//console.log(data);
					
					$("#position_id").removeClass("is-invalid");
					$("#position_id").removeClass("is-valid");
					//console.log(value);
					//console.log(data.toString().indexOf("1"));

					if (data.toString().indexOf("1") == -1 && checkPattern(id) == true) {
						duplicate_id = true
						$("#position_id").addClass("is-valid");
						$("#canuse").show();


					} else {
						duplicate_id = false
						$("#position_id").addClass("is-invalid");
						
					}
				}
			})
		} else {
			duplicate_id = false
			$("#position_id").addClass("is-invalid");
			//$("#canuse").hide();
			//$("#cannotuse").hide();
			//$("#nofill").show();
		}

		 document.getElementById("position_id").addEventListener("invalid", warnFunction);
	
		function warnFunction() {
			$("#position_id").addClass("is-invalid");
		}
 
	}
	
	function validate() {
		  'use strict';
		 
		    var forms = document.getElementsByClassName('needs-validation');
		    var inputs = document.getElementsByClassName('form_position_control')
		    
		    //console.log('forms'+forms);
		    //console.log('inputs'+inputs);
		    
		    $('#position_id').on('keypress', function(e) {
	            if (e.which == 32){
	                return false;
	            }
	        });

		    Array.prototype.filter.call(forms, function(form) {
		    
		    
		      form.addEventListener('submit', function(event) { 
		    	
		    	showWasValidate()
		    	//form.classList.add('was-validated');
		        if (form.checkValidity() === false || duplicate_id == false) {
		          event.preventDefault();
		          event.stopPropagation();
		        }		        
		        
		      }, false);
		      
		    });
		    $("select").on("select2:close", function (e) {  
		    	console.log("select");
		    	this.classList.remove('is-invalid')
			    this.classList.remove('is-valid')
		        if (this.checkValidity() === false) {
		        	this.classList.add('is-invalid')
		        	
		        }
		        else {
		        this.classList.add('is-valid')
		       
		        
		        }
		    });
		    
		    Array.prototype.filter.call(inputs, function(input) {
		    
		    	
			      input.addEventListener('blur', function(event) {
			    	 
			    	//console.log(input);
			    	
			    	

					if (input.id != 'position_id'){
						// reset
				        input.classList.remove('is-invalid')
				        input.classList.remove('is-valid')
				       
				        if (input.checkValidity() === false) {
				        		input.classList.add('is-invalid')
				        }
				        else if(input.id = 'name_position') {
				        	var name = $('#name_position').val()
				        	if(name.trim() == "")
				        	input.classList.add('is-invalid')
				        }
				        else{
				        	input.classList.remove()
				        }	
						
					}
					else {
						 input.classList.remove('is-invalid')
					      input.classList.remove('is-valid')
						checkId();
					}
			      }, false);
			    });
		    
		
	};
	
	function showWasValidate(){
		
		var inputs = document.getElementsByClassName('form_position_control')
	    Array.prototype.filter.call(inputs, function(input) {
	    	
			if (input.id != 'position_id'){
				// reset
				 checkId()
			     input.classList.remove('is-invalid')
			     input.classList.remove('is-valid')
			        
			        if (input.checkValidity() === false) {
			        		input.classList.add('is-invalid')
			        }
			        else{
			            input.classList.remove()
			        }					
			}

		});
	}
	
	

	
	$(document).ready(function() {
		
		
		validate();
	
	});

</script>

