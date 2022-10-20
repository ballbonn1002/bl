<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="/assets/js/autosize.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>   

    
<script>
			
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
</script>
<style>
.invalid{
    border-color: #dc3545 !important;
    padding-right: calc(1.5em + 0.75rem);
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right calc(0.375em + 0.1875rem) center;
    background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}
.valid{
    border-color: #198754 !important;
    padding-right: calc(1.5em + 0.75rem);
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%23198754' d='M2.3 6.73L.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right calc(0.375em + 0.1875rem) center;
    background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

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
<div id="body-content">
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
	                    	<label>Quotation ID<span class="text-red"> *</span></label>
	                   		<input type="text" class="form-control " id="quID" placeholder="" onkeyup="checkDuplicateId()">
	                   		<div class="">
	                   		<div  style="display:none;" id="error" class=" invalid-feedback">
								You can not use this Quotation ID
							</div>
							<div  style="display:none;" id="pass" class=" valid-feedback">
								You can  use this Quotation ID
							</div>
							<div  style="display:none;" id="empty" class=" invalid-feedback">
								Don't leave this blank.
							</div>
							</div>		
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-3">
                   		<div class="form-group">
	                   		<label>Create date<span class="text-red"> *</span></label>
	                           <div class="input-group">
	                              <input class="form-control fc-datepicker" id="start" placeholder="Select date" type="text">
	                               <div class="input-group-text">
	                                    <i class="fa fa-calendar tx-16 lh-0 op-6"></i>
	                               </div>
	                           </div>
	                           <small class="invalid-feedback" style="display:none" id="invalid-create-date">Please select a valid create date</small>
                        </div>
                	</div>
                	<div class="col-sm-6 col-md-3">
                   		<div class="form-group">
	                   		<label>Due date<span class="text-red"> *</span></label>
	                           <div class="input-group">
	                               <input class="form-control fc-datepicker" id="end" placeholder="Select date" type="text">
	                               <div class="input-group-text">
	                                    <i class="fa fa-calendar tx-16 lh-0 op-6"></i>
	                               </div>
	                           </div>
	                           <small class="invalid-feedback" style="display:none" id="invalid-due-date">Please select a valid due date</small>
                        </div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<label>Customer Name<span class="text-red"> *</span></label>
	                    	<div class="input-group">
		                   		<input type="text" class="form-control" id="customer" data-bs-toggle="modal" data-bs-target="#CustomerNameModal" placeholder="Select Company">
		                   		<div class="input-group-text" style="cursor: pointer;" data-bs-toggle="modal"  data-bs-target="#CustomerNameModal">
		                   			<i class="bi bi-search tx-16 lh-0 op-6"></i>
		                   		</div>
	                   	</div>	
	                   	<small class="invalid-feedback" style="display:none" id="invalid-customer-name">Please select a valid customer name</small>
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<label>Tax ID<span class="text-red"> *</span></label>
	                   		<input type="text" class="form-control" id="taxID" placeholder="">
	                   		<small class="invalid-feedback" style="display:none" id="invalid-taxID">Please select a valid tax ID</small>
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-6" style="display:none">
                   		<div class="form-group">
	                    	<label>company ID<span class="text-red"> *</span></label>
	                   		<input type="text" class="form-control" id="companyID" placeholder="">
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<label>Contact Name<span class="text-red"> *</span></label>
	                   		<select  class="form-control form-select select2" id="contact" data-bs-placeholder="Select Customer" onchange="change()">
	                   			<option value="" selected>Select Contact</option>
                            </select>
                            <small class="invalid-feedback" style="display:none" id="invalid-contact-name">Please select a valid contact name</small>
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<label>Email<span class="text-red"> *</span></label>
	                   		<input type="email" class="form-control" id="email" placeholder="">
	                   		<small class="invalid-feedback" style="display:none" id="invalid-email">Required this field</small>
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<label>Customer number 1<span class="text-red"> *</span></label>
	                   		<input type="tel" class="form-control" id="phone1" placeholder="" >
	                   		<small class="invalid-feedback" style="display:none" id="invalid-phone">Required this field</small>
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<label>Customer number 2</label>
	                   		<input type="tel" class="form-control" id="phone2" placeholder="">
                    	</div>
                	</div>
                	<div class="col-sm-6 col-md-6">
                   		<div class="form-group">
	                    	<label>Salesperson<span class="text-red"> *</span></label>
	                   		<select  class="form-control form-select select2" id="salesperson" data-bs-placeholder="Select Sale" onchange="changeSale()">
	                   		    
                            </select>
                            <small class="invalid-feedback" style="display:none" id="invalid-salesperson">Please select a valid Salesperson</small>
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
                    <h5 class="modal-title">Select Customer</h5>
                    <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                    	<table class="table table-bordered  table-hover border-bottom dataTable no-footer companyTable" id="customerTable" style="width:100%;">
	                    	<thead>
	                    		<tr>
	                    			<th style="text-align:center;width:7% !important">#</th>
	                    			<th style="width:40% !important">Company Name</th>
	                    			<th style="width:25% !important">Company Code</th>
	                    			<th style="width:20% !important">Status</th>
	                    			<th style="width: 8%;">Is Active</th>
	                    		</tr>
	                    	</thead>
	                    	<tbody>
	                    	<c:forEach var="company" items="${companyList}">	                    		
	                    	<tr data-bs-dismiss="modal" class="content" value="${company.company_en}" data-id="${company.company_id}" data-tax="${company.tax_number}" >
	                    			<td></td>
	                    			<td>
	                    			    <span><img src="${company.path}" class="avatar bradius" style="min-width:32px; min-height:32px"></span><span class="ms-3" style="vertical-align:super;">${company.company_en}</span>
	                    			</td>
	                    			<td style="vertical-align: middle;">${company.company_code}</td>
	                    			<td style="vertical-align: middle;">
	                    				<c:if test="${company.status == 0}">Customers</c:if>
	                    				<c:if test="${company.status == 1}">Partners</c:if>
	                    				<c:if test="${company.status == 2}">Financial</c:if>
	                    				<c:if test="${company.status == 3}">Legal</c:if>
	                    				<c:if test="${company.status == 4}">Leadership and Peer Mentors</c:if>
	                    				<c:if test="${company.status == 5}">Employees</c:if>
	                    			</td>
	                    			<td style="vertical-align: middle;">
	                    				<label class="custom-control custom-checkbox" style="margin-left: 40%;">
		                                        <input type="checkbox" class="custom-control-input" name="example-checkbox1" value="option1" onclick="return false;" 
		                                        <c:if test="${fn:contains(company.is_active, '1')}">checked</c:if>>
		                                        <span class="custom-control-label"></span>
	                                    </label>
	                                 </td>
	                    		</tr>
	                    		</c:forEach>
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
				<div class="card-title">Customer Address<span class="text-red"> *</span></div>
			</div>
			<div class="card-body" id="address-list">
			<div id="list-ul">
				<div class="no-data" id="nodata">
					<div style="text-align:center"> 
						<i class="fe fe-inbox fs-24 text-gray"></i>
					</div>
					<div style="text-align:center" class="text-gray mt-2">
						No data yet, please select address.
					</div>
				</div>
				<div id="test-ul" style="display:none;">
		            <ul class="list-group" id="address-ul">
		               
		            </ul>
	  			 </div>
			</div>	
				<button type="button" class="btn btn-primary mt-4" data-bs-toggle="modal" data-bs-target="#largemodal" id="select_address">Select Address</button>
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
                    	<table class="table table-bordered text-nowrap border-bottom dataTable no-footer myTable" id="addressTable">
	                    	<thead>
	                    		<tr>
	                    			<th style="width:10%">#</th>
	                    			<th style="width:30%">Company Name</th>
	                    			<th style="width:60%">Address</th>
	                    		</tr>
	                    	</thead>
	                    	<tbody id="getAddress">
	                    		
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
		
		
		<!-- order -->
		<div class="card">
			<div class="card-header">
				<div class="card-title">Items</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
				<c:set var="counter" value="${counter+1}"></c:set>
					<table id="table1" class="table table-bordered  border-bottom order-list">
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
							<tr class="row_product ">
								<td class="num">${counter}</td>
								<td><input type="text" class="form-control product_name "  name="product_name" placeholder=""></td>
								<td><textarea rows="2" cols="" class="form-control mb-4 description" name="description" ></textarea></td>
								<td><input type="number" class="form-control many quantity-${counter}" placeholder="" onkeyup="calculatePrice('${counter}')" onchange="calculatePrice('${counter}')" onclick="this.select()" name="quantity" style="text-align:right"></td>
								<td><input type="text" class="form-control price unit_price-${counter}" placeholder="" onkeyup="myFunction(this);calculatePrice('${counter}')" onchange="onchangeValueWithDigits(this)" onclick="this.select()" name="unit_price" style="text-align:right"></td>
								<td><input type="text" class="form-control sum total-${counter} sub-total" placeholder="" name="total" style="text-align:right; background-color:transparent;"  readonly></td>
								<td>
									<button class="btn text-danger btn-sm" data-bs-toggle="tooltip" onclick="deleteRow(this)" data-bs-original-title="Delete">
                         			<span class="fe fe-trash-2 fs-18"></span></button>
                         	    </td>
							</tr>
						</tbody>
					</table>
					<a href="javascript:void(0)" type="button" title="" class="add-author btn btn-primary">Add Product</a>
				</div>
				<div class="row">
					<div class="col-sm-6 col-md-6 mt-5">
						<div class="form-group">
	                    	<label>Description</label>
	                   		<textarea rows="4" cols="" class="form-control mb-4" id="description" ></textarea>
                    	</div>
					</div>
					<div class="col-sm-6 col-md-6 mt-5">
						<div class="row">
			                <label class="col-sm-6 col-md-6" style="text-align:right;align-self: center;">sub total</label>
			                <div class=" col-sm-6 col-md-6 mb-2">
			                <input type="text" class="form-control" id="sub-total" placeholder="" style="text-align:right; background-color:transparent;"  readonly>
			                </div>
			                
			                
			                <label class="col-sm-6 col-md-3" style="text-align:right;align-self: center;">ส่วนลด</label>
				            <div class=" col-sm-6 col-md-3">
                                   <div class="input-group">
                                         <input type="text" id="dc-percent" class="form-control" style="text-align:right" 
                                                onkeyup="enterDiscountPercent()" onchange="onchangeValueWithDigits(this)" onclick="this.select()">
                                         <span class="input-group-text" id="basic-addon2">%</span>
                                   </div>
                            </div>
                            <div class=" col-sm-6 col-md-6 mb-2">            
			                <input type="text" class="form-control" id="discount" placeholder="" style="text-align:right" 
			                       onkeyup="myFunction(this);enterDiscountValue()" onchange="onchangeValueWithDigits(this)" onclick="this.select()">
			                </div>
			                
			                <label class="col-sm-6 col-md-6" style="text-align:right;align-self: center;">ส่วนลดเพิ่มเติม</label>
			                <div class=" col-sm-6 col-md-6 mb-2">
			                <input type="text" class="form-control" id="additional_discount" placeholder="" style="text-align:right" 
			                	   onkeyup="myFunction(this);enterAdditionalDiscount()" onchange="onchangeValueWithDigits(this)" onclick="this.select()">
			                </div>
			                
			                
			                <label class="col-sm-6 col-md-6" style="text-align:right;align-self: center;">การคำนวนภาษี</label>
			                <div class="col-sm-6 col-md-6 mb-2 ">
                                  <select class="form-control form-select form-select select2" id="inputGroupSelect01" onchange="sum_grandTotal()">
                                       <option value="1" id="sum-vat" selected>ราคารวมภาษี</option>
                                       <option value="2" id="no-sumvat">ราคาแยกภาษี</option>
                                       <option value="3" id="no-vat">ไม่คำนวนภาษี</option>
                                  </select>   
                            </div>
                            
                            <label class="col-sm-6 col-md-3" style="text-align:right;align-self: center;">อัตราภาษี</label>
				            <div class=" col-sm-6 col-md-3">
                                   <div class="input-group">
                                          <input type="text" class="form-control" id="VAT" style="text-align:right" 
                                                 onkeyup="enterTaxPercent()" onchange="onchangeValueWithDigits(this)" onclick="this.select()">
                                         <span class="input-group-text" id="basic-addon2">%</span>
                                  </div>
                            </div>
                            <div class=" col-sm-6 col-md-6 mb-2">            
			                <input type="text" class="form-control " placeholder="" id="totalVAT" style="text-align:right" 
			                	   onkeyup="myFunction(this);enterTaxValue()" onchange="onchangeValueWithDigits(this)" onclick="this.select()">
			                </div>
			                
			                 <label class="col-sm-6 col-md-6" style="text-align:right;align-self: center;">grand total</label>
			                <div class=" col-sm-6 col-md-6 mb-2">
			                <input type="text" class="form-control " placeholder="" id="grand_total" style="text-align:right; background-color:transparent;"  readonly>
			                </div>
			            </div>	
					</div>
				</div>
			</div>
		</div>
		<!-- BUTTON -->
			<div  style="text-align: right; margin-top: 0.5rem; margin-bottom: 1.5rem;">
				<a href="#" type="button" class="btn btn-default" style="min-width: 5%;" onclick="cancelSwal()">Cancel</a>
				<button  type="button" class="btn btn-success" onclick="send_data('1')" style="min-width: 5%;">Save</button>
				<button  type="button" class="btn btn-primary" style="min-width: 5%;" onclick="send_data('2')">Send Approve</button>
			</div>
	</div>
</div>
</div>
<script>
$(document).ready( function() {
    var now = new Date();
    //var today = now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + now.getDate();
    var today = (now.getMonth() + 1)+'/'+now.getDate()+'/'+now.getFullYear();
    $('#start').val(today);
});
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
  autosize(document.getElementById('description'));
  autosize(document.getElementsByClassName('description'));
</script>
 <script>
 /*---------------------  Order Table  -------------------------------*/
 var counter = 1;
 jQuery('a.add-author').click(function(event){
     event.preventDefault();
     var table = document.getElementById("table1");
     var tbodyRowCount = table.tBodies[0].rows.length; 
     console.log("tbodyRowCount: "+(tbodyRowCount+1));
     counter++;
     console.log("counter: "+counter);
     var newRow = jQuery('<tr class="row_product"><td class="num">'+counter+'</td><td><input type="text" class="form-control product_name" name="product_name" placeholder=""' +
          '/></td><td><textarea rows="2" cols="" class="form-control mb-4 description" name="description" ></textarea>' +
          '</td><td><input type="number" class="form-control many quantity-'+counter+'" name="quantity" onkeyup="calculatePrice('+counter+')" onchange="calculatePrice('+counter+')" onclick="this.select()" style="text-align:right"></td>'+
          '<td><input type="text" class="form-control price unit_price-'+counter+'"  name="unit_price" onkeyup="myFunction(this);calculatePrice('+counter+');" onchange="onchangeValueWithDigits(this)" onclick="this.select()" style="text-align:right"></td>'+
          '<td><input type="text" class="form-control sum total-'+counter+' sub-total" name="total" placeholder="" style="text-align:right; background-color:transparent;"  readonly></td>'+
          '<td><button class="btn text-danger btn-sm" data-bs-toggle="tooltip" onclick="deleteRow(this)" data-bs-original-title="Delete"><span class="fe fe-trash-2 fs-18"></span></button></td>');
			
     jQuery('table.order-list').append(newRow);
     autosize(document.getElementsByClassName('description'));
     var renum = 1;
     $("tr td.num").each(function() {
         $(this).text(renum);
         renum++;
     });
 });
 
 
function auto_grow(element) {                    //Auto height textarea
	    element.style.height = "5px";
	    element.style.height = (element.scrollHeight)+"px";
}

function deleteRow(r) {
	//console.log(r);
    var i = r.parentNode.parentNode.rowIndex;
    console.log(i);
    document.getElementById("table1").deleteRow(i);
    var renum = 1;
    $("tr td.num").each(function() {
        $(this).text(renum);
        renum++;
    });
    sum_subTotal();
    enterDiscountPercent();
}

</script>
<!--  <script>
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
				//console.log(grand);
			});
		 enterVat();
		 var grand = priceSumDiscount(); 
		 $("#grand_total").val(grand);
		 //console.log(grand);
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
	//console.log(grand_total);
	if(isNaN(grand_total)){
		$("#grand_total").val(sum_discount);
	}else{
		$("#grand_total").val(grand_total);
	}
	
}


