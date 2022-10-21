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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script src="/assets/plugins/fileuploads/js/fileupload.js"></script>
<script src="/assets/plugins/fileuploads/js/file-upload.js"></script>
<style>
li.test{    
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 2s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}
tr{    
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 2s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}
@keyframes fadeIn {
  from {
    opacity: 0;
  }

  to {
    opacity: 1;
  }
}
.picture input[type="file"] {
    cursor: pointer;
    display: block;
    height: 100%;
    left: 0;
    opacity: 0 !important;
    position: absolute;
    top: 0;
    width: 100%;
}
.inValid{
    border-color: #dc3545 !important;
    padding-right: calc(1.5em + 0.75rem);
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right calc(0.375em + 0.1875rem) center;
    background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}
.Valid{
    border-color: #198754 !important;
    padding-right: calc(1.5em + 0.75rem);
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%23198754' d='M2.3 6.73L.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right calc(0.375em + 0.1875rem) center;
    background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}
</style>
<div class="page-header">
    <h1 class="page-title">Company Management</h1>
    <div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0)">Company</a></li>
            <li class="breadcrumb-item active" aria-current="page">Company Management</li>
        </ol>
    </div>
</div>
<form action="update_information" method="POST" class="needs-validation" novalidate enctype="multipart/form-data">
<div class="card">
	<div class="card-header">
		<div class="card-title">Company Information</div>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-lg-4 col-sm-12 mb-4 mb-lg-0" ></div>
			<div class="col-lg-4 col-sm-12 mb-4 mb-lg-0" >
           		<input style="text-align:center;"  name="fileUpload" id="fileUpload" type="file" class="dropify dropify-event"  data-default-file="${company[0].path}" accept="image/x-png,image/gif,image/jpeg" data-bs-height="180"/>
           		<input style="display:none;" id="filesize" name="filesize" type="text" value="">
           		<input style="display:none;" type="text" class="form-control" id="company_ID" name="company_ID" value="${company[0].company_id}">
           		<input style="display:none;" type="text" class="form-control" name="file_ID" id="file_ID" value="${company[0].file_id}">
    		</div>
<hr><hr>
    	<div class="col-sm-6 ">
			<div class="form-group">
					<label class="form-label">Company Code<span style="color:red;"> *</span></label> 
						<input type="text" class="form-control" name="code" value="${company[0].company_code}" required>
						<div class="invalid-feedback">Don't leave this blank.</div>  
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label class="form-label">Tax ID<span style="color:red;"> *</span></label> 
						<input type="text" class="form-control" name="tax" value="${company[0].tax_number}"  
						pattern="^[0-9\s]{13}" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1');" maxlength="13" required>  
                    	<div class="invalid-feedback">Can't fill in Thai , Don't leave this blank.</div>
              </div>
         </div>
         <div class="col-sm-12 ">
			<div class="form-group">
					<label class="form-label">Company Name EN<span style="color:red;"> *</span></label> 
						<input type="text" class="form-control" name="name_en" value="${company[0].company_en}" pattern="^[a-zA-Z0-9.,\s]+$" required>
						<div class="invalid-feedback">Can only fill in English , Don't leave this blank.</div> 
              </div>
         </div>
         <div class="col-sm-12 ">
			<div class="form-group">
					<label class="form-label">Company Name TH<span style="color:red;"> *</span></label> 
						<input type="text" class="form-control" name="name_th" value="${company[0].company_th}" pattern="^[ก-๏\s]+$" required>  
                        <div class="invalid-feedback">Can only fill in Thai , Don't leave this blank.</div>  
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label class="form-label">Industry<span style="color:red;"> *</span></label> 
					<select class="form-control form-select select2" data-placeholder="Select" name="industry" required>
						<option label = "Select"></option>
						<option value="0" <c:if test="${company[0].industry == 0}">selected</c:if>>Agro & Food Industry</option>
						<option value="1" <c:if test="${company[0].industry == 1}">selected</c:if>>Consumer Products</option>
						<option value="2" <c:if test="${company[0].industry == 2}">selected</c:if>>Financials</option>
						<option value="3" <c:if test="${company[0].industry == 3}">selected</c:if>>Industrials</option>
						<option value="4" <c:if test="${company[0].industry == 4}">selected</c:if>>Property & Construction</option>
						<option value="5" <c:if test="${company[0].industry == 5}">selected</c:if>>Resources</option>
						<option value="6" <c:if test="${company[0].industry == 6}">selected</c:if>>Services</option>
						<option value="7" <c:if test="${company[0].industry == 7}">selected</c:if>>Technology</option>
					</select> 
					<div class="invalid-feedback">Don't leave this blank.</div>
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label class="form-label">Status<span style="color:red;"> *</span></label> 
					<select class="form-control select2 form-select" data-placeholder="Select" name="status" required>
						<option label = "Select"></option>
						<option value="0" <c:if test="${company[0].status == 0}">selected</c:if>>Customers</option>
						<option value="1" <c:if test="${company[0].status == 1}">selected</c:if>>Partners</option>
						<option value="2" <c:if test="${company[0].status == 2}">selected</c:if>>Financial</option>
						<option value="3" <c:if test="${company[0].status == 3}">selected</c:if>>Legal</option>
						<option value="4" <c:if test="${company[0].status == 4}">selected</c:if>>Leadership and Peer Mentors</option>
						<option value="5" <c:if test="${company[0].status == 5}">selected</c:if>>Employees</option>
					</select>
					<div class="invalid-feedback">Don't leave this blank.</div>
              </div>
         </div>
          <div class="col-sm-12 ">
			<div class="form-group">
					<label class="form-label">Website</label> 
						<input type="text" class="form-control" name="website" id="website" value="${company[0].website}">  
              </div>
         </div>
         <div class="col-sm-2">
         	<label class="custom-control custom-checkbox">
               <input name="is_active" type="checkbox" class="custom-control-input" <c:if test ="${company[0].is_active == 1}">checked</c:if>><span class="form-label">&nbsp;Is_Active</span>
               <span class="custom-control-label"></span>
            </label>
         </div>
	</div>
	</div>
