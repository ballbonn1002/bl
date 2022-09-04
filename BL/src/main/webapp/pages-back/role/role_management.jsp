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
    <h1 class="page-title">Role Management</h1>
    <div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0)">Authority</a></li>
            <li class="breadcrumb-item active" aria-current="page">Role Management</li>
        </ol>
    </div>
</div>
<!-- PAGE-HEADER END -->

<div class="row row-cards">
    <div class="col-lg-12 col-xl-12">
    <perm:permission object="authority.role_management.view">
        <div class="card">
        	<div class="card-header">
        		<div class="card-title">Role</div>
        		<perm:permission object="authority.role_management.create_update">
        
                                    <div class="card-options">
                                        <button data-toggle="modal" data-target="#addSys_role" class="btn btn-success " style="margin-bottom: 30px;">&nbsp;Add Role</button>
                                    </div>
                              
                 </perm:permission>           
                                    
        	</div>
            <div class="card-body">
						<!-- Modal -->
						<div class="modal fade"  id="addSys_role" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content" >
								<form  method="POST" action="saveSys_role" id="form">
								<div class="modal-header">
									<span>
										<h6 class="title">Add Role</h6>
									</span>
									<span>
										<div class="col-md-3 col-sm-4 " data-dismiss="modal" ><i class="fa fa-times" style="color:#CED4DA;"></i></div>
									</span>
								</div>	
									<div class="modal-body">
									
									<div class="col-md-12 ">
                        		   <div class="form-group mb-4" >
                               	 	<div class="mb-2 " >Name<span style="color:red;"> *</span></div> 
                               		 <div class="input-group mb-12">
                                    	<input class="form-control"  type="text"  name="Name"  placeholder="Name" id="nameChk" onkeyup="myFunction()" required>
                                   
                                    
                                	</div>
                             	 </div> 
                        		  	 <div  style="display:none;" id="error">
										<i class="fa fa-check-circle-o" style="color:#E7505A; ">&nbsp; You can not use this name</i>
									</div>
									<div  style="display:none;" id="pass">
										<i class="fa fa-check-circle-o" style="color:#28A745; ">&nbsp; You can  use this name</i>
									</div>
									<div  style="display:none;" id="empty">
										<i class="fa fa-check-circle-o" style="color:#E7505A; ">&nbsp; Please enter your name</i>
									</div>
									
									<div class="form-group mb-4" >
                               	 	<div class="mb-2">Description</div> 
                               		 <div class="input-group mb-12">
                                    	<input  class="form-control"  type="text"  name="Description" placeholder="Descripttion" >
                                    
                                	</div>
                             	 </div>
									</div>
									</div>
									 <div class="modal-footer" >
							                <button type="reset" class="btn btn-outline-secondary" data-dismiss="modal" style="width:96px;">cancel</button>
							                <button type="submit" class="btn btn-success" id="btn1" style="width:96px;" >save</button>
							             
    
							         </div>
								</form>
								</div>
							</div>
						</div>
				<!-- END MODAL -->
                   
                          
                            <div class="table-responsive">

 
                                <table  class="table table-sm table-hover border-top table-bordered mb-0" id="myTable">
                                    <thead>
                                        <tr>
                                            <th style="text-align: left; width: 20%">#</th>
                                            <th style="text-align: left; width: 30% ">Name</th>
                                            <th style="text-align: left; width: 30% ">Discription</th>
                                            <th style="width: 20% "> </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="test" items="${sys_roleList }">  
                                    		<tr>
                                    			<td style= "text-align: left; padding-left: 20px"> </td>
												<td style="text-align: left; padding-top: 10px;">${test.name}</td>
												<td style="text-align: left; padding-top: 10px;">${test.description}</td>
												
											    <td style="text-align:right;">      
											    <perm:permission object="authority.role_management.create_update">                                 
				                                        <a style="text-align: center;" class="btn btn-outline-success" title="" href="edit_SysRole?sys_role_id=${test.sys_role_id}">
				                                        	<i class="fa fa-pencil"></i>
				                                        </a>
				                                </perm:permission>
				                                <perm:permission object="authority.role_management.delete">
				                                         <a class="btn btn-outline-danger sred-intense " title="Delete"
                                        					onclick="del('${test.sys_role_id}')" >
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

 <script >
function del(id){
	swal({
	      title: "Are you sure!",
	      text: "You will be deleting this id!",
	      type: "warning",
	      showCancelButton: true,
	      confirmButtonClass: 'btn-primary',
	      confirmButtonText: 'OK'
    }, function (inputValue) {
        if (inputValue === false) return false;
        if (inputValue === "") {
          return false
        }
        document.location = "delete_SysRole?sys_role_id="+id;   //?id คือ parameter
      });
};
</script>
<script>
function myFunction() {
	  var x = $("#nameChk").val();
	  console.log(x);
	  if(x != ""){
	    	$.ajax({
				url : "findName",
				method : "POST",
				type : "JSON",
				data : {
					"value" : x
				},
				success : function(data) {
					console.log(data);
					if (data.toString().indexOf("1") != -1) {
						$("#pass").hide();
						$("#error").show();
						$("#empty").hide();
						$(':input[type="submit"]').prop('disabled', true);
					}
					 else {
						$("#pass").show();
						$("#error").hide();
						$("#empty").hide();
						$(':input[type="submit"]').prop('disabled', false);
					}

				}
			})
	    }else{
	    	$("#pass").hide();
			$("#error").hide();
			$("#empty").show();
			$(':input[type="submit"]').prop('disabled', false);
		}
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
	
	document.onkeydown = function (e) {
		  if (e.keyCode === 116) {
		    return false;
		  }
		};
		
});
</script>