<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
   

    
<script>
			
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
</script>
<style>
	#customerTable tr.content{
	cursor: pointer;
	
}
tr{    
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 2s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}
li.animate{    
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

.head-ml{
	margin-left: -10px;
}

</style>

<!-- PAGE-HEADER -->
<div class="page-header">
    <h1 class="page-title">Quotation Add</h1>
    <div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0)">Quotation</a></li>
            <li class="breadcrumb-item active" aria-current="page">Quotation Add</li>
        </ol>
    </div>
</div>
<!-- PAGE-HEADER END -->
<div class="row row-cards">
	<div class="col-lg-12 col-xl-12">
		<div class="card">
			<div class="card-header">
				<div class="card-title">Quotation Info</div>
				<div class="card-options"><span class="badge bg-primary-transparent rounded-pill text-info p-2 px-3">In Progress</span></div>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<div class="mb-2">Quotation ID<span class="text-red"> *</span></div>
	                   		<input type="text" class="form-control" id="quID" placeholder="">
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-3">
                   		<div class="form-group">
	                   		<div class="mb-2">Create date<span class="text-red"> *</span></div>
	                           <div class="input-group">
	                              <input class="form-control fc-datepicker" id="start" placeholder="Select date" type="text">
	                               <div class="input-group-text">
	                                    <i class="fa fa-calendar tx-16 lh-0 op-6"></i>
	                               </div>
	                           </div>
                        </div>
                	</div>
                	<div class="col-sm-6 col-md-3">
                   		<div class="form-group">
	                   		<div class="mb-2">Due date<span class="text-red"> *</span></div>
	                           <div class="input-group">
	                               <input class="form-control fc-datepicker" id="end" placeholder="Select date" type="text">
	                               <div class="input-group-text">
	                                    <i class="fa fa-calendar tx-16 lh-0 op-6"></i>
	                               </div>
	                           </div>
                        </div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<div class="mb-2">Customer Name<span class="text-red"> *</span></div>
	                    	<div class="input-group">
		                   		<input type="text" class="form-control" id="customer" data-bs-toggle="modal" data-bs-target="#CustomerNameModal" readonly>
		                   		<div class="input-group-text" style="cursor: pointer;" data-bs-toggle="modal"  data-bs-target="#CustomerNameModal">
		                   			<i class="bi bi-search tx-16 lh-0 op-6"></i>
		                   		</div>
	                   	</div>	
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<div class="mb-2">Tax ID<span class="text-red"> *</span></div>
	                   		<input type="text" class="form-control" id="taxID" placeholder="">
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<div class="mb-2">Contact Name<span class="text-red"> *</span></div>
	                   		<select  class="form-control form-select select2" id="contact" data-bs-placeholder="Select Customer">
	                            <option value="br">Brazil</option>
	                            <option value="cz">Czech Republic</option>
	                            <option value="de">Germany</option>
	                            <option value="pl" selected>Poland</option>
                            </select>
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<div class="mb-2">email<span class="text-red"> *</span></div>
	                   		<input type="text" class="form-control" id="email" placeholder="">
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<div class="mb-2">phone number 1<span class="text-red"> *</span></div>
	                   		<input type="text" class="form-control" id="phone1" placeholder="">
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<div class="mb-2">phone number 2</div>
	                   		<input type="text" class="form-control" id="phone2" placeholder="">
                    	</div>
                	</div>
                </div>
			</div>
		</div>
		<!-- MODAL CUSTOMER NAME -->
		<div class="modal fade" id="CustomerNameModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-xl " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Select Address</h5>
                    <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                    	<table class="table table-bordered text-nowrap table-hover border-bottom dataTable no-footer companyTable" id="customerTable">
	                    	<thead>
	                    		<tr>
	                    			<th style="text-align:center">#</th>
	                    			<th>Company Name</th>
	                    			<th>Company Code</th>
	                    			<th>Status</th>
	                    			<th>Is Active</th>
	                    		</tr>
	                    	</thead>
	                    	<tbody>
	                    		<tr data-bs-dismiss="modal" class="content" value="Branch">
	                    			<td></td>
	                    			<td>Branch</td>
	                    			<td>1691</td>
	                    			<td>Customer</td>
	                    			<td>
	                    				<label class="custom-control custom-checkbox">
		                                        <input type="checkbox" class="custom-control-input" name="example-checkbox1" value="option1" >
		                                        <span class="custom-control-label"></span>
	                                    </label>
	                                 </td>
	                    		</tr>
	                    		<tr data-bs-dismiss="modal" class="content" value="Main Branch">
	                    			<td></td>
	                    			<td>Main Branch</td>
	                    			<td>1691</td>
	                    			<td>Customer</td>
	                    			<td>
	                    				<label class="custom-control custom-checkbox">
		                                        <input type="checkbox" class="custom-control-input" name="example-checkbox1" value="option1" >
		                                        <span class="custom-control-label"></span>
	                                    </label>
	                                 </td>
	                    		</tr>
	                    	</tbody>
                    	</table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-bs-dismiss="modal">Close</button>
                    <button class="btn btn-success" >Save changes</button>
                </div>
            </div>
        </div>
    </div>
		<!--END MODAL CUSTOMER NAME  -->
		<!-- Address  -->
		<div class="card">
			<div class="card-header">
				<div class="card-title">Customer Address</div>
			</div>
			<div class="card-body">
           <ul class="list-group" id="address-ul">
               <!--  <li class="list-group-item">
               <div class="row">
                       <div class="col-sm-6 col-md-3">
                        Address Name 1
                       </div>
                       <div class="col-sm-6 col-md-8">
                           160/170-2 อาคารไอทีเอฟ-สีลมพาเลส ชั้น 13 ถนนสีลม แขวงสุริยวงศ์ เขตบางรัก กรุงเทพมหานคร 10500
                       </div>
                       <div class="col-sm-6 col-md-1" style="text-align:right;">
                           <button class="btn text-danger btn-sm" onclick="DeleteAddress(this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">
                         <span class="fe fe-trash-2 fs-14"></span></button>
                       </div>
                       <div class="col-sm-6 col-md-3 mt-4">
                        	<label class="custom-control custom-checkbox">
                                  <input type="checkbox" class="custom-control-input" name="example-checkbox5" value="option5" >
                                  <span class="custom-control-label">Delivery Address</span>
                            </label>
                       </div>
               </div>
               </li>
               <li class="list-group-item">
               <div class="row">
                       <div class="col-sm-6 col-md-3">
                        Address Name 2
                       </div>
                       <div class="col-sm-6 col-md-8">
                           160/170-2 อาคารไอทีเอฟ-สีลมพาเลส ชั้น 13 ถนนสีลม แขวงสุริยวงศ์ เขตบางรัก กรุงเทพมหานคร 10500
                       </div>
                       <div class="col-sm-6 col-md-1" style="text-align:right;">
                           <button class="btn text-danger btn-sm" onclick="DeleteAddress(this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">
                         <span class="fe fe-trash-2 fs-14"></span></button>
                       </div>
                       <div class="col-sm-6 col-md-3 mt-4">
                        	<label class="custom-control custom-checkbox">
                                  <input type="checkbox" class="custom-control-input" name="example-checkbox5" value="option5" >
                                  <span class="custom-control-label">Delivery Address</span>
                            </label>
                       </div>
               </div>
               </li>-->
            </ul>
   
				
				<button type="button" class="btn btn-primary mt-4" data-bs-toggle="modal" data-bs-target="#largemodal">Select Address</button>
			</div>
		</div>
		<!-- MODAL ADDRESS -->
		<div class="modal fade" id="largemodal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-xl " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Select Address</h5>
                    <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                    	<table class="table table-bordered text-nowrap border-bottom dataTable no-footer myTable" id="">
	                    	<thead>
	                    		<tr>
	                    			<th style="width:10%">#</th>
	                    			<th style="width:30%">Company Name</th>
	                    			<th style="width:60%">Address</th>
	                    		</tr>
	                    	</thead>
	                    	<tbody id="getAddress">
	                    		<tr>
	                    			<td>
	                    				<label class="custom-control custom-checkbox">
                                              <input type="checkbox" class="custom-control-input checkbox-tick" name="example-checkbox5" value="option5" >
                                              <span class="custom-control-label"></span>
                                        </label>
	                    			</td>
	                    			<td class="name">Main Branch</td>
	                    			<td class="address">1691 ถ. พหลโยธิน แขวงจตุจักร เขตจตุจักร กรุงเทพมหานคร 10900</td>
	                    		</tr>
	                    		<tr>
	                    			<td>
		                    			<div>
		                    				<label class="custom-control custom-checkbox">
		                                        <input type="checkbox" class="custom-control-input checkbox-tick" name="example-checkbox1" value="option1" >
		                                        <span class="custom-control-label"></span>
	                                        </label>
	                                    </div>   
	                    			</td>
	                    			<td class="name">Branch</td>
	                    			<td class="address">1691 ถ. พหลโยธิน แขวงจตุจักร เขตจตุจักร กรุงเทพมหานคร 10900</td>
	                    		</tr>
	                    	</tbody>
                    	</table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-bs-dismiss="modal">Close</button>
                    <button class="btn btn-success" onclick="selectAddress()" data-bs-dismiss="modal">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <!-- END MODAL ADDRESS -->
		
		<!-- Sale -->
		<div class="card">
			<div class="card-header">
				<div class="card-title">Sales Person</div>
			</div>
			<div class="card-body">
				 <ul class="list-group" id="sale-ul">
               <!--  <li class="list-group-item">
               <div class="row">
                       <div class="col-sm-6 col-md-4">
                        User ID - User Name
                       </div>
                       <div class="col-sm-6 col-md-3">
                           <i class="bi bi-telephone"></i>&nbsp;&nbsp;088-647-9899
                       </div>
                       <div class="col-sm-6 col-md-4">
                           <i class="fa fa-envelope-o"></i>&nbsp;&nbsp;testtesdata_1122439@CubeSoftech.com
                       </div>
                       <div class="col-sm-6 col-md-1" style="text-align:right;">
                           <button class="btn text-danger btn-sm" onclick="DeleteSale(this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">
                         <span class="fe fe-trash-2 fs-14"></span></button>
                       </div>
               </div>
               </li>
               <li class="list-group-item">
               <div class="row">
                       <div class="col-sm-6 col-md-4">
                        User ID - User Name
                       </div>
                       <div class="col-sm-6 col-md-3">
                           <i class="bi bi-telephone"></i>&nbsp;&nbsp;088-647-9899
                       </div>
                       <div class="col-sm-6 col-md-4">
                           <i class="fa fa-envelope-o"></i>&nbsp;&nbsp;testtesdata_1122439@CubeSoftech.com
                       </div>
                       <div class="col-sm-6 col-md-1" style="text-align:right;">
                           <button class="btn text-danger btn-sm" onclick="DeleteSale(this)"  data-bs-toggle="tooltip" data-bs-original-title="Delete">
                         <span class="fe fe-trash-2 fs-14"></span></button>
                       </div>
               </div>
               </li>-->
            </ul>
				
				<button type="button" class="btn btn-primary mt-4" data-bs-toggle="modal" data-bs-target="#salesModal">Select Sale Person</button>
			</div>
		</div>
		<!-- MODAL SALES -->
		<div class="modal fade" id="salesModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-xl " role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Select Sales</h5>
                    <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                    	<table class="table table-bordered text-nowrap border-bottom dataTable no-footer myTable" id="">
	                    	<thead>
	                    		<tr>
	                    			<th>#</th>
	                    			<th>Employee ID</th>
	                    			<th>Employee Name</th>
	                    			<th>Phone Number</th>
	                    			<th>E-mail</th>
	                    		</tr>
	                    	</thead>
	                    	<tbody id="getSale">
	                    		<tr>
	                    			<td >
	                    				<label class="custom-control custom-checkbox">
	                                        <input type="checkbox" class="custom-control-input checkbox-tick" name="example-checkbox1" value="option1" >
	                                        <span class="custom-control-label"></span>
                                        </label>
	                    			</td>
	                    			<td class="emp_id">A001</td>
	                    			<td class="sale_name">Tester Test</td>
	                    			<td class="sale_phone">088-888-8888</td>
	                    			<td class="sale_email">tester_test01@tester.com</td>
	                    		</tr>
	                    		<tr>
	                    			<td style="text-align:center">
	                    				<label class="custom-control custom-checkbox">
	                                        <input type="checkbox" class="custom-control-input checkbox-tick" name="example-checkbox1" value="option1" >
	                                        <span class="custom-control-label"></span>
                                        </label>
	                    			</td>
	                    			<td class="emp_id">A002</td>
	                    			<td class="sale_name">Tester Test2</td>
	                    			<td class="sale_phone">099-999-9999</td>
	                    			<td class="sale_email">tester_test02@tester.com</td>
	                    		</tr>
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
    <!-- END MODAL SALES -->
		<!-- order -->
		<div class="card">
			<div class="card-header">
				<div class="card-title">Order</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
				<c:set var="counter" value="${counter+1}"></c:set>
					<table id="table1" class="table table-bordered text-nowrap border-bottom order-list">
						<thead>
							<tr>
								<th style="width:5%">#</th>
								<th style="width:20%">Product Name</th>
								<th style="width:30%">Description</th>
								<th style="width:10%">Quantity</th>
								<th style="width:15%">Unit Price</th>
								<th style="width:15%">Total</th>
								<th style="width:5%"></th>
							</tr>
						</thead>
						<tbody>
							<tr class="row_product">
								<td>${counter}</td>
								<td><input type="text" class="form-control"  name="product_name" placeholder=""></td>
								<td><textarea rows="2" cols="" class="form-control mb-4" name="description"></textarea></td>
								<td><input type="number" class="form-control  quantity-${counter}" placeholder="" onkeyup="calculatePrice('${counter}')" onchange="calculatePrice('${counter}')" name="quantity"></td>
								<td><input type="text" class="form-control unit_price-${counter}" placeholder="" onkeyup="calculatePrice('${counter}')" name="unit_price"></td>
								<td><input type="text" class="form-control total-${counter} sub-total" placeholder="" name="total"></td>
								<td>
									<button class="btn text-danger btn-sm" data-bs-toggle="tooltip" onclick="deleteRow(this)" data-bs-original-title="Delete">
                         			<span class="fe fe-trash-2 fs-14"></span></button>
                         	    </td>
							</tr>
						</tbody>
					</table>
					<a href="javascript:void(0)" type="button" title="" class="add-author btn btn-primary">Add Product</a>
				</div>
				<div class="row">
					<div class="col-sm-6 col-md-6 mt-5">
						<div class="form-group">
	                    	<div class="mb-2">Description</div>
	                   		<textarea rows="4" cols="" class="form-control mb-4" id="description"></textarea>
                    	</div>
					</div>
					<div class="col-sm-6 col-md-6 mt-5">
						<div class="row">
			                <div class="col-sm-6 col-md-6" style="text-align:right;align-self: center;">sub total</div>
			                <div class=" col-sm-6 col-md-6 mb-2">
			                <input type="text" class="form-control" id="sub-total" placeholder="">
			                </div>
			                
			                
			                <div class="col-sm-6 col-md-3" style="text-align:right;align-self: center;">ส่วนลด</div>
				            <div class=" col-sm-6 col-md-3">
                                   <div class="input-group">
                                         <input type="text" id="dc-percent" class="form-control" >
                                         <span class="input-group-text" id="basic-addon2">%</span>
                                   </div>
                            </div>
                            <div class=" col-sm-6 col-md-6 mb-2">            
			                <input type="text" class="form-control" id="discount" placeholder="">
			                </div>
			                
			                <div class="col-sm-6 col-md-6" style="text-align:right;align-self: center;">ราคารวมส่วนลด</div>
			                <div class=" col-sm-6 col-md-6 mb-2">
			                <input type="text" class="form-control" id="sum-discount" placeholder="">
			                </div>
			                
			                
			                <div class="col-sm-6 col-md-6" style="text-align:right;align-self: center;">การคำนวนภาษี</div>
			                <div class="col-sm-6 col-md-6 mb-2 ">
                                  <select class="form-control form-select form-select select2" id="inputGroupSelect01" >
                                       <option value="1" id="sum-vat" selected>ราคารวมภาษี</option>
                                       <option value="2" id="no-sumvat">ราคาแยกภาษี</option>
                                       <option value="3" id="no-vat">ไม่คำนวนภาษี</option>
                                  </select>   
                            </div>
                            
                            <div class="col-sm-6 col-md-3" style="text-align:right;align-self: center;">อัตราภาษี</div>
				            <div class=" col-sm-6 col-md-3">
                                   <div class="input-group">
                                          <input type="text" class="form-control" id="VAT">
                                         <span class="input-group-text" id="basic-addon2">%</span>
                                  </div>
                            </div>
                            <div class=" col-sm-6 col-md-6 mb-2">            
			                <input type="text" class="form-control " placeholder="" id="totalVAT">
			                </div>
			                
			                 <div class="col-sm-6 col-md-6" style="text-align:right;align-self: center;">grand total</div>
			                <div class=" col-sm-6 col-md-6 mb-2">
			                <input type="text" class="form-control " placeholder="" id="grand_total">
			                </div>
			            </div>	
					</div>
				</div>
			</div>
		</div>
		<!-- BUTTON -->
			<div  style="text-align: right; margin-top: 0.5rem; margin-bottom: 1.5rem;">
				<a href="#" type="button" class="btn btn-default" style="min-width: 5%;">Cancel</a>
				<button  type="button" class="btn btn-success" onclick="send_data()" style="min-width: 5%;">Save</button>
				<button  type="button" class="btn btn-primary" style="min-width: 5%;" onclick="getCustomerAddressData()">Send Approve</button>
			</div>
	</div>