</div>

<!-- Card Address -->
<div class="card">
	<div class="card-header">
		<div class="card-title">Customer Address</div>
	</div>
	<div class="card-body">
	<div>
           <ul class="list-group" id="gen_address">
			<c:forEach var="address" items="${addressList}">
               <li class="list-group-item">
               <div class="row">
               		<div class="col-sm-3" style="margin-top:5px;">${address.address_name}</div>
               		<div class="col-sm-8" style="margin-top:5px;">${address.address}</div>
               		<div class="col-sm-1" style="text-align:right;">
               		<div class="g-2">
               			<a class="btn text-danger btn-sm" onclick="delete_address('${address.company_address_id}',this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">
                     	<span class="fe fe-trash-2 fs-18"></span></a>
                     </div>  
               		</div>
               </div>
               </li>
              </c:forEach>
            </ul>
   </div>
    <div  style="text-align: left; margin-top: 1rem; margin-bottom: 1.5rem;">
		<button type="button" class="btn btn-primary" style="min-width: 5%;" data-bs-toggle="modal" data-bs-target="#AddressModal" id="clear_address">Create Address</button>
	</div>
	</div>
</div>

<!-- Card Contact -->
<div class="card">
	<div class="card-header">
		<div class="card-title">Company Contact</div>
	</div>
	<div class="card-body">
	<div>
           <ul class="list-group" id="gen_contact">
			<c:forEach var="con" items="${contactList}">
               <li class="list-group-item">
               <div class="row">
					<div class="col-sm-4 d-flex">
					<span><img src="${con.path}" class="avatar brround cover-image" style="margin-top:5px;"></span>&nbsp;&nbsp;&nbsp;
					<span>
							<span>${con.title_name_en} ${con.contact_name}</span><br>
							<span class="text-muted">${con.position}</span>
               		</span>
               		</div>
               		<div class="col-sm-2" style="margin-top:10px;"><i class="ti-location-pin"></i>&nbsp;&nbsp;${con.address_location}</div>
               		<div class="col-sm-2" style="margin-top:10px;"><i class="bi bi-telephone"></i>&nbsp;&nbsp;<span class="phone_con">${con.phone}</span></div>
               		<div class="col-sm-3" style="margin-top:10px;"><i class="ti-email"></i>&nbsp;&nbsp;${con.email}</div>
          	     	<div class="col-sm-1" style="text-align:right; margin-top:5px;">
               		 <div class="g-2">
               			<a class="btn text-danger btn-sm" onclick="delete_contact('${con.company_contact_id}',this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">
                     	<span class="fe fe-trash-2 fs-18"></span></a>
                     </div>
               		</div>  
               </div>
               </li>
              </c:forEach>
            </ul>
   </div>
	<div  style="text-align: left; margin-top: 1rem; margin-bottom: 1.5rem;">
		<button type="button" class="btn btn-primary" style="min-width: 5%;" data-bs-toggle="modal" data-bs-target="#ContactModal" id="clear_contact">Create Contact</button>
	</div>  
	</div>