</script>-->
<script>
document.getElementById('phone1').addEventListener('keyup',function(evt){
    var phoneNumber = document.getElementById('phone1');
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    phoneNumber.value = phoneFormat(phoneNumber.value);
    console.log((phoneNumber.value).length);
});
document.getElementById('phone1').value = phoneFormat(document.getElementById('phone1').value);

document.getElementById('phone2').addEventListener('keyup',function(evt){
    var phoneNumber = document.getElementById('phone2');
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    phoneNumber.value = phoneFormat(phoneNumber.value);
    console.log((phoneNumber.value).length);
});
document.getElementById('phone2').value = phoneFormat(document.getElementById('phone2').value);

function numberPressed(evt){
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if(charCode > 31 && (charCode < 48  && charCode > 57) && (charCode < 36  && charCode > 40)){
            return false;
    }
    return true;
}

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

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function myFunction(el) {
	    // skip for arrow keys
	    if (event.which >= 37 && event.which <= 40) {
	        event.preventDefault();
	    }

	    var currentVal = el.value;
	   console.log(currentVal);
	   el.value = replaceCommas(currentVal);
	    //console.log($('.number').val());
	
}

function replaceCommas(yourNumber) {
    var components = yourNumber.toString().split(".");
    if (components.length === 1) 
        components[0] = yourNumber;
    components[0] = components[0].replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    if (components.length === 2)
        components[1] = components[1].replace(/\D/g, "");
    return components.join(".");
}

