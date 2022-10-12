<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="/assets/js/jquery.min.js"></script>
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

input[type="checkbox"] {
	accent-color: #0275d8;
}
.head-ml{
		margin-left: -10px;
	}

</style>
<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>

<!-- PAGE-HEADER -->
<div class="page-header">
    <h1 class="page-title">System User</h1>
    <div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">System User</li>
        </ol>
    </div>
</div>
<!-- PAGE-HEADER END -->

<div class="row row-cards">
    <div class="col-lg-12 col-xl-12">
    <perm:permission object="authority.system_user.view">
        <div class="card">
            <div class="card-header">    
				<div class="card-title">System User</div>
				<perm:permission object="authority.system_user.create_update">
				     
				     <div class="card-options"><a href="SystemUser_add" class="btn btn-primary"><i class="ion-plus-round">&nbsp;</i>Create System User</a></div>
				</perm:permission>
			</div>
			<div class="card-body">
						<div class="table-responsive">
							<table  class="table table-hover table-bordered mb-0" id = "myTable">
								<thead>
									<tr>
										<th class="text-center w-8"> <!-- style="text-align: left; width: 10%" --> #</th>
										<th class="w-30">System User ID</th>
										<th class="w-24">Role</th>
										<th class="w-24">Name</th>
										<th class="text-center w-14 ">Is Active</th>
										<th class="w-10">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="sysuser" items="${sysuserList}">
										<tr>
											<td class="text-center"> </td>
											<td><div class="d-flex"><span><img <c:if test="${sysuser.path != null}"> src="${sysuser.path}"</c:if>  class="avatar brround" style="min-width:32px; min-height:32px"></span>
											<div class="ms-3 mt-0 mt-sm-2 d-block">${sysuser.sys_user_id}
											</div>
											</div></td>
											<td>${sysuser.sys_role_id}</td>
											<td>${sysuser.title} ${sysuser.name}</td>
											<td data-order="${sysuser.is_active}">
													<div class="md-checkbox text-center" >
														<input id="${sysuser.sys_user_id}" type="checkbox" class="md-check status" onchange = "Change('${sysuser.sys_user_id}')"
														<c:if test ="${fn:contains(sysuser.is_active, '1')}">checked</c:if>>
													</div>
											</td>
											<td>      
											<perm:permission object="authority.system_user.create_update">	
											<a href="sysuser_edit?sysuser_id=${sysuser.sys_user_id}"
												class="btn text-primary btn-sm" data-bs-toggle="tooltip"
												data-bs-original-title="Edit"> <i
												class="fe fe-edit fs-18"></i>
											</a> 
											</perm:permission>
											<perm:permission object="authority.system_user.delete">
											<a class="btn text-danger btn-sm" data-bs-toggle="tooltip"
												onclick="deleteSysUser('${sysuser.sys_user_id}')"
												data-bs-original-title="Delete"> <i
												class="fe fe-trash-2 fs-18"></i>
											</a>
											</perm:permission>
                                       		</td>
										</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			</perm:permission>
		</div>
</div>
<script>
function deleteSysUser(id){
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
            		url: "sysuser_delete",
            		method: "POST",
					data: {"sys_user_id" : id },
					success:function(){
						window.location = "SystemUser_list";
				}	
            	})
            }
            else if (result.isDenied) {
                return false;
            }
      })
};

</script>
<script>
function Change(userId){
	const x = document.querySelector(userId);
	var y = document.getElementById(userId);
	var Isactive;
	if(y.checked){
		Isactive = 1; 
	}
	else{
		Isactive = 0;	
	}
	console.log(Isactive);
	 $.ajax({
     	url: "Changecheckbox",
     	method : "POST",
		type : "JSON",
         data: {		
         			"Isactive" : Isactive,
         			"userId" : userId
         		},
         success: function(data){
             //console.log(data); 
 	}
  }) ;
}
</script>
<script>
$(document).ready(function(){
	var t = $('#myTable').DataTable({
	 	"bPaginate": true,
	  	"bLengthChange": true,
	  	"bFilter": true,
	  	"bInfo": true,
	  	"bAutoWidth": true,
			language: {
 				search: " ",
	        	searchPlaceholder: "Search" 
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
	});
</script>