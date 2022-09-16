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
					<label class="form-label">Company Code<span style="color:red;"> *</span></label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control" name="code" value="${company.company_code}" required>  
                    </div>  
              </div>
         </div>
         <div class="col-sm-6 " style="margin-top:30px">
			<div class="form-group">
					<label class="form-label">Tax ID<span style="color:red;"> *</span></label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control" name="tax" value="${company.tax_number}" required>  
                    </div>  
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label class="form-label">Company Name EN<span style="color:red;"> *</span></label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control" name="name_en" value="${company.company_en }" required>  
                    </div>  
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label class="form-label">Company Name TH<span style="color:red;"> *</span></label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control" name="name_th" value="${company.company_th }" required>  
                    </div>  
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label class="form-label">Industry<span style="color:red;"> *</span></label> 
					<select class="form-control form-select select2" data-placeholder="Select" name="industry" required>
						<option label = "Select"></option>
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
					<label class="form-label">Status<span style="color:red;"> *</span></label> 
					<select class="form-control select2 form-select" data-placeholder="Select" name="status" required>
						<option label = "Select"></option>
						<option value="0" <c:if test="${company.status == 0}">selected</c:if>>Customers</option>
						<option value="1" <c:if test="${company.status == 1}">selected</c:if>>Partners</option>
						<option value="2" <c:if test="${company.status == 2}">selected</c:if>>Financial</option>
						<option value="3" <c:if test="${company.status == 3}">selected</c:if>>Legal</option>
						<option value="4" <c:if test="${company.status == 4}">selected</c:if>>Leadership and Peer Mentors</option>
						<option value="5" <c:if test="${company.status == 5}">selected</c:if>>Employees</option>
					</select> 
              </div>
         </div>
          <div class="col-sm-12 ">
			<div class="form-group">
					<label class="form-label">Website</label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control"  id="website" value="${company.website}">  
                    </div>  
              </div>
         </div>
         <div class="col-sm-2">
         	<label class="custom-control custom-checkbox">
               <input name="is_active" type="checkbox" class="custom-control-input" <c:if test ="${company.is_active == 1}">checked</c:if>><span class="form-label">&nbsp;Is_Active</span>
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
               		<div class="col-sm-3">${address.address_name}</div>
               		<div class="col-sm-8">${address.address}</div>
               		<div class="col-sm-1" style="text-align:right;">
               			<button class="btn text-danger btn-sm" onclick="delete_address('${address.company_address_id}',this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">
                     	<span class="fe fe-trash-2 fs-14"></span></button>
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
               		<div class="col-sm-2">${con.contact_name}&nbsp;<span>-</span>&nbsp;${con.position}</div>
               		<div class="col-sm-2"><i class="bi bi-telephone"></i>&nbsp;&nbsp;${con.phone}</div>
               		<div class="col-sm-4"><i class="ti-email"></i>&nbsp;&nbsp;${con.email}</div>
               		<div class="col-sm-3"><i class="ti-location-pin"></i>&nbsp;&nbsp;${con.address_location}</div>
          	     	<div class="col-sm-1" style="text-align:right;">
               		 <div class="g-2">
               			<a class="btn text-danger btn-sm" onclick="delete_contact('${con.company_contact_id}',this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">
                     	<span class="fe fe-trash-2 fs-14"></span></a>
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
           <ul class="list-group" id="gen_sales">
			<c:forEach var="sales" items="${salesList}">
               <li class="list-group-item">
               <div class="row">
             	<div class="col-sm-3">${sales.employee_id}&nbsp;<span>-</span>&nbsp;${sales.name_en}</div>
               		<div class="col-sm-3"><i class="bi bi-telephone"></i>&nbsp;&nbsp;${sales.phone}</div>
               		<div class="col-sm-5"><i class="ti-email"></i>&nbsp;&nbsp;${sales.email}</div>
          	     	<div class="col-sm-1" style="text-align:right;">
               		 <div class="g-2">
               			<a class="btn text-danger btn-sm" onclick="delete_sales('${sales.company_contact_id}',this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">
                     	<span class="fe fe-trash-2 fs-14"></span></a>
                     </div>
               		</div>      
               </div>
               </li>
              </c:forEach>
            </ul>
   </div>
	<div  style="text-align: left; margin-top: 1rem; margin-bottom: 1.5rem;">
		<button type="button" class="btn btn-primary" style="min-width: 5%;" data-bs-toggle="modal" data-bs-target="#SalesModal">Select Salesperson</button>
	</div>
	</div>