</div>

<!-- Card Sales -->
<div class="card">
	<div class="card-header">
		<div class="card-title">Salesperson</div>
	</div>
	<div class="card-body">
		<div>
           <ul class="list-group li_list" id="gen_sales">
			<c:forEach var="sales" items="${salesList}">
               <li class="list-group-item ">
               <div class="row">
               <div class="col-sm-6 d-flex">
					<span><img src="${sales.path}" class="avatar brround cover-image" style="margin-top:5px;"></span>&nbsp;&nbsp;&nbsp;
					<span>
							<span>${sales.title_name_en} ${sales.name_en}</span><br>
							<span class="text-muted">${sales.employee_id}</span>
               		</span>
               		</div>
               		<div class="col-sm-2" style="margin-top:5px;"><i class="bi bi-telephone"></i>&nbsp;&nbsp;<span class="phone_sales">${sales.phone}</span></div>
               		<div class="col-sm-3" style="margin-top:5px;"><i class="ti-email"></i>&nbsp;&nbsp;${sales.email}</div>
          	     	<div class="col-sm-1" style="text-align:right;">
               		 <div class="g-2">
               			<a class="btn text-danger btn-sm" onclick="delete_sales('${sales.company_sales_id}',this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">
                     	<span class="fe fe-trash-2 fs-18"></span></a>
                     </div>
               		</div>      
               </div>
               </li>
              </c:forEach>
            </ul>
   </div>
	<div  style="text-align: left; margin-top: 1rem; margin-bottom: 1.5rem;">
		<button type="button" id="select_person" class="btn btn-primary" style="min-width: 5%;" data-bs-toggle="modal" data-bs-target="#SalesModal">Select Salesperson</button>
	</div>
	</div>
</div>

<div  style="text-align: right; margin-top: 1rem; margin-bottom: 1.5rem;">
	<a href="company_list" type="button" class="btn btn-default" style="min-width: 5%;">Cancel</a>&nbsp;&nbsp;
	<button type="submit" id="sub_edit" class="btn btn-success" style="min-width: 5%;">Save</button>
</div>
</form>
<!-- Address Modal -->
    <div class="modal fade" id="AddressModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Customer Address</h5>
                    <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
                </div>
                <div class="modal-body">
						<div class="form-group" style="display:none">
							<input type="text" class="form-control" id="com_id_address" value="${company[0].company_id}">   
             			</div>
                    <div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">Address Name<span style="color:red;"> *</span></label> 
							<input type="text" class="form-control" id="address_name" required>   
							<small class="text-danger small" style="display:none" id="invalid-address_name">Don't leave this blank.</small>
             			</div>
         			</div>
         			<div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">Address<span style="color:red;"> *</span></label> 
							<textarea class="form-control" rows="4" id="address" required></textarea>   
							<small class="text-danger small" style="display:none" id="invalid-address">Don't leave this blank.</small>
             			</div>
         			</div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-bs-dismiss="modal">Cancel</button>
                    <button id="sub_address" class="btn btn-success" onclick="submit_address()">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    
<!-- Contact Modal -->
    <div class="modal fade" id="ContactModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Company Contact</h5>
                    <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
                </div>
                <form id="uploadForm" enctype="multipart/form-data" action="#" method="POST" >
                <div class="modal-body">
                		<div class="form-group" style="display:none">
							<input type="text" class="form-control" name="company_ID" id="com_id_contact" value="${company[0].company_id}">   
             			</div>
             			<div class="text-wrap picture" style="text-align:center;">
             				<span class="avatar avatar-xxl brround cover-image"><img id="wizardPicturePreview" class="avatar avatar-xxl brround">
                        	<span class="badge rounded-pill avatar-icons bg-primary"><i class="fe fe-edit fs-12"></i></span>
                        	 <input type="file" id="wizard-picture" name="fileUpload" class="img-fluid" accept="image/x-png,image/gif,image/jpeg">
                        	</span>
                        	<input style="display:none;" id="fileSize" name="filesize" type="text" value="">
                        </div>
                        <div class="col-sm-12">
             			<label class="form-label">Contact Name<span style="color:red;"> *</span></label> 
                             <div class="form-group">
                                            <div class="input-group">
                                                <select class="form-control col-sm-3" type="button" name="contact_title_name" id="contact_title_name">
                                                    <option value="Mr.">Mr.</option>
                                                    <option value="Ms.">Ms.</option>
                                                    <option value="Mrs.">Mrs.</option>
                                                </select>
                                                <input type="text" class="form-control" name="contact_name" id="contact_name" required >
                                            </div>
                                            <small class="text-danger small" style="display:none" id="invalid-contact_name">Don't leave this blank.</small>
                                        </div>
         			</div> 
         			<div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">Position<span style="color:red;"> *</span></label> 
							<input type="text" class="form-control" name="position" id="position" required>   
							<small class="text-danger small" style="display:none" id="invalid-position">Don't leave this blank.</small>
             			</div>
         			</div>
         			<div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">Phone Number<span style="color:red;"> *</span></label> 
							<input type="text" class="form-control" name="con_phone" id="con_phone" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*?)\..*/g, '$1');" maxlength="12" required>   
             				<small class="text-danger small" style="display:none" id="invalid-phone"> Only numbers 0-9 can be entered , Don't leave this blank.</small>
             			</div>
         			</div>
         			<div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">E-mail<span style="color:red;"> *</span></label> 
							<input type="email" class="form-control"  name="con_email" id="con_email" required>
							<small class="text-danger small" style="display:none" id="invalid-email">EX. example@example.com , Don't leave this blank </small>
             			</div>
         			</div>
         			<div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">Address Location</label> 
							<select class="form-select form-select select2" name="add_location" id="add_location" data-placeholder="Select"></select>
             			</div>
         			</div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" id="sub_contact" class="btn btn-success" onclick="submit_contact()" >Save changes</button>
                </div>
            </form> 
            </div>
        </div>
    </div>
    