function onchangeValueWithDigits(el){
	      var currentObj= el;
	      var currentVal= currentObj.value.replace(/,/g,'');
	      console.log(currentVal);
	      if(!isNaN(currentVal)){
	       // var updatedVal=parseFloat(currentVal).toFixed(2);
	        currentObj.value = numberWithCommas(Number(currentVal).toFixed(2));
	      }
	      else{
	          currentObj.val("");
	      }
	 
}


function calculatePrice(counter){
	var qua = $('.quantity-'+counter).val();
	var price = $('.unit_price-'+counter).val().replace(/,/g,'');
	var v1 = parseFloat(qua);
	var v2 = parseFloat(price);
	var result = v1 * v2;
	
	//console.log('total: '+result);
	if(isNaN(result)){
		$('.total-'+counter).val('');
	}else{
		 $('.total-'+counter).val(numberWithCommas(Number(result).toFixed(2)));
	}
	sum_subTotal();
	enterDiscountPercent();
	/*additional_discount();
	priceIncludesDiscount();*/
	enterTaxPercent();
	sum_grandTotal();
}

function sum_subTotal(){
	 var sub_total = 0;
	 $(".sub-total").each(function() {
	      if ($(this).val() != '') {
	    	  sub_total = sub_total + parseFloat($(this).val().replace(/,/g,''));
	    }
	  });
	 $("#sub-total").val(numberWithCommas(Number(sub_total).toFixed(2)));
}

