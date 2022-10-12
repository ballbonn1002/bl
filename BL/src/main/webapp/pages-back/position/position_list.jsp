<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!-- JQUERY JS -->
<script src="/assets/js/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

<c:set var="now" value="<%=new java.util.Date()%>" />
<style>
tr {
	opacity: 0;
	animation-name: fadeIn;
	animation-duration: 2s;
	animation-iteration-count: 1;
	animation-fill-mode: forwards;
}
</style>


<!-- PAGE-HEADER -->
<div class="page-header">
	<h1 class="page-title">Position</h1>
	<div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Position
				</li>
		</ol>
	</div>
</div>
<!-- PAGE-HEADER END -->


<div class="row clearfix">
	<div class="col-lg-12">

		<div class="card">
			<div class="card-header">
				<h2 class="card-title">Position</h2>

				<div class="card-options"><a href="position_add" class="btn btn-primary"><i class="ion-plus-round">&nbsp;</i>Create Position</a></div>


			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table
						class="table table-hover table-bordered text-nowrap mb-0"
						id="myTable">
						<thead>
							<tr>
								<th class="bg-transparent text-center"  style="width: 8%;">#</th>
								<th class="bg-transparent"  style="width: 20%;">Position ID</th>
								<th class="bg-transparent"  style="width: 22%;">Position Name</th>
								<th class="bg-transparent"  style="width: 20%;">Department ID</th>
								<th class="bg-transparent"  style="width: 20%;">Description</th>
								<th class="bg-transparent"  style="width: 10%;">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="test" items="${positionList}">
								<c:set var="counter" value="${counter + 1}" />
								<tr>
									<td class="text-center"> <div class="mt-0 mt-sm-1 d-block">${counter}</div></td>
									<td ><div class="mt-0 mt-sm-1 d-block">${test.position_id}</div></td>
									<td><div class="mt-0 mt-sm-1 d-block">${test.name}</div></td>
									<td><div class="mt-0 mt-sm-1 d-block">${test.department_id}</div></td>

									<td><div class="mt-0 mt-sm-1 d-block">${test.description}</div></td>
									<td >
										<div class="g-2">
											<a href="position_edit?position_id=${test.position_id}"
												class="btn text-primary btn-sm" data-bs-toggle="tooltip"
												data-bs-original-title="Edit"> <i
												class="fe fe-edit fs-16"></i>
											</a> 
											<a class="btn text-danger btn-sm" data-bs-toggle="tooltip"
												onclick="deletePosition('${test.position_id}')"
												data-bs-original-title="Delete"> <i
												class="fe fe-trash-2 fs-16"></i>
											</a>


										</div>

									</td>

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
	
function deletePosition(id){
	Swal.fire({
        title: 'Are you sure?',
        text: "You will deleting this id!",
        icon: 'info',
        showDenyButton: true,
        denyButtonText: `Cancel`,
        confirmButtonText: 'Confirm',
        confirmButtonColor: "#007bff",
        denyButtonColor: "#6c757d",
        reverseButtons: true,
      }).then((result) => {
        
            if (result.isConfirmed) {
            
            	$.ajax({
            		url: "position_delete",
            		method: "POST",
					data: {"position_id" : id },
					success:function(){
						window.location = "position_list";
				}	
            	})
            }
            else if (result.isDenied) {
                return false;
            }
      })
};


$(document).ready(function(){
	$('#myTable').DataTable({
        language: {
            searchPlaceholder: 'Search...',
            search: " ",
        }
    });
});
</script>

