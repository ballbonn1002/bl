<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>

<!-- JQUERY JS -->
<script src="/assets/js/jquery.min.js"></script>

<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${bean.date}" pattern="dd-MM-yyyy" />



<div class="page-header">
	<h1 class="page-title">Edit Employee</h1>
	<div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item" onclick="history.back()"><a
				href="employee_list">Home</a></li>
			<li class="breadcrumb-item text-muted" href="#">Employee</li>
			<li class="breadcrumb-item active" aria-current="page">Edit
				Employee</li>
		</ol>
	</div>
</div>

<!-- DepartmentForm -->
<form action="javascript:submitUpdateEmployeeForm()"
	id="updateEmployForm" class="need-validation" novalidate method="POST">
	<div class="row clearfix">

		<div class="col-xl-4">

			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Personal Information</h3>
				</div>
				<div class="card-body">
					<div class="form-group text-center">
						<div class="avatar avatar-xxl brround">
							<span class="badge rounded-pill avatar-icons bg-primary"><i
								class="fe fe-edit fs-12"></i></span>
						</div>
					</div>
					<div class="form-group text-center">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="Gender"
								id="Gender" value="${employeeList[0].gender}"
								<c:if test="${employeeList[0].gender eq 'M'}">checked</c:if>>
							<label class="form-check-label" for="inlineRadio1">Male</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="Gender"
								id="Gender" value="${employeeList[0].gender}"
								<c:if test="${employeeList[0].gender eq 'F'}">checked</c:if>>
							<label class="form-check-label" for="inlineRadio2">Female</label>

						</div>
					</div>
					<div class="form-group">
						<label class="form-label">Name EN <span class="text-red">*</span></label>
						<div class="input-group">

							<select value="" class="custom-select custom-select-lg"
								name="titleEN" required>
								<option value="Mr."
									<c:if test="${employeeList[0].title_name_en eq 'Mr.'}">selected</c:if>>Mr.</option>
								<option value="Mrs."
									<c:if test="${employeeList[0].title_name_en eq 'Mrs.'}">selected</c:if>>Mrs.</option>
								<option value="Miss"
									<c:if test="${employeeList[0].title_name_en eq 'Miss'}">selected</c:if>>Miss</option>
							</select> <input type="text" class="form-control"
								aria-label="Text input with dropdown button"
								pattern="[a-zA-Z. ]+" placeholder="Enter Your Name" name="nameEN"
								value="${employeeList[0].name_en}">
						</div>
					</div>

					<div class="form-group">
						<label class="form-label">Nickname EN <span
							class="text-red">*</span></label> <input type="text"
							class="form-control form_department_control" 
							id="nicknameEN" placeholder="Enter Your Nickname"
							name="nicknameEN" value="${employeeList[0].nickname_en}" required>
					</div>
					<div class="form-group">
						<label class="form-label">Name TH <span class="text-red">*</span></label>
						<div class="input-group">

							<select value="" class="custom-select custom-select-lg"
								name="titleTH" required>
								<option value="นาย"
									<c:if test="${employeeList[0].title_name_th eq 'นาย'}">selected</c:if>>นาย</option>
								<option value="นาง"
									<c:if test="${employeeList[0].title_name_th eq 'นาง'}">selected</c:if>>นาง</option>
								<option value="นางสาว"
									<c:if test="${employeeList[0].title_name_th eq 'นางสาว'}">selected</c:if>>นางสาว</option>
							</select> <input type="text" class="form-control"
								aria-label="Text input with dropdown button"
								placeholder="Enter Your Name" pattern="[ก-ฮ ]+"
								name="nameTH" value="${employeeList[0].name_th}" required>
						</div>

					</div>
					<div class="form-group">
						<label class="form-label">Nickname TH <span
							class="text-red">*</span></label> <input type="text"
							class="form-control form_department_control"
							id="Employee_id" placeholder="Enter Your Nickname"
							pattern="[ก-ฮ ]+" name="nicknameTH"
							value="${employeeList[0].nickname_th}" required>
					</div>
				</div>
			</div>

		</div>
		<div class="col-xl-8">
			<!-- 		<form action="javascript:submitAddEmploy()" name="addEmployForm"
			class="need-validation" novalidate method="POST"> -->
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Employee Information</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="form-group">
							<label class="form-label">Employee ID <span
								class="text-red">*</span></label> <input type="text"
								class="form-control form_department_control" name="employID"
								id="Employee_id" value="${employeeList[0].employee_id}" disabled>
							<input type="hidden" name="Employee_id"
								value="${employeeList[0].employee_id}">
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="form-group">
								<label class="form-label">Department <span class="text-red">*</span></label> 
								<select id="depart_id"
									class="form-control form-select form_employee_control"
									name="user.departmentID" data-placeholder="Select Department" required>
									
									<c:forEach var="department" items="${departmentList}">
										<option value="${department.department_id}"
											<c:if test="${employeeList[0].department_id eq department.department_id }"> selected </c:if>>${department.department_id}
											- ${department.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="form-group">
								<label class="form-label">Position <span
									class="text-red">*</span></label> <select id="posi_id"
									class="form-control form-select form_position_control"
									name="user.positionID" data-placeholder="Select Position"
									required>

									<c:forEach var="position" items="${positionList}">
										<option value="${position.position_id}"
											<c:if test="${employeeList[0].position_id eq position.position_id}"> selected </c:if>>${position.position_id}
											- ${position.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="form-group">
								<label class="form-label">Email <span class="text-red">*</span></label>
								<input type="email" class="form-control form_department_control"
									name="Email" id="email" placeholder="Enter Your Email"
									value="${employeeList[0].email}" required>
							</div>
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="form-group">
								<label class="form-label">Phone Number <span
									class="text-red">*</span></label> <input type="number"
									class="form-control form_department_control" name="Phone"
									id="phone" placeholder="Enter Your Phone Number"
									value="${employeeList[0].phone}" required>
							</div>
						</div>

						<div class="form-group">
							<label class="form-floating">Address</label>
							<textarea class="form-control" placeholder="Enter your address"
								name="Address">${employeeList[0].address}</textarea>
								<div class="invalid-feedback"></div>
						</div>
						<div class="form-group">
							<label class="custom-control custom-checkbox mb-0"> <input
								type="checkbox" id="userIsactive" class="custom-control-input"
								name="user_isactive" value="${employeeList[0].enable}"
								<c:if test="${fn:contains(employeeList[0].enable, '1')}">checked</c:if>>
								<input id='checkboxHidden' type='hidden' value='0'
								name='user_isactive'> <span class="custom-control-label">Is
									Active</span>
							</label>
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
	$('#userIsactive').on('change', function() {
		this.value = this.checked ? 1 : 0;
		console.log(this.value);
	});

	$("#submit").click(function() {
		if (document.getElementById("user_isactive").checked) {
			document.getElementById('checkboxHidden').disabled = true;
		}
	});

function submitUpdateEmployeeForm() {
		var values = $("#updateEmployForm").serializeArray()
		console.log(values);
		$.ajax({
			url : "updateEmployee",
			type : "post",
			data : values,
			success : function(values) {
 				document.location = "employee_list"; 
				// You will get response from your PHP page (what you echo or print)
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus, errorThrown);
			}
		});
	}
</script>