function enterDiscountPercent(){
	var percent;
	var sub_total;
	var pc = $('#dc-percent').val().replace(/,/g,'');
	if(pc == ''){
		percent = 0;
	}
	else{
		percent = parseFloat(pc);
	}
	var sub = $("#sub-total").val().replace(/,/g,'');
	if(sub == ''){
		sub_total = 0;
	}else{
		sub_total = parseFloat(sub);
	}
	var discount = (sub_total * percent)/100 ; 
	//console.log(discount);
	if(isNaN(discount)){
		$("#discount").val('');
	}else{
		$("#discount").val(numberWithCommas(Number(discount).toFixed(2)));
	}
	enterTaxPercent();
	sum_grandTotal();
}

function enterDiscountValue(){
	$("#dc-percent").val('');
	priceIncludesDiscount();
	enterTaxPercent();
}

function additional_discount(){
	var additional_discount;
	var aa = $("#additional_discount").val().replace(/,/g,'');
	if(aa == ''){
		additional_discount = 0;
	}else{
		additional_discount = parseFloat(aa);
	}
	return additional_discount;
}

function enterAdditionalDiscount(){
	priceIncludesDiscount();
	sum_grandTotal();
}

function priceIncludesDiscount(){      //   ราคารวมส่วนลด
	var total;
	var sub_total;
	var discount;
	var ff = $("#sub-total").val().replace(/,/g,'');
	if(ff == ''){
		sub_total = 0;
	}else{
		sub_total = parseFloat(ff);
	}
	var dc = $("#discount").val().replace(/,/g,'');
	if(dc == ''){
		discount = 0;
	}else{
		discount = parseFloat(dc);
	}
	var topup = additional_discount();
	
	total = (sub_total - discount) - topup;
	return total;
}

function enterTaxPercent(){
	var percent
	var pc = $("#VAT").val().replace(/,/g,'');
	if(pc == ''){
		percent = 0;
	}else{
		percent = parseFloat(pc);
	}
	var discount = priceIncludesDiscount();
	
	var vat = (discount * percent)/100;
	//console.log(vat);
	if(isNaN(vat)){
		$("#totalVAT").val('');
	}else{
		$("#totalVAT").val(numberWithCommas(Number(vat).toFixed(2)));
	}
	sum_grandTotal();
	
}

function enterTaxValue(){
	$("#VAT").val('');
	sum_grandTotal();
}

function sum_grandTotal(){
	var discount;
	var total_tax;
	var grand_total;
	
	const sumvat = document.querySelector('#sum-vat');
	const no_sumvat = document.querySelector('#no-sumvat');
	const no_vat = document.querySelector('#no-vat');
	
	var sub = $("#sub-total").val().replace(/,/g,'');
	var sub_total = parseFloat(sub);
	var dc = $("#discount").val().replace(/,/g,'');
	if(dc ==''){
		discount = 0;
	}else{
		discount = parseFloat(dc);
	}
	var vat = $("#totalVAT").val().replace(/,/g,'');
	if(vat ==''){
		total_tax = 0;
	}else{
		total_tax = parseFloat(vat);
	}
	var topup = additional_discount();
	
	grand_total = ((sub_total - discount) - topup) + total_tax;
	if(isNaN(grand_total)){
		$("#grand_total").val('');
	}else{
		$("#grand_total").val(numberWithCommas(Number(grand_total).toFixed(2)));
	}
	if(sumvat.selected){
		//console.log("sumvat");
		document.getElementById("VAT").disabled = false;
		document.getElementById("totalVAT").disabled = false;
		
		grand_total = (sub_total - discount) - topup ;
		if(isNaN(grand_total)){
			$("#grand_total").val('');
		}else{
			$("#grand_total").val(numberWithCommas(Number(grand_total).toFixed(2)));
		}
	}
	if(no_sumvat.selected){
		//console.log("no_sumvat");
		document.getElementById("VAT").disabled = false;
		document.getElementById("totalVAT").disabled = false;
		
		grand_total = ((sub_total - discount) - topup) + total_tax;
		if(isNaN(grand_total)){
			$("#grand_total").val('');
		}else{
			$("#grand_total").val(numberWithCommas(Number(grand_total).toFixed(2)));
		}
	}
	if(no_vat.selected){
		//console.log("no_vat");
		$("#VAT").val('');
		$("#totalVAT").val('');
		document.getElementById("VAT").disabled = true;
		document.getElementById("totalVAT").disabled = true;
		
		grand_total = (sub_total - discount) - topup;
		if(isNaN(grand_total)){
			$("#grand_total").val('');
		}else{
			$("#grand_total").val(numberWithCommas(Number(grand_total).toFixed(2)));
		}
	}
}

/*function changeTaxType(){
	
}*/
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
/*-----------------------   DELETE ADDRESS, SALE <li>  ------------------------------------*/
function DeleteAddress(currentEl){
	  //console.log(currentEl.parentNode.parentNode.parentNode);
	  //currentEl.parentNode.parentNode.removeChild(currentEl.parentNode);
	  currentEl.parentNode.parentNode.parentNode.remove();
	  const tag = document.getElementById("list-ul");
	  if( document.getElementById("address-ul").innerHTML==""){
		 /*let text = '<div class="no-data">'+
					'<div style="text-align:center">'+
					'<i class="fe fe-inbox fs-24 text-gray"></i>'+
					'</div>'+
					'<div style="text-align:center" class="text-gray mt-2">'+
					'No data yet, please select address.'+
					'</div>'+
					'</div>';
		tag.innerHTML = text;*/
		$("#address-list .no-data").show();
		 }
}	

/*function DeleteSale(currentEl){
	//console.log(currentEl.parentNode.parentNode.parentNode);
	currentEl.parentNode.parentNode.parentNode.remove();
}*/

