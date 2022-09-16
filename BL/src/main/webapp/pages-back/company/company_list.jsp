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
tr{    
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 2s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
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
		<div class="card-title">Company Management</div>
			<div class="card-options"><a href="company_add" class="btn btn-primary"><i class="ion-plus-round">&nbsp;</i>Create Company</a></div>
	</div>
	<div class="card-body">
	<div class="table-responsive">
			<table  class="table table-bordered text-nowrap mb-0 myTable">
				<thead class="border-top">
					<tr>
						<th class="bg-transparent border-bottom-0" style="text-align: center; width: 7%;"> #</th>
						<th class="bg-transparent border-bottom-0" style="text-align: left; width: 33%">Company Name</th>
						<th class="bg-transparent border-bottom-0" style="text-align: left; width: 20%">Company_code</th>
						<th class="bg-transparent border-bottom-0" style="text-align: left; width: 20%">status</th>
						<th class="bg-transparent border-bottom-0" style="text-align: left; width: 10%">Is_active</th>
						<th class="bg-transparent border-bottom-0" style="text-align: left; width: 10%">Action</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="com" items="${companyList}">
					<tr>
						<td style="text-align: center;"> </td>
						<td>${com.company_en}</td>
						<td>${com.company_code}</td>
						<td><c:choose>
							<c:when test="${com.status == 0}">Customers</c:when>
							<c:when test="${com.status == 1}">Partners</c:when>
							<c:when test="${com.status == 2}">Financial</c:when>
							<c:when test="${com.status == 3}">Legal</c:when>
							<c:when test="${com.status == 4}">Leadership and Peer Mentors</c:when>
							<c:when test="${com.status == 5}">Employees</c:when>
						</c:choose></td>
						<td><label class="custom-control custom-checkbox" style="margin-left: 45%;">
                           <input id="${com.company_id}" type="checkbox" class="custom-control-input"  onchange = "Change('${com.company_id}')"
    						<c:if test ="${com.is_active == 1}">checked</c:if>>
    						<span class="custom-control-label"></span>
						</label></td>
						<td>
                         <div style="text-align: center;">
                         <div class="g-2">
                            <a href="EditCompany?id=${com.company_id}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="Edit">
                            	<span class="fe fe-edit fs-14"></span></a>
                            <a class="btn text-danger btn-sm" data-bs-toggle="tooltip" onclick="del('${com.company_id}')" data-bs-original-title="Delete">
                           	 	<span class="fe fe-trash-2 fs-14"></span></a>
                         </div>
                         </div>
                         </td>
					</tr>
				</c:forEach>   
				</tbody>
			</table>
	</div>
	</div>
</div>
<script>
function del(id){
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
                	document.location = "company_delete?id="+id
                }
                else if (result.isDenied) {
                    return false;
                }
      });
};
</script>
<script>
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
<script>
function Change(CompanyID){
	var y = document.getElementById(CompanyID);
	var Isactive;
	if(y.checked){
		Isactive = 1; 
	}
	else{
		Isactive = 0;	
	}
	console.log(Isactive);
	 $.ajax({
     	url: "CheckboxCompanyList",
     	method : "POST",
		type : "JSON",
         data: {		
         			"Isactive" : Isactive,
         			"CompanyID" : CompanyID
         		},
         success: function(data){
         console.log(data); 
 	}
  }) ;
}
</script>