</div>

<div  style="text-align: right; margin-top: 1rem; margin-bottom: 1.5rem;">
	<a href="company_list" type="button" class="btn btn-default" style="min-width: 5%;">Cancel</a>
	<button  type="submit" class="btn btn-success" style="min-width: 5%;">Save</button>
</div>

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
							<input type="text" class="form-control" id="com_id_address" value="${company.company_id}">   
             			</div>
                    <div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">Address Name<span style="color:red;"> *</span></label> 
							<input type="text" class="form-control" id="address_name" required>   
             			</div>
         			</div>
         			<div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">Address<span style="color:red;"> *</span></label> 
							<textarea class="form-control" rows="4" id="address" required></textarea>   
             			</div>
         			</div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-bs-dismiss="modal">Cancel</button>
                    <button id="sub_address" class="btn btn-success" data-bs-dismiss="modal">Save changes</button>
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
                <div class="modal-body">
                		<div class="form-group" style="display:none">
							<input type="text" class="form-control" id="com_id_contact" value="${company.company_id}">   
             			</div>
                    <div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">Contact Name<span style="color:red;"> *</span></label> 
							<input type="text" class="form-control" id="contact_name" required>   
             			</div>
         			</div>
         			<div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">Position<span style="color:red;"> *</span></label> 
							<input type="text" class="form-control" id="position" required>   
             			</div>
         			</div>
         			<div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">Phone Number<span style="color:red;"> *</span></label> 
							<input type="text" class="form-control" id="con_phone" required>   
             			</div>
         			</div>
         			<div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">E-mail<span style="color:red;"> *</span></label> 
							<input type="text" class="form-control" id="con_email" required>   
             			</div>
         			</div>
         			<div class="col-sm-12">
						<div class="form-group">
							<label class="form-label">Address Location</label> 
							<select class="form-control select2 form-select" id="add_location" data-placeholder="Select" ></select>
             			</div>
         			</div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-bs-dismiss="modal">Cancel</button>
                    <button id="sub_contact" class="btn btn-success" data-bs-dismiss="modal">Save changes</button>
                </div>
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
	                    			<td class="emp_id">${emp.employee_id}</td>
	                    			<td><div class="sale_name_en">${emp.name_en}</div><div class="sale_name_th" style="display:none">${emp.name_th}</div></td>
	                    			<td class="sale_phone">${emp.phone}</td>
	                    			<td><div class="sale_email">${emp.email}</div><div class="sale_company_id" style="display:none">${company.company_id}</div></td>
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
	$(document).ready(function(){
		$("#sub_address").on('click',function(){
			var address_name = $("#address_name").val();
			var address = document.getElementById("address").value;
			var id = $("#com_id_address").val();
			
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
		            	let text = '<li class="list-group-item test">'+
						'<div class="row">'+
						'<div class="col-sm-3">'+data.address_name+'</div>'+
						'<div class="col-sm-8">'+data.address+'</div>'+
						'<div class="col-sm-1" style="text-align:right;">'+
       					'<button class="btn text-danger btn-sm" onclick="delete_address('+data.company_address_id+',this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">'+
             			'<span class="fe fe-trash-2 fs-14"></span></button>'+
       					'</div>'+
       					'</div>'+
       					'</li>';
					$("#gen_address").append(text);
		            }
					})
			}
		})
	})
	})
