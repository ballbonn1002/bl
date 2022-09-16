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
<div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h3 class="card-title">Add New Row with Edit Table</h3>
                                    </div>
                                    <div class="card-body">
                                        <button id="table2-new-row-button" class="btn btn-primary mb-4"> Add New Row</button>
                                        <div class="table-responsive">
                                            <table class="table table-bordered border text-nowrap mb-0" id="new-edit">
                                                <thead>
                                                    <tr>
                                                        <th>First name</th>
                                                        <th>Last name</th>
                                                        <th>Position</th>
                                                        <th>Start date</th>
                                                        <th>Salary</th>
                                                        <th>E-mail</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><select  class="form-control form-select select2" data-bs-placeholder="Select Customer">
	                            <option value="br">Brazil</option>
	                            <option value="cz">Czech Republic</option>
	                            <option value="de">Germany</option>
	                            <option value="pl" selected>Poland</option>
                            </select></td>
                                                        <td><select  class="form-control form-select select2" data-bs-placeholder="Select Customer">
	                            <option value="br">Brazil</option>
	                            <option value="cz">Czech Republic</option>
	                            <option value="de">Germany</option>
	                            <option value="pl" selected>Poland</option>
                            </select></td>
                                                        <td>System Developer</td>
                                                        <td>2018/03/12</td>
                                                        <td>$654,765</td>
                                                        <td>b.Chloe@datatables.net</td>
                                                    </tr>
                                                    <tr>
                                                        <td><select  class="form-control form-select select2" data-bs-placeholder="Select Customer">
	                            <option value="br">Brazil</option>
	                            <option value="cz">Czech Republic</option>
	                            <option value="de">Germany</option>
	                            <option value="pl" selected>Poland</option>
                            </select></td>
                                                        <td>Bond</td>
                                                        <td>Account Manager</td>
                                                        <td>2012/02/21</td>
                                                        <td>$543,654</td>
                                                        <td>d.bond@datatables.net</td>
                                                    </tr>
                                                    <tr>
                                                        <td><select  class="form-control form-select select2" data-bs-placeholder="Select Customer">
	                            <option value="br">Brazil</option>
	                            <option value="cz">Czech Republic</option>
	                            <option value="de">Germany</option>
	                            <option value="pl" selected>Poland</option>
                            </select></td>
                                                        <td>Carr</td>
                                                        <td>Technical Manager</td>
                                                        <td>20011/02/87</td>
                                                        <td>$86,000</td>
                                                        <td>h.carr@datatables.net</td>
                                                    </tr>
                                                    <tr>
                                                        <td><select  class="form-control form-select select2" data-bs-placeholder="Select Customer">
	                            <option value="br">Brazil</option>
	                            <option value="cz">Czech Republic</option>
	                            <option value="de">Germany</option>
	                            <option value="pl" selected>Poland</option>
                            </select></td>
                                                        <td>Dyer</td>
                                                        <td>Javascript Developer</td>
                                                        <td>2014/08/23</td>
                                                        <td>$456,123</td>
                                                        <td>l.dyer@datatables.net</td>
                                                    </tr>
                                                    <tr>
                                                        <td><select  class="form-control form-select select2" data-bs-placeholder="Select Customer">
	                            <option value="br">Brazil</option>
	                            <option value="cz">Czech Republic</option>
	                            <option value="de">Germany</option>
	                            <option value="pl" selected>Poland</option>
                            </select></td>
                                                        <td>Hill</td>
                                                        <td>Sales Manager</td>
                                                        <td>2010/7/14</td>
                                                        <td>$432,230</td>
                                                        <td>k.hill@datatables.net</td>
                                                    </tr>
                                                    <tr>
                                                        <td><select  class="form-control form-select select2" data-bs-placeholder="Select Customer">
	                            <option value="br">Brazil</option>
	                            <option value="cz">Czech Republic</option>
	                            <option value="de">Germany</option>
	                            <option value="pl" selected>Poland</option>
                            </select></td>
                                                        <td>Hudson</td>
                                                        <td>Sales Assistant</td>
                                                        <td>2015/10/16</td>
                                                        <td>$654,300</td>
                                                        <td>d.hudson@datatables.net</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>