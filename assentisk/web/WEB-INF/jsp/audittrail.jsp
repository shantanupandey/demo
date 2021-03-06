<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">
   <link href="css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
   <link href="css/font-awesome.css" rel="stylesheet">
   <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>        
<script src="js/angular.min.js"></script>
  <title>Assentisk</title>

  <link href="css/custom.css" rel="stylesheet">

 <script type="text/javascript">

var rowID;
 var sortingOrder = 'DepartmentID';
function departmentController($scope,$http,$filter) {

			$("div.leftpanelinner>ul>li#organization").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#organization>ul").css("display","block");
			$("div.leftpanelinner>ul>li#organization>ul>li#department").addClass("active");
    $scope.sortingOrder = sortingOrder;
    $scope.reverse = false; 
    $scope.filteredItems = [];
    $scope.groupedItems = [];
    $scope.itemsPerPage = 15;
    $scope.pagedItems = [];
    $scope.currentPage = 0;
  	$http.get('auditTrailList.org.htm').
    success(function(data, status, headers, config) {
    $scope.items = data.auditTrail;
     $("#imageloader").css("display", "none");
      $("#complete").css("display", "block");
                         var searchMatch = function (haystack, needle) {
        if (!needle) {
            return true;
        }
        return haystack.toString().toLowerCase().indexOf(needle.toLowerCase()) !== -1;
    };

    // init the filtered items
    $scope.search = function () {
        $scope.filteredItems = $filter('filter')($scope.items, function (item) {
            for(var attr in item) {
                if (searchMatch(item[attr], $scope.query))
                    return true;
            }
            return false;
        });
        // take care of the sorting order
        if ($scope.sortingOrder !== '') {
            $scope.filteredItems = $filter('orderBy')($scope.filteredItems, $scope.sortingOrder, $scope.reverse);
        }
        $scope.currentPage = 0;
        // now group by pages
        $scope.groupToPages();
    };
    
    // calculate page in place
    $scope.groupToPages = function () {
        $scope.pagedItems = [];
        
        for (var i = 0; i < $scope.filteredItems.length; i++) {
            if (i % $scope.itemsPerPage === 0) {
                $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)] = [ $scope.filteredItems[i] ];
            } else {
                $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)].push($scope.filteredItems[i]);
            }
        }
    };
    
    $scope.range = function (start, end) {
        var ret = [];
        if (!end) {
            end = start;
            start = 0;
        }
        for (var i = start; i < end; i++) {
            ret.push(i);
        }
        return ret;
    };
    
    $scope.prevPage = function () {
        if ($scope.currentPage > 0) {
            $scope.currentPage--;
        }
    };
    
    $scope.nextPage = function () {
        if ($scope.currentPage < $scope.pagedItems.length - 1) {
            $scope.currentPage++;
        }
    };
    
    $scope.setPage = function () {
        $scope.currentPage = this.n;
    };

    // functions have been describe process the data for display
    $scope.search();

    // change sorting order
    $scope.sort_by = function(newSortingOrder) {
        if ($scope.sortingOrder == newSortingOrder)
            $scope.reverse = !$scope.reverse;

        $scope.sortingOrder = newSortingOrder;

        // icon setup
      /*  $('th i').each(function(){
            // icon reset
            alert("inside th i");
            $(".CountryName").removeClass().addClass('icon-sort');
        });
        if ($scope.reverse)
            $('th.'+new_sorting_order+' i').removeClass().addClass('icon-chevron-up');
        else
            $('th.'+new_sorting_order+' i').removeClass().addClass('icon-chevron-down');*/
    };
    }).
    error(function(data, status, headers, config) {
      // log error
    });
 
}
departmentController.$inject = ['$scope','$http','$filter'];  

function confirmRow(id)
{
	rowID = id;
	$('#divConfirmAlert').show();


}
function deleteRow(action)
{	
	if(action == 'yes')
	{	
		$('#divConfirmAlert').delay(1500).fadeOut('slow');		
		$.get("deleteDepartment.org.htm?id="+rowID,function(data,status){ location.reload(true);});
	}
	else
	{
		$('#divConfirmAlert').hide();
	}
}
</script>
</head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">

<section>
 