<!-- Modal sales -->
 	<div class="modal fade" id="SalesModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-xl " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Select Salesperson</h5>
                    <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                    	<table class="table table-bordered text-nowrap mb-0 " id="myTable">
	                    	<thead>
	                    		<tr>
	                    			<th class="bg-transparent border-bottom-0" style="text-align:center;">#</th>
	                    			<th class="bg-transparent border-bottom-0">Employee ID</th>
	                    			<th class="bg-transparent border-bottom-0">Employee Name</th>
	                    			<th class="bg-transparent border-bottom-0">Phone Number</th>
	                    			<th class="bg-transparent border-bottom-0">E-mail</th>
	                    		</tr>
	                    	</thead>
	                    	<tbody id="getSale">
	                   	<c:forEach var="emp" items="${employeeList}">
	                    		<tr>
	                    			<td>
	                    				<label class="custom-control custom-checkbox" style="margin-left: 40%;">
	                                        <input type="checkbox" class="custom-control-input checkbox-tick chk" name="example-checkbox1" value="option1" >
	                                        <span class="custom-control-label"></span>
                                        </label>
	                    			</td>
	                    			<td>
	                    				<div class="d-flex">
											<span><img src="${emp.path}" class="avatar brround cover-image" style="min-width:32px; min-height:32px"></span><span class="ms-3 mt-0 mt-sm-2 d-block emp_id">${emp.employee_id}</span>
										</div>
									</td>
	                    			<td><div class="ms-3 mt-0 mt-sm-2 d-block"><span class="sale_title">${emp.title_name_en}</span> <span class="sale_name_en">${emp.name_en}</span></div></td>
	                    			<td><div class="ms-3 mt-0 mt-sm-2 d-block sale_phone phone_sales">${emp.phone}</div></td>
	                    			<td><div class="ms-3 mt-0 mt-sm-2 d-block sale_email">${emp.email}</div><div class="sale_company_id" style="display:none">${company[0].company_id}</div></td>
	                    		</tr>
	                    		</c:forEach>    
	                    	</tbody> 
                    	</table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-bs-dismiss="modal">Close</button>
                    <button class="btn btn-success" data-bs-dismiss="modal" onclick="selectSale()">Save changes</button>
                </div>
            </div>
        </div>
    </div>
