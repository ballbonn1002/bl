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

<div class="page-header">
	<h1 class="page-title">Setting Company</h1>
	<div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item" onclick="history.back()"><a
				href="department_list">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Setting
				Company</li>
		</ol>
	</div>
</div>


<!-- CompanyForm -->

<form action="" name="" id="" class="" novalidate method="">
	<div class="row clearfix">
		<div class="col-xl-12">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">Company Information</h3>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-lg-4 col-sm-12 mb-4 mb-lg-0"></div>
						<div class="col-lg-4 col-sm-12 mb-4 mb-lg-0">
							<input style="text-align: center;" name="fileUpload"
								id="fileUpload" type="file" class="dropify"
								accept="image/x-png,image/gif,image/jpeg" data-bs-height="180" />
							<input style="display: none;" id="filesize" name="filesize"
								type="text" value="">
						</div>
						<div class="col-lg-4 col-sm-12 mb-4 mb-lg-0"></div>
						
						<div class="col-lg-6 col-md-12" style="margin-top:0.5rem">
							<div class="form-group">
								<label class="form-label">Company Name EN <span
									class="text-red">*</span></label> <input type="text"
									class="form-control form_company_control" name="companynameEN"
									id="companynameENl" placeholder="Enter your company name"
									autocomplete="no" required>
								<div class="invalid-feedback"></div>
							</div>
						</div>
						<div class="col-lg-6 col-md-12"style="margin-top:0.5rem">
							<div class="form-group">
								<label class="form-label">Company Name TH <span
									class="text-red">*</span></label> <input type="text"
									class="form-control form_company_control" name="companynameEN"
									id="companynameEN" placeholder="Enter your company name"
									required>
								<div class="invalid-feedback"></div>
							</div>
						</div>
						<div class="col-lg-6 col-md-12">
							<div class="form-group">
								<label class="form-label">Tax ID <span class="text-red">*</span></label>
								<input type="number" class="form-control form_company_control"
									name="taxID" id="taxID" placeholder="Enter your Tax ID"
									autocomplete="no" required>
								<div class="invalid-feedback"></div>
							</div>
						</div>
						<div class="col-lg-6 col-md-12">
							<label class="form-label">Phone Number <span
								class="text-red">*</span></label> <input type="tel"
								class="form-control form_company_control" name="Phone"
								id="phone" placeholder="Enter your Phone Number" required>
							<div class="invalid-feedback"></div>
						</div>
						<div class="form-group">
							<label class="form-label">Address <span class="text-red">*</span></label>
							<textarea class="form-control form_employee_control"
								placeholder="Enter your address" name="Address"
								autocomplete="no"></textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="text-align: right">
		<button type="button" onclick="history.back()" class="btn btn-light">Cancel</button>
		<button type="submit" class="btn btn-success" id="NoSubmit">Save</button>

	</div>
</form>