</div>
<script>
/*-------------------check address for send----------------------------*/
/*function addressForSend(){
	var sw = document.querySelector('#checkAddress');
	console.log(sw.checked);
	if(sw.checked){
		$(".addressHide").hide();
	}else{
		$(".addressHide").show();
	}
}
$(document).ready(function(){
	$(".addressHide").hide();
	addressForSend();
	$("#browser").on("change",function(){
		var uu = $("#browser").val();
		console.log(uu);
	})
});*/

</script>
 <script>
 /*---------------------  Order Table  -------------------------------*/
 var counter = 1;
 jQuery('a.add-author').click(function(event){
     event.preventDefault();
     counter++;
     var newRow = jQuery('<tr class="row_product"><td>'+counter+'</td><td><input type="text" class="form-control" name="product_name" placeholder=""' +
          '/></td><td><textarea rows="2" cols="" class="form-control mb-4" name="description"></textarea>' +
          '</td><td><input type="number" class="form-control quantity-'+counter+'" name="quantity" onkeyup="calculatePrice('+counter+')" onchange="calculatePrice('+counter+')"></td>'+
          '<td><input type="text" class="form-control unit_price-'+counter+'"  name="unit_price" onkeyup="calculatePrice('+counter+')"></td>'+
          '<td><input type="text" class="form-control total-'+counter+' sub-total" name="total" placeholder=""></td>'+
          '<td><button class="btn text-danger btn-sm" data-bs-toggle="tooltip" onclick="deleteRow(this)" data-bs-original-title="Delete"><span class="fe fe-trash-2 fs-14"></span></button></td>');
			
     jQuery('table.order-list').append(newRow);
 });
 

