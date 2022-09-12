<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<div class="page-header">
    <h1 class="page-title">Company Management</h1>
    <div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0)">Company</a></li>
            <li class="breadcrumb-item active" aria-current="page">Company Management</li>
        </ol>
    </div>
</div>
<form action="Editform_company" method="POST">
<div class="card">
	<div class="card-header">
		<div class="card-title">Company Information</div>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-lg-4 col-sm-12 mb-4 mb-lg-0" ></div>
			<div class="col-lg-4 col-sm-12 mb-4 mb-lg-0" >
           		<input style="text-align:center;" type="file" class="dropify"  data-bs-height="180" />
    		</div>

    	<div class="col-sm-6 " style="margin-top:30px">
			<div class="form-group">
					<label for="recipient-name" class="control-label">Company Code<span style="color:red;"> *</span></label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control" name="code" value="${company.company_code}" required>  
                    </div>  
              </div>
         </div>
         <div class="col-sm-6 " style="margin-top:30px">
			<div class="form-group">
					<label for="recipient-name" class="control-label">TaxID<span style="color:red;"> *</span></label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control" name="tax" value="${company.tax_number}" required>  
                    </div>  
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label for="recipient-name" class="control-label">CompanyName EN<span style="color:red;"> *</span></label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control" name="name_en" value="${company.company_en }" required>  
                    </div>  
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label for="recipient-name" class="control-label">CompanyName TH<span style="color:red;"> *</span></label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control" name="name_th" value="${company.company_th }" required>  
                    </div>  
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label for="recipient-name" class="control-label">Industry<span style="color:red;"> *</span></label> 
					<select class="form-control form-select select2" data-placeholder="-- Choose --" name="industry" required>
						<option label = "Choose"></option>
						<option value="0" <c:if test="${company.industry == 0}">selected</c:if>>Agro & Food Industry</option>
						<option value="1" <c:if test="${company.industry == 1}">selected</c:if>>Consumer Products</option>
						<option value="2" <c:if test="${company.industry == 2}">selected</c:if>>Financials</option>
						<option value="3" <c:if test="${company.industry == 3}">selected</c:if>>Industrials</option>
						<option value="4" <c:if test="${company.industry == 4}">selected</c:if>>Property & Construction</option>
						<option value="5" <c:if test="${company.industry == 5}">selected</c:if>>Resources</option>
						<option value="6" <c:if test="${company.industry == 6}">selected</c:if>>Services</option>
						<option value="7" <c:if test="${company.industry == 7}">selected</c:if>>Technology</option>
					</select> 
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label for="recipient-name" class="control-label">Status<span style="color:red;"> *</span></label> 
					<select class="form-control select2 form-select" data-placeholder="-- Choose --" name="status" required>
						<option label = "Choose"></option>
						<option value="0" <c:if test="${company.status == 0}">selected</c:if>>Customers</option>
						<option value="1" <c:if test="${company.status == 1}">selected</c:if>>Partners</option>
						<option value="2" <c:if test="${company.status == 2}">selected</c:if>>Financial</option>
						<option value="3" <c:if test="${company.status == 3}">selected</c:if>>Legal</option>
						<option value="4" <c:if test="${company.status == 4}">selected</c:if>>Leadership and Peer Mentors</option>
						<option value="5" <c:if test="${company.status == 5}">selected</c:if>>Employees</option>
					</select> 
              </div>
         </div>
         <div class="col-sm-2">
         	<label class="custom-control custom-checkbox">
               <input name="is_active" type="checkbox" class="custom-control-input" <c:if test ="${company.is_active == 1}">checked</c:if>><span>&nbsp;Is_Active</span>
               <span class="custom-control-label"></span>
            </label>
         </div>
	</div>
	</div>
</div>
<div class="card">
	<div class="card-header">
		<div class="card-title">Company Contact</div>
	</div>
	<div class="card-body">
	
	</div>
</div>

<div class="card">
	<div class="card-header">
		<div class="card-title">Company Sales</div>
	</div>
	<div class="card-body">
	
	</div>
</div>

<div class="card">
	<div class="card-header">
		<div class="card-title">Company Payment</div>
	</div>
	<div class="card-body">
	
	</div>
</div>

<div  style="text-align: right; margin-top: 1rem; margin-bottom: 1.5rem;">
	<a href="company_list" type="button" class="btn btn-secondary" style="min-width: 5%;">Cancel</a>
	<button  type="submit" class="btn btn-primary" style="min-width: 5%;">Save</button>
</div>
</form>