<script>
$('#wizard-picture').bind('change', function() {
	 var fs;
	 var size = this.files[0].size;
	 fs = $("#fileSize").val(size);
	 console.log(fs);
})
</script>  
<script>
var drEvent = $('.dropify-event').dropify();
drEvent.on('dropify.beforeClear', function(event, element) {
var company_id = $("#company_ID").val();
var file_id = $('#file_ID').val();

$.ajax({
	 url: 'Delete_image',
	 method: 'POST',
	 type: 'JSON',
	 data: {
		 'file_id' : file_id,
		 'company_id' : company_id,
	 },
	 success:function(data){
		 console.log(data);
	 }
})
});
</script>
<script>
$('#fileUpload').bind('change', function() {
	 var fs;
	 var size = this.files[0].size;
	 fs = $("#filesize").val(size);
	 console.log(fs);
});
</script>
<script>
	$("#sub_address").on('click',function(){
			var address_name = $("#address_name").val();
			var address = document.getElementById("address").value;
			var id = $("#com_id_address").val();
	if(address_name != "" && address != ""){		
			$.ajax({
				url: "add_address" ,
				type: "JSON",
				method: "POST",
				data:{
						"id" : id,
						"address_name" : address_name,
						"address" : address
				},
				success:function(data){
					console.log(data);
					swal({
						title: "SUCCESS",
		            	text: "Your information has been succesfully save",
		            	type: "success",
				}, function(inputValue) {
		            if (inputValue != "") {
		            	$('#AddressModal').modal('hide');
		            	let text = '<li class="list-group-item test">'+
						'<div class="row">'+
						'<div class="col-sm-3" style="margin-top:5px;">'+data.address_name+'</div>'+
						'<div class="col-sm-8" style="margin-top:5px;">'+data.address+'</div>'+
						'<div class="col-sm-1" style="text-align:right;">'+
						'<div class="g-2">'+
       					'<a class="btn text-danger btn-sm" onclick="delete_address('+data.company_address_id+',this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">'+
             			'<span class="fe fe-trash-2 fs-18"></span></a>'+
       					'</div>'+
             			'</div>'+
       					'</div>'+
       					'</li>';
					$("#gen_address").append(text);
		            }
					})
			}
		})
	}
	})
</script>
<script>
		$("#sub_contact").on('click',function(){
			const form = document.getElementById('uploadForm');
			var formData = new FormData(form);
			var name = $("#contact_name").val();
			var position = $("#position").val();
			var phone = $("#con_phone").val();
			var email = $("#con_email").val();
			var phlength = 12;
			var validRegex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(name != "" && position != ""  && phone.length == phlength && email.match(validRegex)){
			$.ajax({
				url: "add_contact" ,
				type: "JSON",
				method: "POST",
				processData: false,
				contentType: false,
				data: formData ,

				success:function(data){
				console.log(data);
				swal({
						title: "SUCCESS",
		            	text: "Your information has been succesfully save",
		            	type: "success",
				}, function(inputValue) {
		            if (inputValue != "") {
		            	$('#ContactModal').modal('hide');
		            	let text = '<li class="list-group-item test">'+
						'<div class="row">'+
						'<div class="col-sm-4 d-flex">'+
						'<span><img src="'+data[0].path+'" class="avatar brround cover-image" style="margin-top:5px;"></span>&nbsp;&nbsp;&nbsp;'+
						'<span>'+
						'<span>'+data[0].title_name_en+' '+data[0].contact_name+'</span><br>'+
						'<span class="text-muted">'+data[0].position+'</span>'+
               			'</span>'+
               			'</div>'+
               			'<div class="col-sm-2" style="margin-top:10px;"><i class="ti-location-pin"></i>&nbsp;&nbsp;'+data[0].address_location+'</div>'+
	               		'<div class="col-sm-2" style="margin-top:10px;"><i class="bi bi-telephone"></i>&nbsp;&nbsp;<span class="phone_con">'+data[0].phone+'</span></div>'+
	               		'<div class="col-sm-3" style="margin-top:10px;"><i class="ti-email"></i>&nbsp;&nbsp;'+data[0].email+'</div>'+
						'<div class="col-sm-1" style="text-align:right; margin-top:5px;">'+
						'<div class="g-2">'+
	   					'<a class="btn text-danger btn-sm" onclick="delete_contact('+data[0].company_contact_id+',this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">'+
	         			'<span class="fe fe-trash-2 fs-18"></span></a>'+
	         			'</div>'+
	   					'</div>'+
	   					'</div>'+
	   					'</li>';
						$("#gen_contact").append(text);
		            }
		            var phoneNumber = document.getElementsByClassName('phone_con');
		        	var x;
		        		for(var i=0; i< phoneNumber.length; i++){
		        			x = phoneFormat(phoneNumber[i].innerText);
		        			phoneNumber[i].innerText = x;
		        		}
					})
				}
			})   
		}
		});