</script>
<script>
/*----------------generate list of Address--------------------------*/
function selectAddress(){
	let getAddressList = [];
	const body = document.getElementById('address-ul');
	//console.log(ul);
	$('#getAddress tr').each(function() {
		$(this).find(".checkbox-tick:checked").each(function() {
			let values = { 'address_name' :  $(this).closest("tr").find('td.name').text(),'address_detail' :  $(this).closest("tr").find('td.address').text(),
							'address_id':$(this).closest("tr").find('input.address_id').val()}
			getAddressList.push(values);
		});
	});
	console.log(getAddressList);
	//console.log(getAddressList[0].address_name);
	//let ul = '<ul class="list-group" id="address-ul">';
	//let ul_end = '</ul>';
	  let text = '';
	  if(getAddressList.length == 0){
		  console.log("nodata");
		  $("#address-list .no-data").show();
		  $("#test-ul").hide();
		  
	  }else{
		  for(let i = 0; i < getAddressList.length; i++){
				text +=  '<li class="list-group-item animate ">'+
		               '<div class="row">'+
		               '<div class="col-sm-6 col-md-3 data_address_name">'+
		                getAddressList[i].address_name + 
		                '</div>'+
		                '<div class="col-sm-6 col-md-8 data_address_detail" >'+
		                   getAddressList[i].address_detail +
		                '</div>'+
		                '<div class="col-sm-6 col-md-1" style="text-align:right;">'+
		                '<button class="btn text-danger btn-sm" onclick="DeleteAddress(this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">'+
		                '<span class="fe fe-trash-2 fs-18"></span></button>'+
		                '</div>'+
		                '<div class="col-sm-6 col-md-3 mt-4">'+
		                '<label class="custom-control custom-checkbox">'+
		                '<input type="checkbox" class="custom-control-input check_address" name="example-checkbox5" value="'+i+'" onchange="check_address(this);removeInvalidCheckBox()" >'+
		                '<span class="custom-control-label">Delivery Address</span>'+
		                '<small class="invalid-feedback invalid-check-address" style="display:none" id="">Please select a valid delivery address</small>'+
		                '</label>'+
		                '</div>'+
		                '</div>'+
		                '<input type="hidden" class="data_address_id" value="'+getAddressList[i].address_id+'"'+
		                '</li>';
			}
			//ul = ul + ul_end;
			//console.log(ul);
			$("#address-list .no-data").hide();
			//$("#address-ul").append(text);
			body.innerHTML = text;
			$("#test-ul").show();
	  }
	
	
}
function removeInvalidCheckBox(){
	//const checkbox = document.querySelector(".check_address");
	if($(".check_address").is(':checked')==true){
		$(".check_address").removeClass("is-invalid");
	}else{
		$(".check_address").addClass("is-invalid");
	}
}
function check_address(el){
	/*console.log("fff");
	console.log(el)*/;
	//console.log($('input.check_address'));
	$('input.check_address').not(el).prop('checked', false);
}
/*$('input[type="checkbox"][class="check_address"]').on('change', function() {
	console.log("fff");
	   $('input[type="checkbox" class="check_address"]').not(this).prop('checked', false);
	});*/

/*-------------------generate table Customer Address in Modal------------------------*/
 function generateCustomerAddressTable(companyId){
	console.log("generateCustomerAddressTable: "+companyId);
	const addressTable = document.getElementById('getAddress');
	$("#address-ul li").remove();
	$.ajax({
		url:"listofAddressCompany",
		method:"POST",
		type:"JSON",
		data:{
			"company_id":companyId
		},
		success:function(data){
			console.log(data);
			let bodyHtml = '';
			for(var i = 0;i < data.length;i++){
				bodyHtml += '<tr>'+
							'<td>'+
							'<label class="custom-control custom-checkbox">'+
							'<input type="checkbox" class="custom-control-input checkbox-tick chk" name="example-checkbox5" value="option5" >'+
							'<span class="custom-control-label"></span>'+
							'</label>'+
							'</td>'+
							'<td class="name">'+data[i].address_name+'</td>'+
							'<td class="address">'+data[i].address+'</td>'+
							'<input type="hidden" value="'+data[i].company_address_id+'"class="address_id"'+
							'</tr>';
			}
			addressTable.innerHTML = bodyHtml;
		}
	})
}
	
function generateSaleOption(companyId){
	const select = document.getElementById('salesperson');
	$.ajax({
		url:"listcompanySales",
		method:"POST",
		type:"JSON",
		data:{
			"id":companyId
		},
		success:function(data){
			console.log(data);
			let option = '<option value="" selected>Select Sale</option>';
			for(var i = 0;i < data.length;i++){
				option += '<option value="'+data[i].employee_id+'">'+data[i].employee_id+'&nbsp;-&nbsp;'+data[i].title_name_en+'&nbsp;'+data[i].name_en+'</option>';
			}
			select.innerHTML = option;
		}
	})
}
</script>
<script>
/*----------------generate list of Sale--------------------------*/
 /*function selectSale(){
	 let getSaleList = [];
	 const ul = document.getElementById('sale-ul');
	 $('#getSale tr').each(function() {
			$(this).find(".checkbox-tick:checked").each(function() {
				let values = { 'employee_id' :  $(this).closest("tr").find('td.emp_id').text(),'name' :  $(this).closest("tr").find('span.sale_name').text(),'title_name' :  $(this).closest("tr").find('span.title_name_en').text(),
						       'phone' :  $(this).closest("tr").find('td.sale_phone').text(),'email' :  $(this).closest("tr").find('td.sale_email').text()}
				getSaleList.push(values);
			});
		});
	 console.log(getSaleList);
	 let li = '';
	 for(let i = 0; i < getSaleList.length;i++){
		 li +=  '<li class="list-group-item animate">'+
  				'<div class="row">'+
				'<div class="col-sm-6 col-md-4 ">'+
				'<div>'+
				'<span class="data_title_name_en">'+getSaleList[i].title_name+'</span><span class="data_employee_name">'+getSaleList[i].name+'</span>'+
				'</div>'+
		  		'<div class="data_employee_id">'+getSaleList[i].employee_id+'</div>'+
		 		'</div>'+
		 		'<div class="col-sm-6 col-md-3 data_phone" style="align-self: center;">'+
		     	'<i class="bi bi-telephone"></i>&nbsp;&nbsp;'+getSaleList[i].phone+
		 		'</div>'+
		 		'<div class="col-sm-6 col-md-4 data_email" style="align-self: center;">'+
		     	'<i class="fa fa-envelope-o"></i>&nbsp;&nbsp;'+getSaleList[i].email+
		 		'</div>'+
		 		'<div class="col-sm-6 col-md-1" style="text-align:right;align-self: center;">'+
		     	'<button class="btn text-danger btn-sm" onclick="DeleteSale(this)" data-bs-toggle="tooltip" data-bs-original-title="Delete">'+
		   		'<span class="fe fe-trash-2 fs-14"></span></button>'+
		 		'</div>'+
				'</div>'+
				'</li>';
	 }
	 ul.innerHTML = li;
}*/
</script>
<script>
/*function getValueTable(){
/*var values = [];
$("#table1 tr").each((_, row) => {
  var value = {};
  $(row).find(":input").each((__, e) =>
    value[e.name] = $(e).val()
  );
  values.push(value);
});
console.log(values)*/
/*var values = $("#table1 tr.row_product").map((_, row) => {
	  var value = {};
	  $(row).find(":input").each((__, e) =>
	    value[e.name] = $(e).val()
	  );
	  return value;
	}).toArray();
	//values = values.filter(item => item);
	//console.log(values);
	return values;
}*/
</script>
<script>
function getCustomerAddressData(){
	//const dd = document.getElementsByClassName('check_address');
	console.log($('.check_address').is(':checked'));
	let getDataAddressList = [];
	if($('.check_address').is(':checked') == false){
		$(".check_address").addClass("is-invalid");
		$(".invalid-check-address").show();
	}else{
	$(".check_address").removeClass("is-invalid");
	$('#address-ul li').each(function() {
			let values = { 'address_name' :$(this).find('div.data_address_name').text(),'address_detail' :$(this).find('div.data_address_detail').text(),
							'address_id' :$(this).find('input.data_address_id').val(),
					        'delivery_address':$(this).find('input.check_address:checked').val() == undefined? "0":"1"}
			getDataAddressList.push(values);
	});
	}
	
	//console.log(getDataAddressList);
	return getDataAddressList;
	
}