function deleteRow(r) {
	//console.log(r);
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("table1").deleteRow(i);
}

</script>
<script>
function calculatePrice(counter){
	//console.log(counter);
	const sumVAT = document.querySelector('#sum-vat');
	const nosumVAT = document.querySelector('#no-sumvat');
	const noVAT = document.querySelector('#no-vat');
	
	var sub_total = 0;
	var qua = $('.quantity-'+counter).val();
	//console.log(qua);
	var price = $('.unit_price-'+counter).val();
	//console.log(price);
	var v1 = parseFloat(qua);
	var v2 = parseFloat(price);
	var result = v1 * v2;
	
	//console.log('total: '+result);
	if(isNaN(result)){
		$('.total-'+counter).val('');
	}else{
		 $('.total-'+counter).val(result);
	}
	
	 $(".sub-total").each(function() {
	      if ($(this).val() != '') {
	    	  sub_total = sub_total + parseFloat($(this).val());
	    }
	  });   
	 //console.log(sub_total);
	 $("#sub-total").val(sub_total);
	 calculateDiscount();
	 priceSumDiscount();
	 if(sumVAT.selected){
			$("#VAT").on("keyup",function(){
				enterVat();
				grand_total_sumVAT();
			});
			enterVat();
			grand_total_sumVAT();
		}
	 if(nosumVAT.selected){
		 //console.log("true");
		 $("#VAT").on("keyup",function(){
				enterVat();
				var grand = priceSumDiscount(); 
				$("#grand_total").val(grand);
				console.log(grand);
			});
		 enterVat();
		 var grand = priceSumDiscount(); 
		 $("#grand_total").val(grand);
		 console.log(grand);
	 }
}

