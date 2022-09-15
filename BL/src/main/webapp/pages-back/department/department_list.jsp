<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />

<style type="text/css">
/* class สำหรับแถวแรกของรายละเอียด */
.tr_odd {
	background-color: #F8F8F8;
}
/* class สำหรับแถวสองของรายละเอียด */
.tr_even {
	background-color: #F2F2F2;
}

tr {
	opacity: 0;
	animation-name: fadeIn;
	animation-duration: 2s;
	animation-iteration-count: 1;
	animation-fill-mode: forwards;
}

@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
.head-ml {
	margin-left: -10px;
}
</style>
<script>
	$("tr:not(:first)").each(function(index) {
		$(this).css('animation-delay', index * 0.01 + 's');
	});
</script>

<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/mgalante/jquery.redirect@master/jquery.redirect.js"></script>


<div class="page-header">
	<h1 class="page-title">Department</h1>
	<div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="department_list">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Department</li>
		</ol>
	</div>
</div>
<div class="row clearfix">
	<div class="col-lg-12 col-xl-12">
		<div class="card">
			<div class="header">
				<h3 class="card-title pull-left m-5">Department</h3>
				<perm:permission object="master_data.department.create_update">
					<ul class="pull-right">
						<li><a href="department_add"><button type="button"
									class="btn btn-primary m-3">
									<i class="ion-plus me-2"></i>Create Department
								</button></a></li>

						<!-- <button class="btn-primary"><a href="department_add"><i class="ion-plus me-2"></i>Create
									Department</a></button></li> -->
						<!-- a href="department_add"
								class="btn btn-primary  float-right m-5"
								><i class="ion-plus"></i>Create
									Department</a> -->
					</ul>
				</perm:permission>
			</div>
			<div class="card-body">
				<!-- BEGIN FORM-->
				<div class="table-responsive">
					<div class="row">
						<div class="col-sm-12">
							<div class="table-responsive">
								<table class="table	 table-bordered text-nowrap mb-0" id="department_list">
									<thead>
										<tr>
											<th class="text-center" scope="col" style="width: 8%;">#</th>
											<th scope="col" style="width: 20%;">Department id</th>
											<th scope="col" style="width: 22%;">Department Name</th>
											<th scope="col" style="width: 20%;">Description</th>
											<th scope="col" style="width: 20%;">Prefix ID</th>
											<th scope="col" style="width: 10%;">Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="depart" items="${departmentList}">
											<c:set var="counter" value="${counter + 1}" />
											<tr >
												<th scope="row" class="text-center"><div class="mt-0 mt-sm-1 d-block">${counter}</div></th>
												<td ><div class="mt-0 mt-sm-1 d-block">
												${depart.department_id}</div></td>
												<td ><div class="mt-0 mt-sm-1 d-block">${depart.name}</div></td>
												<td ><div class="mt-0 mt-sm-1 d-block">${depart.description}</div></td>
												<td ><div class="mt-0 mt-sm-1 d-block">${depart.prefix_id}</div></td>
												<td><a id="Edit_btn_" class="btn" title="Edit"
													href="department_edit?ID=${depart.department_id}"> <i
														class="fe fe-edit text-purple" style="font-size: 18px"></i></a>
													<a class="btn" title="Delete" id="delete"
													onclick="del('${depart.department_id}')"> <i
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
			<!-- END FORM-->
		</div>
	</div>
</div>
<script type="text/javascript">
/* $(document).ready(function(){
    $('a#delete').click(function(){
        
        $.ajax({
            url: 'Department_delete',
            method: "POST",
            data: {"ID" : "${depart.department_id}"},
            success: function(data) {
            	 document.location = "department_list"; 
            	/*document.location = "Department_delete?ID=${test.department_id}";
            }
        });
    });
}) */
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
                	  Swal.fire(
                		      'Deleted!',
                		      'Your file has been deleted.',
                		      'success'
                		    )
                		$.ajax({
            			url: 'Department_delete',
            			method: "POST",
            			data: {"ID" : id},
            			success: function(data) {
            	 		document.location = "department_list"; 
                  }
                  /* else if (result.isDenied) {
                	  
                  } */
            })
}
            })
}


$(document).ready(function(){
	$('#department_list').DataTable({
        language: {
            searchPlaceholder: 'Search',
            search: " ",
        }
    });
});
</script>


<!-- <script>
$(document).ready(function(){
	$('#department_list').DataTable({
        language: {
            searchPlaceholder: 'Search',
            search: " ",
        }
    });
});
</script> -->