/*function getSaleData(){
	let getDataSaleList = [];
	$('#sale-ul li').each(function() {
			let values = { 'employee_id' :  $(this).find('div.data_employee_id').text(),'employee_name' :  $(this).find('span.data_employee_name').text(),'title_name' :  $(this).find('span.data_title_name_en').text(),
				       'phone' :  $(this).find('div.data_phone').text(),'email' :  $(this).find('div.data_email').text()}
			getDataSaleList.push(values);
	});
	//console.log(getDataSaleList);
	return getDataSaleList;
}*/


function getOrderData(){
	let getOrderList = [];
	$("#table1 tr.row_product").each(function(){
		if($(this).find('input.product_name').val() == ''){
			$(this).find('input.product_name').addClass("invalid");
			$(this).find('input.product_name').on("keyup",function(){
				//console.log($(this));
				$(this).removeClass("invalid");
			});
		}
		if($(this).find('input.many').val() == ''){
			$(this).find('input.many').addClass("invalid");
			$(this).find('input.many').on("keyup",function(){
				//console.log("many");
				$(this).removeClass("invalid");
			});
			$(this).find('input.many').on("change",function(){
				//console.log("many");
				$(this).removeClass("invalid");
			});
		}
		if($(this).find('input.price').val() == ''){
			$(this).find('input.price').addClass("invalid");
			$(this).find('input.price').on("keyup",function(){
				//console.log("price");
				$(this).removeClass("invalid");
			});
		}if($(this).find('input.price input.many input.price').val() != ''){
			let values = {'product_name':$(this).find('input.product_name').val(),'description':$(this).find('textarea.description').val(),
				       'quantity':$(this).find('input.many').val(),'unit_price':$(this).find('input.price').val(),
				       'total':$(this).find('input.sum').val()}
			 getOrderList.push(values);
		}
		
		
	//console.log(getOrderList);
});
	return getOrderList;
}
</script>
<script>
/*------------------------ GET DATA FROM PAGE----------------------------------------*/


 $("#customerTable").on('click','tr',function(e){
	    e.preventDefault();
	    $("#email").val('');
		 $("#phone1").val('');
		 $("#phone2").val('');
		 $('#salesperson').val('');
	    customer = $(this).attr('value');
	    companyId = $(this).attr('data-id');
	    companyTax = $(this).attr('data-tax');
	    //console.log(companyId);
	    //console.log(companyTax);
	    generateSaleOption(companyId);
	    generateCustomerAddressTable(companyId);
	    $("#customer").val(customer);
	    $("#taxID").val(companyTax);
	    $("#taxID").removeClass("invalid");
		$("#taxID").removeClass("valid");
		$("#invalid-taxID").hide();
	    $("#companyID").val(companyId);
	    $.ajax({
	    	url:"listContact",
	    	method:"POST",
	    	type:"JSON",
	    	data:{
	    		"id":companyId
	    	},
	    	success:function(data){
	    		console.log(data);
	    		const contact = document.getElementById('contact');
	    		//console.log(contact);  
	    		let text = '<option value="" selected>Select Contact</option>';
	    		
                for(var i = 0;i<data.length;i++){
                	text += '<option value="'+data[i].company_contact_id+'" id="'+data[i].contact_name+'">'+data[i].title_name_en+'\r'+data[i].contact_name+'</option>';
                        	
	    	}
                contact.innerHTML = text;
                onchangeSelect2();
	    	}
	    })
		});
 