function calculateDiscount(){
	var aa = $("#sub-total").val();
	var sub = parseFloat(aa);
	//console.log(aa);
	var ss = $("#dc-percent").val();
	var discount = parseFloat(ss);
	var result = 0;
	if(ss != ''){
		result = (sub * discount)/100;
		//console.log(result);
		$("#discount").val(result);
	}
}

function priceSumDiscount(){
	var rr = $("#sub-total").val();
	//console.log(rr);
	var sub_total = parseFloat(rr);
	var ww = $("#discount").val();
	//console.log(ww);
	var discount = parseFloat(ww);
	var sum = sub_total - discount;
	//console.log(sum);
	if(isNaN(sum)){
		$("#sum-discount").val(sub_total);
	}else{
		$("#sum-discount").val(sum);
	}
}

$('#dc-percent').on("keyup",function(){
	var pc = $('#dc-percent').val();
	var sub = $("#sub-total").val();
	var percent = parseFloat(pc);
	var sub_total = parseFloat(sub);
	var discount = (sub_total * percent)/100 ; 
	//console.log(discount);
	if(isNaN(discount)){
		$("#discount").val('');
	}else{
		$("#discount").val(discount);
	}
	priceSumDiscount();
	grand_total_sumVAT();
});

/*$(document).ready(function(){
	const sumVAT = document.querySelector('#sum-vat');
	const nosumVAT = document.querySelector('#no-sumvat');
	const noVAT = document.querySelector('#no-vat');
	
	if(sumVAT.selected){
	
	}
});*/