<%@include file="leftpanel.jsp" %>
  <div class="mainpanel">
   <%@include file="header.jsp" %>

    <div class="pageheader">
      <h2>Audit Trail</h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
     <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.Department_Header}"/></li>
        </ol>
      </div>
    </div>

    <div class="contentpanel">
   <div ng-app="" ng-controller="departmentController">
   		 
            <div class="input-append">
                <input type="text" ng-model="query" ng-change="search()" class="input-large search-query" placeholder="Search">
            <span class="add-on"><i class="icon-search"></i></span>
            </div></br>
    		 <table class="table table-striped table-condensed table-hover" id="department">
      			  <thead>
           			 <tr>
                                		                  		
						<th class="BranchName">EmpName&nbsp;<a ng-click="sort_by('EmpName')"><i class="icon-sort"></i></a></th>                  	    
                  	    <th class="DeptName">AuditTrailID&nbsp;<a ng-click="sort_by('AuditTrailID')"><i class="icon-sort"></i></a></th>
                  	    <th class="DeptDesc">TableName&nbsp;<a ng-click="sort_by('TableName')"><i class="icon-sort"></i></a></th>
                  	    <th class="BranchName">ColumnName&nbsp;<a ng-click="sort_by('ColumnName')"><i class="icon-sort"></i></a></th>                  	                      		                             
           			    <th class="DeptName">RowID&nbsp;<a ng-click="sort_by('RowID')"><i class="icon-sort"></i></a></th>
                  	    <th class="DeptDesc">OldValue&nbsp;<a ng-click="sort_by('OldValue')"><i class="icon-sort"></i></a></th>
                  	    <th class="BranchName">NewValue&nbsp;<a ng-click="sort_by('NewValue')"><i class="icon-sort"></i></a></th> 
                  	    <th class="DeptName">Action&nbsp;<a ng-click="sort_by('Action')"><i class="icon-sort"></i></a></th>
                  	    <th class="DeptDesc">ChangedDate&nbsp;<a ng-click="sort_by('ChangedDate')"><i class="icon-sort"></i></a></th>
                  	    <!--<th class="BranchName">ChangedBy&nbsp;<a ng-click="sort_by('ChangedBy')"><i class="icon-sort"></i></a></th> 
           			    --><th class="BranchName">IPAddress&nbsp;<a ng-click="sort_by('IPAddress')"><i class="icon-sort"></i></a></th>
           			 </tr>
       			</thead> 
       
        		<tfoot>
                    <td colspan="10">
                        <div class="pagination pull-right">
                            <ul>
                                <li ng-class="{disabled: currentPage == 0}">
                                    <a href ng-click="prevPage()">� <c:out value="${sessionScope.Footer_previous}"/></a>
                                </li>
                                <!--
                                <li ng-repeat="n in range(pagedItems.length)"
                                    ng-class="{active: n == currentPage}"
                                    ng-click="setPage()">
                                    <a href ng-bind="n + 1">1</a>
                                </li>
                                -->
                                
                                <li ng-class="{disabled: currentPage == pagedItems.length - 1}">
                                    <a href ng-click="nextPage()"><c:out value="${sessionScope.Footer_next}"/> �</a>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tfoot> 
       <tbody>
            <tr data-ng-repeat="item in pagedItems[currentPage] | orderBy:sortingOrder:reverse">

					<td>
            				{{item.EmpName}}
            		</td>
            		<td>
            				{{item.AuditTrailID}}
            		</td>
            		<td>
            				{{item.TableName}}
            		</td>
            		<td>
            				{{item.ColumnName}}
            		</td>
            		<td>
            				{{item.RowID}}
            		</td>
            		<td>
            				{{item.OldValue}}
            		</td>
            		<td>
            				{{item.NewValue}}
            		</td>
            		<td>
            				{{item.Action}}
            		</td>
            		<td>
            				{{item.ChangedDate}}
            		</td>
            		<!--<td>
            				{{item.ChangedBy}}
            		</td>
            		--><td>
            				{{item.IPAddress}}
            		</td>
            		
            		
            		            	
            		 
            </tr>
         </tbody>    
    </table>

</div>
     
            </div><!-- panel-body -->
          </div><!-- panel -->
       

        

    

  

</section>


<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.custom.min.js"></script>
<script src="js/toggles.min.js"></script>
<script src="js/jquery.cookies.js"></script>
<script src="js/left-menu.js"></script>

<div  id="divConfirmAlert" class="error2">
 		<label> <c:out value="${sessionScope.deleteRow}"/></label>
         <span > <input type="button" value="Yes" onclick="deleteRow('yes')"/></span>
         <span > <input type="button" value="No" onclick="deleteRow('no')"/></span>
 </div>


</body>
</html>