function onchangeSelect2(){
	 $(document).ready(function(){
     	//console.log("select");
    	 $('#contact').select2({
    	     minimumResultsForSearch: Infinity,
    	     width: '100%'
    	 }).on("change",function(){
    		 var xx = $("#contact").val(); 
    		 console.log(xx);
    		 $.ajax({
    			 url:"findDataContact",
    			 method:"POST",
    			 type:"JSON",
    			 data:{
    				 "contact_id":xx
    			 },
    			 success:function(data){
    				 console.log(data);
    				 $("#email").val(data.email);
    				 $("#email").removeClass("invalid");
    				 $("#email").removeClass("valid");
    				 $("#invalid-email").hide();
    				 $("#phone1").val(phoneFormat(data.phone)); 
    				 $("#phone1").removeClass("invalid");
    				 $("#phone1").removeClass("valid");
    				 $("#invalid-phone").hide();
    				 
    			 }
    		 })
    	 });
    });
}
 

		
 $("#quID").on("keyup",function(){
		$("#quID").removeClass("invalid");
		$("#quID").addClass("valid");
		if($("#quID").val()==''){
			$("#quID").removeClass("valid");
			$("#quID").addClass("invalid");
		}
	});
 $("#start").on("click",function(){
	// console.log("change");
		$("#start").removeClass("invalid");
		$("#start").removeClass("valid");
		$("#invalid-create-date").hide();
		if($("#start").val()==''){
			$("#start").removeClass("valid");
			$("#start").removeClass("invalid");
		}
	});
 
 $("#end").on("click",function(){
	// console.log("change");
		$("#end").removeClass("invalid");
		$("#end").removeClass("valid");
		$("#invalid-due-date").hide();
		if($("#end").val()==''){
			$("#end").removeClass("valid");
			$("#end").removeClass("invalid");
		}
	});
	$("#taxID").on("keyup",function(){
			$("#taxID").removeClass("invalid");
			$("#taxID").removeClass("valid");
			if($("#taxID").val()==''){
				$("#taxID").removeClass("valid");
				$("#taxID").removeClass("invalid");
			}
		});
	$("#customer").on("click",function(){
		//console.log("ww00");
		$("#customer").removeClass("invalid");
		$("#customer").removeClass("valid");
		$("#invalid-customer-name").hide();
		if($("#customer").val()==''){
			$("#customer").removeClass("valid");
			$("#customer").removeClass("invalid");
		}
	});
	
	function change(){
		//console.log("ppepe");
		$("#invalid-contact-name").hide();
		$("#contact").removeClass("invalid");
		$("#contact").removeClass("valid");
		if($("#contact").val()==''){
			$("#contact").removeClass("valid");
			$("#contact").removeClass("invalid");
		}
	}
	function changeSale(){
		$("#salesperson").removeClass("invalid");
		$("#invalid-salesperson").hide();
	}
	
	$("#email").on("keyup",function(){
		$("#email").removeClass("invalid");
		$("#email").removeClass("valid");
		$("#invalid-email").hide();
		if($("#email").val()==''){
			$("#email").removeClass("valid");
			$("#email").removeClass("invalid");
		}
	});
	$("#phone1").on("keyup",function(){
		$("#phone1").removeClass("invalid");
		$("#phone1").removeClass("valid");
		$("#invalid-phone").hide();
		if($("#phone1").val()==''){
			$("#phone1").removeClass("valid");
			$("#phone1").removeClass("invalid");
		}
	});