function enterVat(){
		var pc = $("#VAT").val();
		//console.log(pc);
		var percent = parseFloat(pc);
		var dc = $("#sum-discount").val();
		//console.log(dc);
		var discount = parseFloat(dc);
		var vat = (discount * percent)/100;
		//console.log(vat);
		if(isNaN(vat)){
			$("#totalVAT").val('');
		}else{
			$("#totalVAT").val(vat);
		}
	
}

function grand_total_sumVAT(){
	var sd = $("#sum-discount").val();
	var sum_discount = parseFloat(sd);
	var vat = $("#totalVAT").val();
	var sum_vat = parseFloat(vat);
	var grand_total = sum_discount + sum_vat;
	console.log(grand_total);
	if(isNaN(grand_total)){
		$("#grand_total").val(sum_discount);
	}else{
		$("#grand_total").val(grand_total);
	}
	
}


</script>


<script>
/*----------------------------  MODAL TABLE SALES, ADDRESS -----------------------------------------------*/
$(document).ready(function(){
var t = $('.myTable').DataTable({
     "bPaginate": true,
      "bLengthChange": true,
      "bFilter": true,
      "bInfo": true,
      "bAutoWidth": true,
        language: {
            search: " ",
            searchPlaceholder: "Search..." 
           } 
    });
});
</script>
<script>
/*----------------------------------- MODAL CUSTOMER TABLE----------------------------------------------------*/
$(document).ready(function(){
var t = $('.companyTable').DataTable({
     "bPaginate": true,
      "bLengthChange": true,
      "bFilter": true,
      "bInfo": true,
      "bAutoWidth": true,
        language: {
            search: " ",
            searchPlaceholder: "Search..." 
           } ,
        columnDefs: [
            {
                searchable: false,
                orderable: true,
                targets: 0,
            },
        ],
        order: [[1, 'asc']],
    });
 
    t.on('order.dt search.dt', function () {
        let i = 1;
 
        t.cells(null, 0, { search: 'applied', order: 'applied' }).every(function (cell) {
            this.data(i++);
        });
    }).draw();
    
    //$('div#DataTables_Table_2_filter').prepend('<div class="row" id="test1"></div>');
    //$("label ").prependTo("#destination");
});
</script>
<script>
/*------------------------ GET DATA FROM PAGE----------------------------------------*/
 
 $("#customerTable").on('click','tr',function(e){
	    e.preventDefault();
	    customer = $(this).attr('value');
	    //console.log(customer);
	    $("#customer").val(customer);
		});
 
 function send_data(){
	var id = $("#quID").val();  console.log(id);
	var start = $("#start").val();  console.log(start);
	var end = $("#end").val();  console.log(end);
	var tax = $("#taxID").val();  console.log(tax);
	var contact = $("#contact").val();  console.log(contact);
	var email = $("#email").val();  console.log(email);
	var phone1 = $("#phone1").val();  console.log(phone1);
	var phone2 = $("#phone2").val();  console.log(phone2);
	var customer = $("#customer").val();  console.log(customer);
	var order = getValueTable();  console.log(order);
	var sale = getSaleData();  console.log(sale); 
	var address = getCustomerAddressData();  console.log(address);
	var description = $("#description").val();  console.log(description);
	var sub_total = $("#sub-total").val();  console.log(sub_total);
	var dc_percent = $("#dc-percent").val();  console.log(dc_percent);
	var discount = $("#discount").val();  console.log(discount);
	var sum_discount = $("#sum-discount").val();  console.log(sum_discount);
	var tax_type = $("#inputGroupSelect01").val();  console.log(tax_type);
	var vat = $("#VAT").val();  console.log(vat);
	var total_vat = $("#totalVAT").val();  console.log(total_vat);
	var grand_total = $("#grand_total").val();  console.log(grand_total);
	
	$.ajax({
		url:"saveQuotation",
		type:"JSON",
		method:"POST",
		data:{
			"id":id,
			"start":start,
			"end":end,
			"tax":tax,
			"contact":contact,
			"email":email,
			"phone1":phone1,
			"phone2":phone2,
			"customer":customer,
			"orderList":JSON.stringify(order),
			"saleList":JSON.stringify(sale),
			"addressList":JSON.stringify(address),
			"description":description,
			"sub_total":sub_total,
			"dc_percent":dc_percent,
			"discount":discount,
			"sum_discount":sum_discount,
			"tax_type":tax_type,
			"vat":vat,
			"total_vat":total_vat,
			"grand_total":grand_total
		},
		success:function(data){
			console.log("hello world");
		}
	})
}
</script>
<script>
/*-----------------------   DELETE ADDRESS, SALE <li>  ------------------------------------*/
function DeleteAddress(currentEl){
	  //console.log(currentEl.parentNode.parentNode.parentNode);
	  //currentEl.parentNode.parentNode.removeChild(currentEl.parentNode);
	  currentEl.parentNode.parentNode.parentNode.remove();
	  }	

