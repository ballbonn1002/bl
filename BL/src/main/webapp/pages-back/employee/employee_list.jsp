<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- JQUERY JS -->
<script src="/assets/js/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script
	src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

<c:set var="now" value="<%=new java.util.Date()%>" />
<div class="page-header">
	<h1 class="page-title">Employee</h1>
	<div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="employee_list">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Employee</li>
		</ol>
	</div>
</div>

<div class="row clearfix">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">Employee</h3>
				<div class="card-options">
					<a href="employee_add" class="btn btn-primary btn-md"><i
						class="ion-plus me-2"></i>Create Employee</a>
				</div>
			</div>
			<!-- table list -->
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered text-nowrap border-bottom"
						id="basic-datatable">
						<thead>
							<tr>
								<th class="text-center" scope="col" style="width: 10%;">#</th>
								<th scope="col" style="width: 32%;">Employee Name</th>
								<th scope="col" style="width: 20%;">Employee id</th>
								<th scope="col" style="width: 20%;">Position</th>
								<th scope="col" style="width: 10%;">In Active</th>
								<th scope="col" style="width: 8%;">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="employ" items="${employeeList}">
								<c:set var="counter" value="${counter + 1}" />
								<tr>
									<th scope="row" class="align-middle text-center"><div
											class="mt-0 mt-sm-1 d-block">${counter}</div></th>
									<td><div class="mt-0 mt-sm-1 d-block"> 
									<span style="margin-right:0.5rem;">
									<img src="${employ.path}" class="avatar avatar-sm brround "
													style="min-width: 32px; min-height: 32px"></span>
											<!-- <img class="avatar avatar-sm brround primary"
												style="margin-right: 0.5rem;" alt="avatar"
												src="../assets/images/users/21.jpg"> -->${employ.title_name_en}
											${employ.name_en}
										</div></td>
									<td class="align-middle"><div class="mt-0 mt-sm-1 d-block">${employ.employee_id}</div></td>
									<td class="align-middle"><div class="mt-0 mt-sm-1 d-block">${employ.position_id}</div></td>
									<td class="align-middle text-center">
										<div
											class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0 align-top">
											<input class="custom-control-input" id="${employ.employee_id}" type="checkbox"onchange = "Change('${employ.employee_id}')"
											<c:if test ="${fn:contains(employ.enable, '1')}">checked</c:if>> 
											<label class="custom-control-label"
												for="${employ.employee_id}"></label>
										</div> 
									</td>

									<td class="align-middle"><a id="Edit_btn_" class="btn btn-sm" title="Edit"
										href="employee_edit?employID=${employ.employee_id}"> <i
											class="fe fe-edit text-purple" style="font-size: 18px"></i></a> <a
										class="btn btn-sm" title="Delete" id="delete"
										onclick="del('${employ.employee_id}')"> <i
											class="fe fe-trash-2 text-red" style="font-size: 18px"></i>
									</a>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

function del(id){
	Swal.fire({
	              title: 'Are you sure?',
	              text: "You won't be able to revert this!",
	              icon: 'warning',
	              showDenyButton: true,
	              denyButtonText: `Cancel`,
	              confirmButtonText: 'Delete',
	              confirmButtonColor: "#d33",
	              denyButtonColor: "#bbbbbb",
	              reverseButtons: true,
	            }).then((result) => {
	              /// Read more about isConfirmed, isDenied below
	                  if (result.isConfirmed) {
	                		$.ajax({
	            			url: 'Employee_delete',
	            			method: "POST",
	            			data: {"employID" : id},
	            			success: function(data) {
	            	 		document.location = "employee_list"; 
	                  }
	                  
	            })
	}
	            })
	}

	$(document).ready(function() {
		$('#department_list').DataTable({
			language : {
				searchPlaceholder : 'Search',
				search : " ",
			}
		});
	});
	
	function Change(idEmploy){
		console.log(idEmploy);
		const x = document.querySelector(idEmploy);
		var y = document.getElementById(idEmploy);
		console.log(y);
		var Isactive;
		if(y.checked){
			Isactive = 1; 
			
		}
		else{
			Isactive = 0;	
		}
		console.log(Isactive);
		 $.ajax({
	     	url: "ChangecheckboxEmployee",
	     	method : "POST",
			type : "JSON",
	         data: {		
	         			"Isactive" : Isactive,
	         			"idEmploy" : idEmploy
	         		},
	         success: function(data){
	             //console.log(data); 
	 	}
	  }) ;
	}
</script>