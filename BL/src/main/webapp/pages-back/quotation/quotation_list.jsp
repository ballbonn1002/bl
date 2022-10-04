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

.head-ml{
	margin-left: -10px;
}

</style>

<!-- PAGE-HEADER -->
<div class="page-header">
    <h1 class="page-title">Quotation List</h1>
    <div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0)">Quotation</a></li>
            <li class="breadcrumb-item active" aria-current="page">Quotation List</li>
        </ol>
    </div>
</div>
<!-- PAGE-HEADER END -->
<div class="row row-cards">
	<div class="col-lg-12 col-xl-12">
		<div class="card">
			<div class="card-header">
				<div class="card-title">Quotation List</div>
				<div class="card-options">
					<div class="card-options"><a href="quotation_add" class="btn btn-primary"><i class="ion-plus-round">&nbsp;</i>Create Quotation</a></div>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered text-nowrap table-hover border-bottom dataTable no-footer myTable" id="">
						<thead>
                        	<tr>
		                        <th class= "border-bottom-0">Quotation_id</th>
		                        <th class=" border-bottom-0">Customer Name</th>
		                        <th class="border-bottom-0">Create Date</th>
		                        <th class="border-bottom-0">Due Date</th>
		                        <th class="border-bottom-0">Status</th>
		                        <th class="border-bottom-0">sale</th>
		                        <th class="border-bottom-0">Action</th>
                        	</tr>
                        </thead>
                        <tbody>
                        <c:forEach var="quotation" items="${quotationList}">
                        <tr>
                        	<td>${quotation.quotation_id}</td>
                        	<td>${quotation.company_name}</td>
                        	<td><fmt:formatDate value="${quotation.create_date}" pattern="dd MMM yyyy"></fmt:formatDate></td>
                        	<td><fmt:formatDate value="${quotation.end_date}" pattern="dd MMM yyyy"></fmt:formatDate></td>
                        	<td>
                        		<c:if test ="${quotation.quotation_status == 0}"><span class="badge bg-danger-transparent rounded-pill text-danger p-2 px-3">Reject</span></c:if>
                        		<c:if test ="${quotation.quotation_status == 1}"><span class="badge bg-primary-transparent rounded-pill text-info p-2 px-3">In Progress</span></c:if>
                        		<c:if test ="${quotation.quotation_status == 2}"><span class="badge bg-warning-transparent rounded-pill text-warning p-2 px-3">Waiting Approvaled</span></c:if>
                        		<c:if test ="${quotation.quotation_status == 3}"><span class="badge bg-success-transparent rounded-pill text-success p-2 px-3">Approvaled</span></c:if>
                        		<c:if test ="${quotation.quotation_status == 4}"><span class="badge bg-default rounded-pill text-text p-2 px-3">Return</span></c:if>
                        	</td>
                        	<td>${quotation.saleperson}</td>
                        	<td>
                        		<div style="text-align: center;">
	                         		<div class="g-2">
	                           			 <a href="edit_quotation?id=${quotation.quotation_id}" class="btn text-primary btn-sm" data-bs-toggle="tooltip" data-bs-original-title="Edit">
	                            		<span class="fe fe-edit fs-18"></span></a>
	                           			 <a class="btn text-danger btn-sm" data-bs-toggle="tooltip" onclick="del('${quotation.quotation_id}')" data-bs-original-title="Delete">
	                           	 		<span class="fe fe-trash-2 fs-18"></span></a>
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
	</div>
</div>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script>
function del(id){
	console.log(id);
	Swal.fire({
        title: 'Are you sure?',
        text: "You will be deleting this id!",
        icon: 'error',
        showDenyButton: true,
        denyButtonText: `Cancel`,
        reverseButtons: true,
      }).then((result) => {
            if (result.isConfirmed) {
              $.ajax({
                  method : "POST",
                  url: "quotation_delete",
                  type: "JSON",
                  data : {
                      "quotation_id" : id
                  },
                  success : function(data){
                      console.log(data);
                      window.location.reload(true);
                  }
              })
            } 
            else if (result.isDenied) {
                
            }
  })
}
</script>
<script>
$(document).ready(function(){
	var t = $('.myTable').DataTable({
	     "bPaginate": true,
	      "bLengthChange": true,
	      "bFilter": true,
	      "bInfo": true,
	      "bAutoWidth": true,
	      "ordering": true,
	        language: {
	            search: " ",
	            searchPlaceholder: "Search..." 
	           } ,
	        columnDefs: [
	           {
	            	targets:6,
	            	orderable: false
	            }
	        ]
	    });
	    
	    //$('div#DataTables_Table_2_filter').prepend('<div class="row" id="test1"></div>');
	    //$("label ").prependTo("#destination");
	});
</script>