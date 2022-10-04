<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${bean.date}" pattern="dd-MM-yyyy" />


<style>
.head-ml {
	margin-left: -10px;
}
</style>
<!-- PAGE Header-->
<div class="page-header">
	<h1 class="page-title">Create Department</h1>
	<div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item" onclick="history.back()"><a
				href="department_list">Home</a></li>
			<li class="breadcrumb-item text-muted" href="#">Department</li>
			<li class="breadcrumb-item active" aria-current="page">Create
				Department</li>
		</ol>
	</div>
</div>

<!-- DepartmentForm -->
<div class="row clearfix">
	<div class="col-lg-12">
		<form action="javascript:submitAddDepart()" name="addDepartForm"
			id="addDepartForm" class="needs-validation" novalidate method="POST">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Create Department</h3>
				</div>


				<div class="card-body">
					<div class="">
						<div class="form-group">
							<label class="form-label">Department ID <span
								class="text-red">*</span></label> <input type="text"
								class="form-control form_department_control" name="ID"
								id="depart_id" placeholder="Enter ID" pattern="[a-zA-Z0-9.]+" autocomplete="no"
								required>
							<div class="valid-feedback"id="canuse" >
									You can use this id
								</div>
								
								<div class="invalid-feedback">Can only fill in English numbers . (dot) Don't duplicate the original Id and Don't leave this blank.</div>
						</div>
						<div class="form-group">
							<label class="form-label">Department Name <span
								class="text-red">*</span></label> <input type="text"
								class="form-control form_department_control" name="name"
								id="name" placeholder="Enter Name" required>
							<div class="invalid-feedback">required this field</div>
						</div>
						<div class="form-group">
							<label class="form-label">Description </label> <input type="text"
								class="form-control form_department_control" name="description"
								placeholder="Enter Description">
						</div>
						<div class="form-group">
							<label class="form-label">Prefix ID </label> <input type="text"
								class="form-control form_department_control" name="prefix_id"
								placeholder="Enter Prefix ID">
						</div>
					</div>
				</div>
			</div>
			<div style="text-align: right">
				<button type="button" onclick="history.back()" class="btn btn-light">Cancel</button>
				<button type="submit" class="btn btn-success" id="NoSubmit">Save</button>

			</div>




		</form>
	</div>
</div>

<script>
var duplicate_id = false

function datechenge() {
	var fulldate = "${fulldate}".trim();
	var Userdate = $("#mydate").val();
	if(fulldate != Userdate){
		$("#detail").show();
		$("#labeldetail").show();
	}else{
		$("#detail").hide();
		$("#labeldetail").hide();
	}		
}
function checkDupId(){
	//$('#depart_id').on('keyup blur', function() {
		var flag = true;
		var id = $('#depart_id').val();
		
		if(id != ""){
				$.ajax({
					url: "CheckDuplicateDepart",
					method: "POST" ,
					type: "JSON" ,
					data: {
						"ID" : id
					},
					success:function(data){
						console.log(data)
						var input = document.getElementById('depart_id')
						input.classList.remove('is-invalid')
				        input.classList.remove('is-valid')
		        	
						if (data.flag == 0 && input.checkValidity() == true) {
							duplicate_id = true
							$("#canuse").show();
							$("#depart_id").addClass('is-valid');
						} else {
							duplicate_id = false
							$("#canuse").hide();
							$("#depart_id").addClass('is-invalid');
							
						}
					}
				})
			
			}else{
				duplicate_id = false
				var input = document.getElementById('depart_id')
				input.classList.add('is-invalid')
				$("#canuse").hide();
				

			}

}

function validate() {
		  'use strict';
		  window.addEventListener('load', function() {
		    var forms = document.getElementsByClassName('needs-validation');
		    var inputs = document.getElementsByClassName('form_department_control')

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
		    
		    
		    Array.prototype.filter.call(inputs, function(input) {
		    	
			      input.addEventListener('blur', function(event) {
			    	checkDupId()//check duplicate id

					if (input.id != 'depart_id'){
						// reset
				        input.classList.remove('is-invalid')
				        input.classList.remove('is-valid')
				        
				        if (input.checkValidity() === false) {
				        		input.classList.add('is-invalid')
				        }
				        else{
				            input.classList.remove()
				        }					
					}
			      }, false);
			    });
		    
		 }, false);
};

function showWasValidate(){
	
	var inputs = document.getElementsByClassName('form_department_control')
    Array.prototype.filter.call(inputs, function(input) {
    	
		if (input.id != 'depart_id'){
			// reset
			checkDupId()
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

	function submitAddDepart() {
		var values = $("#addDepartForm").serializeArray()
		console.log(values);
		$.ajax({
			url : "saveDepartment",
			type : "post",
			data : values,
			success : function(values) {
				document.location = "department_list";
				// You will get response from your PHP page (what you echo or print)
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus, errorThrown);
			}
		});
	}
	
	$(document).ready(function() {
		validate()
		
	});
</script>