</script>
<script>
	$(document).ready(function(){
		$("#sub_contact").on('click',function(){
			var contact_name = $("#contact_name").val();
			var position = $("#position").val();
			var con_phone = $("#con_phone").val();
			var con_email = $("#con_email").val();
			var add_location = $("#add_location").val();
			var id = $("#com_id_contact").val();
			console.log(contact_name);
			console.log(position);
			console.log(con_phone);
			console.log(con_email);
			console.log(add_location);
			
			$.ajax({
				url: "add_contact" ,
				type: "JSON",
				method: "POST",
				data:{
						"contact_name" : contact_name,
						"position" : position,
						"con_phone" : con_phone,
						"con_email" : con_email,
						"add_location" : add_location,
						"id" : id
				},
				success:function(data){
				console.log(data)
				swal({
						title: "SUCCESS",
		            	text: "Your information has been succesfully save",
		            	type: "success",
				}, function(inputValue) {
		            if (inputValue != "") {
		            	let text = '<li class="list-group-item test del">'+
						'<div class="row">'+
						'<div class="col-sm-2">'+data.contact_name+'&nbsp;<span>-</span>&nbsp;'+data.position+'</div>'+
	               		'<div class="col-sm-2"><i class="bi bi-telephone"></i>&nbsp;&nbsp;'+data.phone+'</div>'+
	               		'<div class="col-sm-4"><i class="ti-email"></i>&nbsp;&nbsp;'+data.email+'</div>'+
	               		'<div class="col-sm-3"><i class="ti-location-pin"></i>&nbsp;&nbsp;'+data.address_location+'</div>'+
						'<div class="col-sm-1" style="text-align:right;">'+
	   					'<a class="btn text-danger btn-sm" onclick="delete_contact('+data.company_contact_id+',this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">'+
	         			'<span class="fe fe-trash-2 fs-14"></span></a>'+
	   					'</div>'+
	   					'</div>'+
	   					'</li>';
						$("#gen_contact").append(text);
		            }
					})
				}
			})
		})
	});
</script>
<script>
$(document).ready(function(){
	$("#clear_address").on('click',function(){
		var address_name = $("#address_name").val('');
		var address = document.getElementById("address").value = "";
	});
	$("#clear_contact").on('click',function(){
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
})
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
                				"id" : id
                		},
                		success:function(data){
                			console.log(data);
                			currentEl.parentNode.parentNode.parentNode.remove();
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
            			currentEl.parentNode.parentNode.parentNode.remove();
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
            			currentEl.parentNode.parentNode.parentNode.remove();
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
	var checks = document.querySelectorAll(".chk");
	var max = 3;
	for (var i = 0; i < checks.length; i++)
	  checks[i].onclick = selectiveCheck;
	function selectiveCheck (event) {
	  var checkedChecks = document.querySelectorAll(".chk:checked");
	  if (checkedChecks.length >= max + 1)
	    return false;
	}
})
</script>
<script>
function selectSale(){
	var getSaleList = []
$('#myTable tr').each(function() {
    $(this).find(".chk:checked").each(function() {
        let values = { 'employee_id' :  $(this).closest("tr").find('td.emp_id').text(),'name_en' :  $(this).closest("tr").find('div.sale_name_en').text(),
        				'name_th' :  $(this).closest("tr").find('div.sale_name_th').text(), 'phone' :  $(this).closest("tr").find('td.sale_phone').text(),
        				'email' :  $(this).closest("tr").find('div.sale_email').text() , 'company_id' : $(this).closest("tr").find('div.sale_company_id').text()}
        getSaleList.push(values);
    });
});
    console.log(getSaleList.length);
    console.log(getSaleList[0].employee_id);
    $.ajax({
    	url : 'add_sales',
    	typr: 'JSON',
    	method: 'POST',
    	data: {
    				"value" : JSON.stringify(getSaleList)
    	},
    	success:function(data){
    		console.log(data[0]);
			swal({
				title: "SUCCESS",
            	text: "Your information has been succesfully save",
            	type: "success",
		}, function(inputValue) {
            if (inputValue != "") {
		let text = '';
		for(var i=0; i<getSaleList.length;i++){
            	text += '<li class="list-group-item test del">'+
						'<div class="row">'+
						'<div class="col-sm-3">'+getSaleList[i].employee_id+'&nbsp;<span>-</span>&nbsp;'+getSaleList[i].name_en+'</div>'+
           				'<div class="col-sm-3"><i class="bi bi-telephone"></i>&nbsp;&nbsp;'+getSaleList[i].phone+'</div>'+
           				'<div class="col-sm-5"><i class="ti-email"></i>&nbsp;&nbsp;'+getSaleList[i].email+'</div>'+
						'<div class="col-sm-1" style="text-align:right;">'+
						'<a class="btn text-danger btn-sm" onclick="delete_sales('+data[i]+',this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">'+
     					'<span class="fe fe-trash-2 fs-14"></span></a>'+
					'</div>'+
					'</div>'+
					'</li>';
				}
			$("#gen_sales").append(text);
            }
			})
    	}
    })
}
</script>