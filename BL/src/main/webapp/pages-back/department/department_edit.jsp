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
	<h1 class="page-title">Edit Department</h1>
	<div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item" onclick="history.back()"><a
				href="department_list">Home</a></li>
			<li class="breadcrumb-item text-muted" href="#">Department</li>
			<li class="breadcrumb-item active" aria-current="page">Edit
				Department</li>
		</ol>
	</div>
</div>

<!-- DepartmentForm -->
<div class="row clearfix">
	<div class="col-lg-12">
		<form action="javascript:submitUpdateDepartmentForm()"
			name="updateDepartForm" id="updateDepartForm"
			class="needs-validation" method="POST">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Edit Department</h3>
				</div>

				<div class="card-body">


					<div class="form-group">
						<label class="form-label"> Department ID <span
							class="text-red">*</span></label> <input type="text"
							class="form-control form_department_control" name="ID"
							id="depart_id" value="${departmentList.department_id}" disabled>
						<input type="hidden" name="ID"
							value="${departmentList.department_id}">
					</div>
					<div class="form-group">
						<label class="form-label">Department Name <span
							class="text-red">*</span></label> <input type="text"
							class="form-control form_department_control" name="name"
							id="name" value="${departmentList.name}" required>
					</div>
					<div class="form-group">
						<label class="form-label">Description </label> <input type="text"
							class="form-control form_department_control" name="description" id="descrip"
							value="${departmentList.description}">
					</div>
					<div class="form-group">
						<label class="form-label">Prefix ID </label> <input type="text"
							class="form-control form_department_control" name="prefix_id" id="prefix"
							value="${departmentList.prefix_id}">
					</div>
				</div>

				<input type="hidden" name="logonUser" value="${logonUser}">


			</div>
			<div style="text-align: right">
				<button type="button" onclick="history.back()" class="btn btn-light" id="cancel" hidden>Cancel</button>
				<button type="submit" id="save" class="btn btn-success" hidden>Save</button>

			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
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

	function submitUpdateDepartmentForm() {
		var values = $("#updateDepartForm").serializeArray()
		console.log(values);
		$.ajax({
			url : "updateDepartment",
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
	/* 
	$(document).ready(function() {
		  $('#updateDepartForm').prop('disabled', true);

		  function validateNextButton() {
		    var buttonDisabled = $('#updateDepartForm').val().trim() === ''
		    $('#save').prop('disabled', buttonDisabled);
		  }

		  $('#updateDepartForm').on('keyup', validateNextButton);
		}); */
		
		/* $(document).ready(function() {
			  $('#updateDepartForm').prop('disabled', true);

			  function validateNextButton() {
			    var buttonDisabled =  $('#form :input').on('change', function(){
			        $('#save').removeAttr('disabled');
			    $('#save').prop('disabled', buttonDisabled);
			  }

			  $('#updateDepartForm').on('keyup', validateNextButton);
			}); */
			
			$(document).ready(function() {
			    $('#name,#descrip,#prefix').on('input change', function() {
			        if($(this).val() != '') {
			            $('#save,#cancel').prop('hidden', false);
			        } else {
			            $('#save,#cancel').prop('hidden', true);
			        }
			    });
			});
</script>