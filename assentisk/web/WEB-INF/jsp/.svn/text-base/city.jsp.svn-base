<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">
  
   <link href="css/font-awesome.css" rel="stylesheet">
   <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>        
<script src="js/angular.min.js"></script>
  <title>Assentisk</title>

  <link href="css/custom.css" rel="stylesheet">

 <script type="text/javascript">
 
var rowID;
var sortingOrder = 'CityID';
function cityController($scope,$http,$filter) {
$("div.leftpanelinner>ul>li#group").css("background","#003366");
    			$("div.leftpanelinner>ul>li#group>a").css("color","white");
    		    $("div.leftpanelinner>ul>li#group>a>span").css("color","white");
			$("div.leftpanelinner>ul>li#master").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#master>ul").css("display","block");
			$("div.leftpanelinner>ul>li#master>ul>li#city").addClass("active");



    $scope.sortingOrder = sortingOrder;
    $scope.reverse = false; 
    $scope.filteredItems = [];
    $scope.groupedItems = [];
    $scope.itemsPerPage = 15;
    $scope.pagedItems = [];
    $scope.currentPage = 0;
  	$http.get('cityList.master.htm').
    success(function(data, status, headers, config) {
    $scope.items = data.cityBean;
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
cityController.$inject = ['$scope','$http','$filter'];  
  
function confirmRow(id)
{
	rowID = id;
	$('#divConfirmAlert').show();


}
function deleteRow(action)
{	
	
	if(action == 'yes')
	{
		$('#divConfirmAlert').delay(1000).fadeOut('slow');		
		$.get("deleteCity.master.htm?id="+rowID,function(data,status){ location.reload(true);});
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
      <h2><c:out value="${sessionScope.City_Header}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
          <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.City_Header}"/></li>
        </ol>
      </div>
    </div>

    <div class="contentpanel">
   <div ng-app="" ng-controller="cityController">
    <c:if test="${sessionScope.add_mod_36=='1'}">  
   <a class="btn btn-success" href="addcity.master.htm" title="Add" style="margin-bottom:10px;"><i class="fa fa-plus"></i></a>
   </c:if>
            <div class="input-append">
                <input type="text" ng-model="query" ng-change="search()" class="input-large search-query" placeholder="Search">
            <span class="add-on"><i class="icon-search"></i></span>
            </div></br>
    		 <table class="table table-striped table-condensed table-hover" id="city">
      			  <thead>
           			 <tr>
              
                  		<th class="CityName">City&nbsp;<a ng-click="sort_by('CityName')"><i class="icon-sort"></i></a></th>
                  		<th class="StateName">State&nbsp;<a ng-click="sort_by('StateName')"><i class="icon-sort"></i></a></th>
                  		<th class="CountryName">Country&nbsp;<a ng-click="sort_by('CountryName')"><i class="icon-sort"></i></a></th>
<!--                  		<th class="IsActive">IsActive&nbsp;<a ng-click="sort_by('IsActive')"><i class="icon-sort"></i></a></th>                             -->
           			     <th>Action</th>                              
           			
           			 </tr>
       			</thead> 
       
        		<tfoot>
                    <td colspan="6">
                        <div class="pagination pull-right">
                            <ul>
                                <li ng-class="{disabled: currentPage == 0}">
                                    <a href ng-click="prevPage()">« <c:out value="${sessionScope.Footer_previous}"/></a>
                                </li>
                                <li ng-repeat="n in range(pagedItems.length)"
                                    ng-class="{active: n == currentPage}"
                                    ng-click="setPage()">
                                    <a href ng-bind="n + 1">1</a>
                                </li>
                                <li ng-class="{disabled: currentPage == pagedItems.length - 1}">
                                    <a href ng-click="nextPage()"><c:out value="${sessionScope.Footer_next}"/> »</a>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tfoot> 
       <tbody>
            <tr data-ng-repeat="item in pagedItems[currentPage] | orderBy:sortingOrder:reverse">
            	
            		<td>
            				{{item.CityName}}
            		</td>
            		<td>
            				{{item.StateName}}
            		</td>
            		<td>
            				{{item.CountryName}}
            		</td>
<!--            		<td>-->
<!--            				 <div ng-switch on="item.IsActive">-->
<!--   							 <span ng-switch-when="true"><span class="active">Active</span></span>-->
<!--  							 <span ng-switch-when="false"><span class="pending">Inactive</span></span>-->
<!-- 						</div>-->
<!--    						-->
<!--            			    -->
<!--            		</td>-->
            		 <td class="center"> 
            		  <c:if test="${sessionScope.edit_mod_36=='1'}">             		 			
								<a class="btn btn-info" href="editcity.master.htm?cityid={{item.CityID}}" title="Edit"><i class="fa fa-edit "></i></a>
						</c:if>
						  <c:if test="${sessionScope.delete_mod_36=='1'}">            
								<button class="btn btn-danger" onclick="confirmRow({{item.CityID}})" title="Delete"><i class="fa fa-trash-o "></i></button>
						</c:if>
            		 
            		 </td>
            </tr>
         </tbody>    
    </table>

</div>
     
            </div><!-- panel-body -->
          </div><!-- panel -->
       

        
<input type="hidden" id="toggledata" class="form-control" ng-model="toggledata" ng-init='toggledata = "<c:out value="${sessionScope.toggle}"/>"' value="<c:out value="${sessionScope.toggle}"/>">		
 <input type="hidden" name="datasize" id="datasize" value="<c:out value="${datasize}"/>"	>

    

  

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
 		<label> Do you want to delete this row?</label>
         <span > <input type="button" value="Yes" onclick="deleteRow('yes')"/></span>
         <span > <input type="button" value="No" onclick="deleteRow('no')"/></span>
 </div>
 

</body>
</html>
