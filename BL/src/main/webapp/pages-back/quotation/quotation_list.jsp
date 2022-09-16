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
					<a href="quotation_add" class="btn btn-primary btn-sm">Add Quotation</a>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered text-nowrap border-bottom dataTable no-footer" id="responsive-datatable">
						<thead>
                        	<tr>
		                        <th class= "border-bottom-0">Quotation_id</th>
		                        <th class=" border-bottom-0">Customer Name</th>
		                        <th class="border-bottom-0">date issue</th>
		                        <th class="border-bottom-0">date</th>
		                        <th class="border-bottom-0">total</th>
		                        <th class="border-bottom-0">sale</th>
		                        <th class="border-bottom-0">status</th>
		                        <th class=""></th>
		                        
                        	</tr>
                        </thead>
                        <tbody>
                        	<tr>
                                                        <td>Bella</td>
                                                        <td>Chloe</td>
                                                        <td>System Developer</td>
                                                        <td>2018/03/12</td>
                                                        <td>$654,765</td>
                                                        <td>b.Chloe@datatables.net</td>
                                                        <td>b.Chloe@datatables.net</td>
                                                        <td>
                                                        	<div style="text-align: center;">
                             <button type="button" class="btn btn-icon btn-primary btn-sm"><i class="fe fe-edit"></i></button>
                            <button type="button" onclick="del()" class="btn btn-icon btn-danger btn-sm"><i class="fe fe-trash-2"></i></button>
                         </div>
                                                                                </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Donna</td>
                                                        <td>Bond</td>
                                                        <td>Account Manager</td>
                                                        <td>2012/02/21</td>
                                                        <td>$543,654</td>
                                                        <td>d.bond@datatables.net</td>
                                                        <td>b.Chloe@datatables.net</td>
                                                         <td>
                             <button type="button" class="btn btn-icon btn-primary btn-sm"><i class="fe fe-edit"></i></button>
                            <button type="button" onclick="del()" class="btn btn-icon btn-danger btn-sm"><i class="fe fe-trash-2"></i></button>
                                                                                </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Harry</td>
                                                        <td>Carr</td>
                                                        <td>Technical Manager</td>
                                                        <td>20011/02/87</td>
                                                        <td>$86,000</td>
                                                        <td>h.carr@datatables.net</td>
                                                        <td>b.Chloe@datatables.net</td>
                                                         <td>  <button type="button" class="btn btn-icon btn-primary btn-sm"><i class="fe fe-edit"></i></button>
                            <button type="button" onclick="del()" class="btn btn-icon btn-danger btn-sm"><i class="fe fe-trash-2"></i></button>
				                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Lucas</td>
                                                        <td>Dyer</td>
                                                        <td>Javascript Developer</td>
                                                        <td>2014/08/23</td>
                                                        <td>$456,123</td>
                                                        <td>l.dyer@datatables.net</td>
                                                        <td>b.Chloe@datatables.net</td>
                                                         <td> <button type="button" class="btn btn-icon btn-primary btn-sm"><i class="fe fe-edit"></i></button>
                            <button type="button" onclick="del()" class="btn btn-icon btn-danger btn-sm"><i class="fe fe-trash-2"></i></button>
				                                        </td>
                                                    </tr>
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
function del(){
        Swal.fire({
            title: 'Are you sure?',
            text: "You will be deleting this id!",
            icon: 'error',
            showDenyButton: true,
            denyButtonText: 'Cancel',
            confirmButtonText: 'Confirm',

            reverseButtons: true,
    }, function (inputValue) {
        if (inputValue === false) return false;
        if (inputValue === "") {
          return false
        }
      });
};
</script>