function checkDuplicateId(){
	var id = $("#quID").val();
	if(id!=""){
		$.ajax({
			url:"checkDuplicateId",
			method:"POST",
			type:"JSON",
			data:{
				"id":id
			},
			success:function(data){
				console.log(data);
				if (data.toString().indexOf("1") != -1) {
					$("#pass").hide();
					$("#error").show();
					$("#empty").hide();
					//$(':input[type="submit"]').prop('disabled', true);
					$("#quID").addClass("invalid");
					$("#quID").removeClass("valid");
				}
				 else {
					$("#pass").show();
					$("#error").hide();
					$("#empty").hide();
					//$(':input[type="submit"]').prop('disabled', false);
					$("#quID").addClass("valid");
					$("#quID").removeClass("invalid");
				}
			}
		})
	}else{
		$("#pass").hide();
		$("#error").hide();
		$("#empty").show();
		//$(':input[type="submit"]').prop('disabled', false);
		$("#quID").removeClass("invalid");
		$("#quID").removeClass("valid");
	}
}
 
 
 function send_data(value){
	var id = $("#quID").val();  console.log("quotationID: "+id);
	if(id ==''){
		$("#quID").addClass("invalid");
		$("#empty").show();
	}else{
		$("#quID").removeClass("invalid");
		$("#quID").addClass("valid");
		
	}
	var start = $("#start").val();  console.log('start: '+start);
	if(start ==''){
		$("#start").addClass("invalid");
		$("#invalid-create-date").show();
	}else{
		$("#start").removeClass("invalid");
		$("#start").removeClass("valid");
		$("#invalid-create-date").hide();
	}
	
	var end = $("#end").val();  console.log("end: "+end);
	if(end ==''){
		$("#end").addClass("invalid");
		$("#invalid-due-date").show();
	}else{
		$("#end").removeClass("invalid");
		$("#end").removeClass("valid");
		$("#invalid-due-date").hide();
	}
	
	var tax = $("#taxID").val();  console.log("tax: "+tax);
	if(tax ==''){
		$("#taxID").addClass("invalid");
		$("#invalid-taxID").show();
	}else{
		$("#taxID").removeClass("invalid");
		$("#taxID").removeClass("valid");
		$("#invalid-taxID").hide();
	}
	
	var contact = $("#contact").val();  console.log("contact: "+contact);
	if(contact =='' || contact == null){
		$("#contact").addClass("invalid");
		$("#invalid-contact-name").show();
	}else{
		$("#contact").removeClass("invalid");
		$("#contact").removeClass("valid");
		$("#invalid-contact-name").hide();
	}
	
	var email = $("#email").val();  console.log("email: "+email);
	if(email ==''){
		$("#email").addClass("invalid");
		$("#invalid-email").show();
	}else{
		$("#email").removeClass("invalid");
		$("#email").removeClass("valid");
		$("#invalid-email").hide();
	}
	
	var phone1 = $("#phone1").val();  console.log("phone1: "+phone1);
	if(phone1 ==''){
		$("#phone1").addClass("invalid");
		$("#invalid-phone").show();
	}else{
		$("#phone1").removeClass("invalid");
		$("#phone1").removeClass("valid");
		$("#invalid-phone").hide();
	}
	
	var phone2 = $("#phone2").val();  console.log("phone2: "+phone2);

	var customer = $("#customer").val();  console.log("customer: "+customer);
	if(customer ==''){
		$("#customer").addClass("invalid");
		$("#invalid-customer-name").show();
	}else{
		$("#customer").removeClass("invalid");
		$("#customer").removeClass("valid");
		$("#invalid-customer-name").hide();
	}
	var salesperson = $("#salesperson").val();  console.log("salesperson: "+salesperson);
	if(salesperson ==''){
		$("#invalid-salesperson").show();
		$("#salesperson").addClass("invalid");
	}else{
		$("#salesperson").removeClass("invalid");
		$("#invalid-salesperson").hide();
	}
	
	var company_id = $("#companyID").val();   console.log("company_id: "+company_id);
	var order = getOrderData();  console.log(order);
	//var sale = getSaleData();  console.log(sale); 
	
	var address = getCustomerAddressData();  console.log(address);
	if(address.length == 0){
		//console.log("address is empty");
		$("#nodata").addClass("req");
	}else{
		$("#nodata").removeClass("req");
	}
	var description = $("#description").val();  console.log("description: "+description);
	var sub_total = $("#sub-total").val();  console.log("sub_total: "+sub_total);
	var dc_percent = $("#dc-percent").val();  console.log("dc_percent: "+dc_percent);
	var discount = $("#discount").val();  console.log("discount: "+discount);
	var additional_discount = $("#additional_discount").val();  console.log("additional_discount: "+additional_discount);
	var tax_type = $("#inputGroupSelect01").val();  console.log("tax_type: "+tax_type);
	var vat = $("#VAT").val();  console.log("vat: "+vat);
	var total_vat = $("#totalVAT").val();  console.log("total_vat: "+total_vat);
	var grand_total = $("#grand_total").val();  console.log("grand_total: "+grand_total);
	var check = findInvalid(); console.log(check);
	if(check){
		if(value=='2'){
			Swal.fire({
		        title: 'Are you sure?',
		        text: 'Would you like to send approve?',
		        icon: 'warning',
		        showDenyButton: true,
		        denyButtonText: `Cancel`,
		        confirmButtonText: 'Confirm',
		        reverseButtons: true,
		      }).then((result) => {
		        /// Read more about isConfirmed, isDenied below
		            if (result.isConfirmed) {
		            	$.ajax({
		        			url:"saveQuotation",
		        			type:"JSON",
		        			method:"POST",
		        			data:{
		        				"id":id,
		        				"start":start,
		        				"end":end,
		        				"tax":tax,
		        				"company_id":company_id,
		        				"contact":contact,
		        				"email":email,
		        				"phone1":phone1,
		        				"phone2":phone2,
		        				"customer":customer,
		        				"salesperson":salesperson,
		        				"orderList":JSON.stringify(order),
		        				//"saleList":JSON.stringify(sale),
		        				"addressList":JSON.stringify(address),
		        				"description":description,
		        				"sub_total":sub_total,
		        				"dc_percent":dc_percent,
		        				"discount":discount,
		        				"additional_discount":additional_discount,
		        				"tax_type":tax_type,
		        				"vat":vat,
		        				"total_vat":total_vat,
		        				"grand_total":grand_total,
		        				"status":value
		        			},
		        			success:function(data){
		        				console.log(data);
		        	            document.location = "quotation_list";
		        	        }
		        	        })
		            } 
		            else if (result.isDenied) {
		                
		            }
		  })
		}else{
			$.ajax({
				url:"saveQuotation",
				type:"JSON",
				method:"POST",
				data:{
					"id":id,
					"start":start,
					"end":end,
					"tax":tax,
					"company_id":company_id,
					"contact":contact,
					"email":email,
					"phone1":phone1,
					"phone2":phone2,
					"customer":customer,
					"salesperson":salesperson,
					"orderList":JSON.stringify(order),
					//"saleList":JSON.stringify(sale),
					"addressList":JSON.stringify(address),
					"description":description,
					"sub_total":sub_total,
					"dc_percent":dc_percent,
					"discount":discount,
					"additional_discount":additional_discount,
					"tax_type":tax_type,
					"vat":vat,
					"total_vat":total_vat,
					"grand_total":grand_total,
					"status":value
				},
				success:function(data){
					console.log(data);
		            document.location = "quotation_list";
		        }
			})
		}
	}else{
		console.log("invalid");
		swal({
	          title: "กรอกข้อมูลไม่ครบ!",
	          text: "กรุณากรอกข้อมูลให้ครบถ้วน",
	          type: "warning",
	          confirmButtonClass: 'btn-primary',
	          confirmButtonText: 'OK'
	      });
	}
	
}
</script>
<script>
function findInvalid(){
	
    /*const gg = document.getElementsByClassName('select2-selection');
    console.log(gg);*/
	//const element = document.querySelector('#body-content');
	
	//console.log(element);
	//console.log($("body").hasClass("row").toString());
	//var p = testElement.classList.contains('invalid');
	//console.log(element.matches('.invalid'));
	var body = document.getElementById('body-content')
	var i = body.getElementsByTagName("*");
	console.log(i);
	var valid = true;
	
	for (var a = 0; a < i.length; a++) {
	    if (i[a].classList.contains('invalid')) {
	        console.log("invalid");
	        valid = false
	    }
	    if(i[a].classList.contains('req')){
	    	console.log("req");
	    	valid = false
	    }
	}
	return valid;
}
</script>
<script>
$(document).ready(function(){
    $('#select_address').on('click',function(){   // button select sale
    /*var ul = document.querySelector("#address-ul");  // id of ul
    var liNodes = [];
    for (var i = 0; i < ul.childNodes.length; i++) {
        if (ul.childNodes[i].nodeName == "LI") {
            liNodes.push(ul.childNodes[i]);
        }
    }
    console.log("liNodes.length: "+liNodes.length); //นับจำนวน li*/
    var li = document.getElementById("address-ul").getElementsByTagName("li").length;
    console.log(li);
    var checks = document.querySelectorAll(".chk");
    var max = 2;
    for (var i = 0; i < checks.length; i++)
      checks[i].onclick = selectiveCheck;
    function selectiveCheck (event) {
      var checkedChecks = document.querySelectorAll(".chk:checked");
      console.log("checkedChecks: "+checkedChecks.length);
      //console.log("liNodes + checkedChecks: "+ (liNodes.length + checkedChecks.length));
      if ( checkedChecks.length >= max + 1){
        return false;
      }
      /*if(liNodes.length + checkedChecks.length >= 3){
            document.getElementById('select_address').disabled = true;
        }else{
            document.getElementById('select_address').disabled = false;
        } */
    }
    })
})
</script>
<script>
function cancelSwal(){
	Swal.fire({
        title: 'Are you sure?',
        text: 'Would you like to cancel?',
        icon: 'warning',
        showDenyButton: true,
        denyButtonText: `Cancel`,
        confirmButtonText: 'Confirm',
        reverseButtons: true,
      }).then((result) => {
        /// Read more about isConfirmed, isDenied below
            if (result.isConfirmed) {
                      window.location.href = "quotation_list";
            } 
            else if (result.isDenied) {
                
            }
  })
}
</script>