</script>
<script>
	$("#clear_address").on('click',function(){
		var address_name = $("#address_name").val('');
		var address = document.getElementById("address").value = "";
		$("#address_name").removeClass("Valid");
		$("#address_name").removeClass("inValid");
		$("#address").removeClass("Valid");
		$("#address").removeClass("inValid");
		$("#invalid-address_name").hide();
		$("#invalid-address").hide();
	});
	$("#clear_contact").on('click',function(){
		document.getElementById("wizard-picture").value = "";
		$("#contact_name").removeClass("Valid");
		$("#contact_name").removeClass("inValid");
		$("#position").removeClass("Valid");
		$("#position").removeClass("inValid");
		$("#con_phone").removeClass("Valid");
		$("#con_phone").removeClass("inValid");
		$("#con_email").removeClass("Valid");
		$("#con_email").removeClass("inValid");
		$("#invalid-contact_name").hide();
		$("#invalid-position").hide();
		$("#invalid-phone").hide()
		$("#invalid-email").hide();
		var contact_name = $("#contact_name").val('');
		var position = $("#position").val('');
		var con_phone = $("#con_phone").val('');
		var con_email = $("#con_email").val('');
		var add_location = $("#add_location").val('');
		var id = $("#com_id_contact").val();
		
		$.ajax({
				url: 'SelectAddressLocation',
				type: 'JSON',
				method: 'POST',
				data: {
					"id" : id
				},
				success:function(data){
					console.log(data);
					let text = document.getElementById('add_location');
					let option = '<option label = "Select"></option>';
					for(var i=0; i<data.length; i++){
						option += 	'<option value="'+data[i].address_name+'">'+data[i].address_name+'</option>';
					}
					text.innerHTML = option;
			}
		})
	});