function DeleteSale(currentEl){
	//console.log(currentEl.parentNode.parentNode.parentNode);
	currentEl.parentNode.parentNode.parentNode.remove();
}

</script>
<script>
/*----------------generate list of Address--------------------------*/
function selectAddress(){
	let getAddressList = [];
	const ul = document.getElementById('address-ul');
	//console.log(ul);
	$('#getAddress tr').each(function() {
		$(this).find(".checkbox-tick:checked").each(function() {
			let values = { 'address_name' :  $(this).closest("tr").find('td.name').text(),'address_detail' :  $(this).closest("tr").find('td.address').text() }
			getAddressList.push(values);
		});
	});
	console.log(getAddressList);
	//console.log(getAddressList[0].address_name);
	let li = '';
	for(let i = 0; i < getAddressList.length; i++){
		li +=  '<li class="list-group-item animate ">'+
               '<div class="row">'+
               '<div class="col-sm-6 col-md-3 data_address_name">'+
                getAddressList[i].address_name + 
                '</div>'+
                '<div class="col-sm-6 col-md-8 data_address_detail" >'+
                   getAddressList[i].address_detail +
                '</div>'+
                '<div class="col-sm-6 col-md-1" style="text-align:right;">'+
                '<button class="btn text-danger btn-sm" onclick="DeleteAddress(this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">'+
                '<span class="fe fe-trash-2 fs-14"></span></button>'+
                '</div>'+
                '<div class="col-sm-6 col-md-3 mt-4">'+
                '<label class="custom-control custom-checkbox">'+
                '<input type="checkbox" class="custom-control-input" name="example-checkbox5" value="option5" checked>'+
                '<span class="custom-control-label">Delivery Address</span>'+
                '</label>'+
                '</div>'+
                '</div>'+
                '</li>';
	}
	//console.log(li);
	ul.innerHTML = li;
}
</script>
<script>
/*----------------generate list of Sale--------------------------*/
 function selectSale(){
	 let getSaleList = [];
	 const ul = document.getElementById('sale-ul');
	 $('#getSale tr').each(function() {
			$(this).find(".checkbox-tick:checked").each(function() {
				let values = { 'employee_id' :  $(this).closest("tr").find('td.emp_id').text(),'name' :  $(this).closest("tr").find('td.sale_name').text(),
						       'phone' :  $(this).closest("tr").find('td.sale_phone').text(),'email' :  $(this).closest("tr").find('td.sale_email').text()}
				getSaleList.push(values);
			});
		});
	 //console.log(getSaleList);
	 let li = '';
	 for(let i = 0; i < getSaleList.length;i++){
		 li +=  '<li class="list-group-item animate">'+
         		'<div class="row">'+
        		'<div class="col-sm-6 col-md-4 ">'+
          		'<span class="data_employee_id">'+getSaleList[i].employee_id+'</span>' +'-'+ '<span class="data_employee_name">'+getSaleList[i].name+'</span>' +
         		'</div>'+
         		'<div class="col-sm-6 col-md-3 data_phone">'+
             	'<i class="bi bi-telephone"></i>&nbsp;&nbsp;'+getSaleList[i].phone+
         		'</div>'+
         		'<div class="col-sm-6 col-md-4 data_email">'+
             	'<i class="fa fa-envelope-o"></i>&nbsp;&nbsp;'+getSaleList[i].email+
         		'</div>'+
         		'<div class="col-sm-6 col-md-1" style="text-align:right;">'+
             	'<button class="btn text-danger btn-sm" onclick="DeleteSale(this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">'+
           		'<span class="fe fe-trash-2 fs-14"></span></button>'+
         		'</div>'+
 				'</div>'+
 				'</li>';
	 }
	 ul.innerHTML = li;
}
</script>
<script>
function getValueTable(){
/*var values = [];
$("#table1 tr").each((_, row) => {
  var value = {};
  $(row).find(":input").each((__, e) =>
    value[e.name] = $(e).val()
  );
  values.push(value);
});
console.log(values)*/
var values = $("#table1 tr.row_product").map((_, row) => {
	  var value = {};
	  $(row).find(":input").each((__, e) =>
	    value[e.name] = $(e).val()
	  );
	  return value;
	}).toArray();
	//values = values.filter(item => item);
	//console.log(values);
	return values;
}
</script>
<script>
function getCustomerAddressData(){
	let getDataAddressList = [];
	$('#address-ul li').each(function() {
			let values = { 'address_name' :  $(this).find('div.data_address_name').text(),'address_detail' :  $(this).find('div.data_address_detail').text() }
			getDataAddressList.push(values);
	});
	//console.log(getDataAddressList);
	return getDataAddressList;
	
}

function getSaleData(){
	let getDataSaleList = [];
	$('#sale-ul li').each(function() {
			let values = { 'employee_id' :  $(this).find('span.data_employee_id').text(),'employee_name' :  $(this).find('span.data_employee_name').text(),
					       'phone' :  $(this).find('div.data_phone').text(),'email' :  $(this).find('div.data_email').text()}
			getDataSaleList.push(values);
	});
	//console.log(getDataSaleList);
	return getDataSaleList;
}

</script>
