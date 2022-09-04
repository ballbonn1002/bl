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
    <h1 class="page-title">User Management</h1>
    <div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0)">Authority</a></li>
            <li class="breadcrumb-item active" aria-current="page">System User Management</li>
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
				     <div class="card-options"><a href="SystemUser_add" class="btn btn-success">Add System User</a></div>
				</perm:permission>
			</div>
			<div class="card-body">
						<div class="table-responsive">
							<table  class="table table-sm table-hover border-top table-bordered mb-0 id = "myTable">
								<thead>
									<tr>
										<th style="text-align: left; width: 10%">#</th>
										<th style="text-align: left; width: 20%">User ID</th>
										<th style="text-align: left; width: 20%">Role</th>
										<th style="text-align: left; width: 20%">Name</th>
										<th style="text-align: center; width: 20% ">Is Active</th>
										<th style="text-align: left; width: 10%"> </th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="sysuser" items="${sysuserList}">
										<tr>
											<td style="text-align: left; padding-left: 20px "> </td>
											<td style="text-align: left; padding-top: 10px;">${sysuser.sys_user_id}</td>
											<td style="text-align: left; padding-top: 10px;">${sysuser.sys_role_id}</td>
											<td style="text-align: left; padding-top: 10px;">${sysuser.name_th}</td>
											<td style="align-item: center;" data-order="${sysuser.is_active}">
													<div class="md-checkbox" style="margin-left: 45%;">
														<input id="${sysuser.sys_user_id}" type="checkbox" class="md-check status" onchange = "Change('${sysuser.sys_user_id}')"
														<c:if test ="${fn:contains(sysuser.is_active, '1')}">checked</c:if>>
													</div>
											</td>
											<td style="text-align:right;">       
											<perm:permission object="authority.system_user.create_update">                                     
                                        		<a id="edit" class="btn btn-outline-success" title="Edit" href="sysuser_edit?sysuser_id=${sysuser.sys_user_id}">
                                        		<i class="fa fa-pencil"></i></a>
                                        	</perm:permission>
                                        	<perm:permission object="authority.system_user.delete">
                                        		<a class="btn btn-outline-danger sred-intense" title="Delete"
                                        			onclick="del('${sysuser.sys_user_id}')">
                                        		<i class="fa fa-trash-o"></i></a>
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
function del(id){
	swal({
	      title: "Are you sure!",
	      text: "You will be deleting this id!",
	      type: "info",
	      showCancelButton: true,
	      confirmButtonClass: 'btn-primary',
	      confirmButtonText: 'OK'
    }, function (inputValue) {
        if (inputValue === false) return false;
        if (inputValue === "") {
          return false
        }
        document.location = "sysuser_delete?sys_user_id="+id   //?id คือ parameter
      });
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