</script>
<script>
function delete_contact(id,currentEl){
		console.log(currentEl);
	    Swal.fire({
            title: 'Are you sure?',
            text: "You will be deleting this id!",
            icon: 'error',
            showDenyButton: true,
            denyButtonText: 'Cancel',
            confirmButtonText: 'Confirm',
            reverseButtons: true,
	    }).then((result) => {
                if (result.isConfirmed) { 
                	$.ajax({
                		url: 'Contact_delete',
                		type: 'JSON',
                		method: 'POST',
                		data: {
                				"id" : id ,
                		},
                		success:function(data){
                			console.log(data);
                			currentEl.parentNode.parentNode.parentNode.parentNode.remove();
                		}
                	})
                }
                else if (result.isDenied) {
                    return false;
                } 
      });  
};
</script>
<script>
function delete_address(id,currentEl){
	console.log(id);
	console.log(currentEl);
    Swal.fire({
        title: 'Are you sure?',
        text: "You will be deleting this id!",
        icon: 'error',
        showDenyButton: true,
        denyButtonText: 'Cancel',
        confirmButtonText: 'Confirm',
        reverseButtons: true,
    }).then((result) => {
            if (result.isConfirmed) { 
            	$.ajax({
            		url: 'Address_delete',
            		type: 'JSON',
            		method: 'POST',
            		data: {
            				"id" : id
            		},
            		success:function(data){
            			console.log(data);
            			currentEl.parentNode.parentNode.parentNode.parentNode.remove();
            		}
            	}) 
            }
            else if (result.isDenied) {
                return false;
            } 
  }); 
};  
</script>
<script>
function delete_sales(id,currentEl){
	console.log(currentEl);
    Swal.fire({
        title: 'Are you sure?',
        text: "You will be deleting this id!",
        icon: 'error',
        showDenyButton: true,
        denyButtonText: 'Cancel',
        confirmButtonText: 'Confirm',
        reverseButtons: true,
    }).then((result) => {
            if (result.isConfirmed) { 
            	$.ajax({
            		url: 'Sales_delete',
            		type: 'JSON',
            		method: 'POST',
            		data: {
            				"id" : id
            		},
            		success:function(data){
            			console.log(data);
            			currentEl.parentNode.parentNode.parentNode.parentNode.remove();
            			
            	//------------------------------- HERE-------------------------------------------		
            			var ul = document.querySelector("#gen_sales");
            			var liNodes = [];
            			for (var i = 0; i < ul.childNodes.length; i++) {
            				if (ul.childNodes[i].nodeName == "LI") {
            					liNodes.push(ul.childNodes[i]);
            				}
            			}
            				if(liNodes.length >= 3){
            					document.getElementById('select_person').disabled = true;
            				}else{
            					document.getElementById('select_person').disabled = false;
            				}
            	
            		}
            	})
            }
            else if (result.isDenied) {
                return false;
            } 
  }); 
};
</script>
<script>
$(document).ready(function(){
$('#myTable').DataTable({
 	"bPaginate": false,
  	"bLengthChange": true,
  	"bFilter": true,
  	"bInfo": true,
  	"bAutoWidth": true,
    language: {
        searchPlaceholder: 'Search...',
        sSearch: '',
    }
})
});
</script>
<script>
$(document).ready(function(){
	$('#select_person').on('click',function(){
	var ul = document.querySelector("#gen_sales");
	var liNodes = [];
	for (var i = 0; i < ul.childNodes.length; i++) {
		if (ul.childNodes[i].nodeName == "LI") {
			liNodes.push(ul.childNodes[i]);
		}
	}
	//console.log(liNodes.length);
	var checks = document.querySelectorAll(".chk");
	var max = 3;
	for (var i = 0; i < checks.length; i++)
	  checks[i].onclick = selectiveCheck;
	function selectiveCheck (event) {
	  var checkedChecks = document.querySelectorAll(".chk:checked");
	 // console.log(checkedChecks.length);
	  console.log(liNodes.length + checkedChecks.length);
	  if (liNodes.length + checkedChecks.length >= max + 1){
	    return false;
	  }
	  if(liNodes.length + checkedChecks.length >= 3){
			document.getElementById('select_person').disabled = true;
		}else{
			document.getElementById('select_person').disabled = false;
		} 
	}
	})
})
</script>
<script>	
$(document).ready(function(){
var ul = document.querySelector("#gen_sales");
var liNodes = [];
for (var i = 0; i < ul.childNodes.length; i++) {
	if (ul.childNodes[i].nodeName == "LI") {
		liNodes.push(ul.childNodes[i]);
	}
}
	if(liNodes.length >= 3){
		document.getElementById('select_person').disabled = true;
	}else{
		document.getElementById('select_person').disabled = false;
	}
console.log(liNodes.length);
})
</script>
<script>
function selectSale(){
	var getSaleList = []
$('#myTable tr').each(function() {
    $(this).find(".chk:checked").each(function() {
        let values = { 'employee_id' :  $(this).closest("tr").find('span.emp_id').text(),'name_en' :  $(this).closest("tr").find('span.sale_name_en').text(),
        				'title_name_en' :  $(this).closest("tr").find('span.sale_title').text(), 'phone' :  $(this).closest("tr").find('div.sale_phone').text(),
        				'email' :  $(this).closest("tr").find('div.sale_email').text() , 'company_id' : $(this).closest("tr").find('div.sale_company_id').text()}
        getSaleList.push(values);
    });
});
    $.ajax({
    	url : 'add_sales',
    	typr: 'JSON',
    	method: 'POST',
    	data: {
    				"value" : JSON.stringify(getSaleList)
    	},
    	success:function(data){
    		console.log(data);
			swal({
				title: "SUCCESS",
            	text: "Your information has been succesfully save",
            	type: "success",
		}, function(inputValue) {
            if (inputValue != "") {
		let text = '';
		for(var i=0; i<data.length;i++){
			for(var j=0; j<data[i].length;j++){
            	text += '<li class="list-group-item test del">'+
						'<div class="row">'+
						'<div class="col-sm-6 d-flex">'+
						'<span><img src="'+data[i][j].path+'" class="avatar brround cover-image" style="margin-top:5px;"></span>&nbsp;&nbsp;&nbsp;'+
						'<span>'+
						'<span>'+data[i][j].title_name_en+' '+data[i][j].name_en+'</span><br>'+
						'<span class="text-muted">'+data[i][j].employee_id+'</span>'+
           				'</span>'+
           				'</div>'+
           				'<div class="col-sm-2" style="margin-top:5px;"><i class="bi bi-telephone"></i>&nbsp;&nbsp;<span class="phone_sales">'+data[i][j].phone+'</span></div>'+
           				'<div class="col-sm-3" style="margin-top:5px;"><i class="ti-email"></i>&nbsp;&nbsp;'+data[i][j].email+'</div>'+
						'<div class="col-sm-1" style="text-align:right;">'+
						'<div class="g-2">'+
						'<a class="btn text-danger btn-sm" onclick="delete_sales('+data[i][j].company_sales_id+',this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">'+
     					'<span class="fe fe-trash-2 fs-18"></span></a>'+
     					'</div> '+
					'</div>'+
					'</div>'+
					'</li>';
				}
		}
			$("#gen_sales").append(text);
			var phoneNumber = document.getElementsByClassName('phone_sales');
			var x;
				for(var i=0; i< phoneNumber.length; i++){
					x = phoneFormat(phoneNumber[i].innerText);
					phoneNumber[i].innerText = x;
				}
            }
			})
    	}
    })
}
</script>
<script>
	$("#wizard-picture").change(function(){
	   readURL(this);
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
<script>
document.getElementById('con_phone').addEventListener('keyup',function(evt){
	    var phoneNumber = document.getElementById('con_phone');
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    phoneNumber.value = phoneFormat(phoneNumber.value);
	});

$(document).ready(function(){
	var phoneNumber = document.getElementsByClassName('phone_con');
	var x; var y;
		for(var i=0; i< phoneNumber.length; i++){
			x = phoneFormat(phoneNumber[i].innerText);
			phoneNumber[i].innerText = x;
		}
}); 

$(document).ready(function(){
	var phoneNumber = document.getElementsByClassName('phone_sales');
	var x; var y;
		for(var i=0; i< phoneNumber.length; i++){
			x = phoneFormat(phoneNumber[i].innerText);
			phoneNumber[i].innerText = x;
		}
});

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
<script>	
$("#address_name").on("keyup",function(){
	$("#address_name").removeClass("inValid");
	$("#address_name").addClass("Valid");
	$("#invalid-address_name").hide();
	if($("#address_name").val()==''){
		$("#address_name").removeClass("Valid");
		$("#address_name").addClass("inValid");
		$("#invalid-address_name").show();
	}
});
$("#address").on("keyup",function(){
	$("#address").removeClass("inValid");
	$("#address").addClass("Valid");
	$("#invalid-address").hide();
	if($("#address").val()==''){
		$("#address").removeClass("Valid");
		$("#address").addClass("inValid");
		$("#invalid-address").show();
	}
});
function submit_address(){
	var address_name = $("#address_name").val();
	var address = $("#address").val();
	console.log(address_name);
	
	if(address_name == ''){
		$("#address_name").addClass("inValid");
		$("#invalid-address_name").show();
	}else{
		$("#address_name").addClass("Valid");
		$("#address_name").removeClass("inValid");
		$("#invalid-address_name").hide();
	}
	
	if(address == ''){
		$("#address").addClass("inValid");
		$("#invalid-address").show();
	}else{
		$("#address").addClass("Valid");
		$("#address").removeClass("inValid");
		$("#invalid-address").hide();
	}
}
</script>
<script>
$("#contact_name").on("keyup",function(){
	$("#contact_name").removeClass("inValid");
	$("#contact_name").addClass("Valid");
	$("#invalid-contact_name").hide();
	if($("#contact_name").val()==''){
		$("#contact_name").removeClass("Valid");
		$("#contact_name").addClass("inValid");
		$("#invalid-contact_name").show();
	}
});
$("#position").on("keyup",function(){
	$("#position").removeClass("inValid");
	$("#position").addClass("Valid");
	$("#invalid-position").hide();
	if($("#position").val()==''){
		$("#position").removeClass("Valid");
		$("#position").addClass("inValid");
		$("#invalid-position").show();
	}
});
$("#con_phone").on("keyup",function(){
	var x = $("#con_phone").val();
	if(x.length == 12){
		$("#con_phone").removeClass("inValid");
		$("#con_phone").addClass("Valid");
		$("#invalid-phone").hide();
	}
	else{
		$("#con_phone").removeClass("Valid");
		$("#con_phone").addClass("inValid");
		$("#invalid-phone").show();
	}
});
$("#con_email").on("keyup",function(){
	var validRegex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var x = $("#con_email").val();
	if(x.match(validRegex)){
	$("#con_email").removeClass("inValid");
	$("#con_email").addClass("Valid");
	$("#invalid-email").hide();
	}
	else{
		$("#con_email").removeClass("Valid");
		$("#con_email").addClass("inValid");
		$("#invalid-email").show();
	}
});

function submit_contact(){
	var contact_name = $("#contact_name").val();
	var position = $("#position").val();
	var con_phone = $("#con_phone").val();
	var con_email = $("#con_email").val();
	var add_location = $("#add_location").val();
	
	if(contact_name == ''){
		$("#contact_name").addClass("inValid");
		$("#invalid-contact_name").show();
	}else{
		$("#contact_name").addClass("Valid");
		$("#contact_name").removeClass("inValid");
		$("#invalid-contact_name").hide();
	}
	
	if(position == ''){
		$("#position").addClass("inValid");
		$("#invalid-position").show();
	}else{
		$("#position").addClass("Valid");
		$("#position").removeClass("inValid");
		$("#invalid-position").hide();
	}
	
	if(con_phone == ''){
		$("#con_phone").addClass("inValid");
		$("#invalid-phone").show();
	}else{
		$("#con_phone").addClass("Valid");
		$("#con_phone").removeClass("inValid");
		$("#invalid-phone").hide();
	}
	
	if(con_email == ''){
		$("#con_email").addClass("inValid");
		$("#invalid-email").show();
	}else{
		$("#con_email").addClass("Valid");
		$("#con_email").removeClass("inValid");
		$("#invalid-email").hide();
	}
	
}
</script>