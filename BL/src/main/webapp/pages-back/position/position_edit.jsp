
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- JQUERY JS -->
<script src="/assets/js/jquery.min.js"></script>


<c:set var="now" value="<%=new java.util.Date()%>" />



<!-- PAGE-HEADER -->
<div class="container-fluid">
	<div class="page-header">
		<h1 class="page-title">Position Edit</h1>
		<div>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
				<li class="breadcrumb-item"><a href="position_list">Position</a></li>
				<li class="breadcrumb-item active" aria-current="page">Position
					Edit</li>
			</ol>
		</div>
	</div>
<form id="form_update" action="javascript:updateData()"
			class="needs-validation" novalidate>
	<div class="card">
		<div class="card-header">
			<h3 class="card-title">Position Edit</h3>
		</div>
		
			<div class="card-body">
				<div class="col-md-12">
					<div class="form-group">
						<label class="form-label ">Position ID <span
							class="text-red">*</span></label> <input type="text" name="positionId"
							class="form-control form_position_control"
							value="${positionList.positionId}" disabled required> <input
							type="hidden" name="positionId"
							value="${positionList.positionId}">
					</div>
				</div>

				<div class="col-md-12">
					<div class="form-group">
						<label class="form-label">Department <span
							class="text-red">*</span></label> <select id="depart_id"
							class="form-control form-select form_position_control"
							name="departmentId" data-placeholder="Select Department" required>
							
							 <c:forEach var="department" items="${departmentList}">
								<option value="${department.department_id}"
									<c:if test="${positionList.departmentId eq department.department_id }"> selected </c:if>>${department.department_id}
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
							value="${positionList.name}" required>
						<div class="valid-feedback"></div>
						<div class="invalid-feedback">required this field</div>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label class="form-label">Description:</label> <input type="text"
							name="description" class="form-control"
							value="${positionList.description}">

					</div>
				</div>
			</div>

			
		
	</div>
	<div class="text-end">
				<a type="reset" class="btn btn-default"
					href="position_list">Cancel</a>
				<button id="submit_position" type="submit" class="btn btn-success">Save</button>
			</div>
	</form>
</div>
<script>


	function updateData() {
		var update_data = $("#form_update").serializeArray();
		console.log(update_data);
		$.ajax({
			url : "updatePosition",
			method : "POST",
			type : "JSON",
			data : update_data,
			success : function() {

					window.location = "position_list";
	
				//console.log(data)
			}
		})
	}

	function validate() {
		'use strict';

		var forms = document.getElementsByClassName('needs-validation');
		var inputs = document.getElementsByClassName('form_position_control')

		console.log('forms' + forms);
		console.log('inputs' + inputs);

		Array.prototype.filter.call(forms, function(form) {

			form.addEventListener('submit', function(event) {

				showWasValidate();

				if (form.checkValidity() === false) {
					event.preventDefault();
					event.stopPropagation();
				}

			}, false);

		});

		Array.prototype.filter.call(inputs, function(input) {

			input.addEventListener('blur', function(event) {

				console.log(input);

				if (input.id != 'position_id') {
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

	};

	function showWasValidate() {

		var inputs = document.getElementsByClassName('form_position_control')
		Array.prototype.filter.call(inputs, function(input) {

			if (input.id != 'position_id') {

				input.classList.remove('is-invalid')
				input.classList.remove('is-valid')

				if (input.checkValidity() === false) {
					input.classList.add('is-invalid')
				} else {
					input.classList.remove('is-invalid')
				}
			}

		});
	}

	$(document).ready(function() {
		validate()
	});
</script>


