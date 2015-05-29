<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/favicon.ico">
  
   <link href="css/font-awesome.css" rel="stylesheet">
   <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>        
<script src="js/angular.min.js"></script>
  <title>Assentisk</title>

  <link href="css/custom.css" rel="stylesheet">
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
 <script type="text/javascript">
 
var rowID;
var sortingOrder = 'CityID';
function cityController($scope,$http,$filter) {

			$("div.leftpanelinner>ul>li#master").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#master>ul").css("display","block");
			$("div.leftpanelinner>ul>li#master>ul>li#vendorCat").addClass("active");



    $scope.sortingOrder = sortingOrder;
    $scope.reverse = false; 
    $scope.filteredItems = [];
    $scope.groupedItems = [];
    $scope.itemsPerPage = 15;
    $scope.pagedItems = [];
    $scope.currentPage = 0;
  	$http.get('vendorcategorylist.master.htm').
    success(function(data, status, headers, config) {
    $scope.items = data.vendorCategoryBeans;
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
		$.get("deletevendorcat.master.htm?id="+rowID,function(data,status){ location.reload(true);});
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
			
					<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>
					<div class="mainpanel">
						<%@include file="/WEB-INF/jsp/header.jsp"%>
			
						<div class="pageheader">
							<h2>
								<c:out value="${sessionScope.Vendors_header}"/>
							</h2>
							<div class="breadcrumb-wrapper">
								<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
								<ol class="breadcrumb">
									<li>
										<a href="dashboard.login.htm">Assentisk</a>
									</li>
									<li class="active">
										<c:out value="${sessionScope.Vendors_header}"/>
									</li>
								</ol>
							</div>
						</div>
			
						<div class="contentpanel">
							<div ng-app="" ng-controller="cityController">
								<c:if test="${sessionScope.add_mod_37=='1'}">
									<a class="btn btn-success" href="addvendorcat.master.htm" title="<c:out value="${sessionScope.tooltip_add}"/>"
										style="margin-bottom: 10px;"><c:out value="${sessionScope.tooltip_add}"/>&nbsp;&nbsp;<i class="fa fa-plus"></i>
									</a>
								</c:if>
								<div class="input-append">
									<input type="text" ng-model="query" ng-change="search()"
										class="input-large search-query" placeholder="<c:out value="${sessionScope.toolip_search}"/>">
									<span class="add-on"><i class="icon-search"></i>
									</span>
								</div>
								</br>
							<div class="content demo-x">
								
								<table class="table table-striped table-condensed table-hover"
									id="city">
									<thead>
										<tr>
			
											<th class="VendorCatName"  style="min-width:900px;max-width:900px;">
												
												<a ng-click="sort_by('VendorCatName')"><i class="icon-sort"></i><c:out value="${sessionScope.vendor_name}"/>
												</a>
											</th>
<!--											<th class="IsActive">-->
<!--												IsActive&nbsp;-->
<!--												<a ng-click="sort_by('IsActive')"><i class="icon-sort"></i>-->
<!--												</a>-->
<!--											</th>-->
											<th style="min-width:200px;max-width:200px;">
												<c:out value="${sessionScope.vendor_action}"/>
											</th>
			
										</tr>
									</thead>
			
									<tfoot>
										<td colspan="6">
											<div class="pagination pull-right"  style="height:auto;">
												<ul>
													<li ng-class="{disabled: currentPage == 0}">
														<a href ng-click="prevPage()">� <c:out value="${sessionScope.Footer_previous}"/></a>
													</li>
													<li ng-repeat="n in range(pagedItems.length)"
														ng-class="{active: n == currentPage}" ng-click="setPage()">
														<a href ng-bind="n + 1">1</a>
													</li>
													<li
														ng-class="{disabled: currentPage == pagedItems.length - 1}">
														<a href ng-click="nextPage()"><c:out value="${sessionScope.Footer_next}"/> �</a>
													</li>
												</ul>
											</div>
										</td>
									</tfoot>
									<tbody>
										<tr
											data-ng-repeat="item in pagedItems[currentPage] | orderBy:sortingOrder:reverse">
			
											<td style="min-width:900px;max-width:900px;word-wrap:break-word;">
												{{item.VendorCatName}}
											</td>
			
<!--											<td>-->
<!--												<div ng-switch on="item.IsActive">-->
<!--													<span ng-switch-when="true"><span class="active">Active</span>-->
<!--													</span>-->
<!--													<span ng-switch-when="false"><span class="pending">Inactive</span>-->
<!--													</span>-->
<!--												</div>-->
<!--			-->
<!--			-->
<!--											</td>-->
											<td class="center" style="min-width:200px;max-width:200px;word-wrap:break-word;">
												<c:if test="${sessionScope.edit_mod_37=='1'}">
													<a class="btn btn-info"
														href="editvendorcat.master.htm?vendorid={{item.id}}"
														title="<c:out value="${sessionScope.tooltip_edit}"/>"><i class="fa fa-edit "></i>
													</a>
												</c:if>
												<c:if test="${sessionScope.delete_mod_37=='1'}">
													<button class="btn btn-danger"
														onclick="confirmRow({{item.id}})" title="<c:out value="${sessionScope.tooltip_delete}"/>">
														<i class="fa fa-trash-o "></i>
													</button>
												</c:if>
			
											</td>
										</tr>
									</tbody>
								</table>
							
							</div>
			</div>
						</div>
						<!-- panel-body -->
					</div>
					<!-- panel -->
			
			
			
			
 <input type="hidden" id="toggledata" class="form-control" ng-model="toggledata" ng-init='toggledata = "<c:out value="${sessionScope.toggle}"/>"' value="<c:out value="${sessionScope.toggle}"/>">			
			
			
			
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
			
				<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
		(function($){
			$(window).load(function(){
				var flag=false;
				$.mCustomScrollbar.defaults.theme="light-2"; //set "light-2" as the default theme
				
				$(".demo-y").mCustomScrollbar();
				
				$(".demo-x").mCustomScrollbar({
					axis:"x",
					advanced:{autoExpandHorizontalScroll:true}
				});
				
				$(".demo-yx").mCustomScrollbar({
					axis:"yx"
				});
				
				$(".scrollTo a").click(function(e){
					e.preventDefault();
					var $this=$(this),
						rel=$this.attr("rel"),
						el=rel==="content-y" ? ".demo-y" : rel==="content-x" ? ".demo-x" : ".demo-yx",
						data=$this.data("scroll-to"),
						href=$this.attr("href").split(/#(.+)/)[1],
						to=data ? $(el).find(".mCSB_container").find(data) : el===".demo-yx" ? eval("("+href+")") : href,
						output=$("#info > p code"),
						outputTXTdata=el===".demo-yx" ? data : "'"+data+"'",
						outputTXThref=el===".demo-yx" ? href : "'"+href+"'",
						outputTXT=data ? "$('"+el+"').find('.mCSB_container').find("+outputTXTdata+")" : outputTXThref;
					$(el).mCustomScrollbar("scrollTo",to);
					output.text("$('"+el+"').mCustomScrollbar('scrollTo',"+outputTXT+");");
				});
				
				
	var value= document.getElementById("toggledata").value;
					
            		if(value==1){  			
            			if(flag == false)
            			{            			
            				flag = true;
            				
            		  		$('div#mCSB_1_container').removeAttr('style');
            		        $('div#mCSB_1_container').removeAttr('id');
            		        $('div#mCSB_1_container').removeAttr('ltr');
            		        	$('div#mCSB_1_dragger_horizontal').css('display','block');
            		        	   $('div#mCSB_1_container').css('display','block');			
            			}
            			
            			else if(flag  == true)
            			{            				
            				flag = false;
            				$('#mCSB_1>div').attr('id', 'mCSB_1_container');
	 			  				$('div#mCSB_1_dragger_horizontal').css('display','block');
	 			  				   $('div#mCSB_1_container').css('display','block');
            			}
            			}
            			else if(value==0){  			
            			if(flag == true)
            			{            			
            				flag = false;
            					
            		  		 $('div#mCSB_1_container').removeAttr('style');
            		   		 $('div#mCSB_1_container').removeAttr('id');
            		  		 $('div#mCSB_1_container').removeAttr('ltr');	
            		  		 $('div#mCSB_1_dragger_horizontal').css('display','block');	
            		  		    $('div#mCSB_1_container').css('display','block');	
            			}
            			
            			else if(flag  == false)
            			{            				
            				flag = true;
            				$('#mCSB_1>div').attr('id', 'mCSB_1_container');
	 			  				$('div#mCSB_1_dragger_horizontal').css('display','block');
	 			  				   $('div#mCSB_1_container').css('display','block');
            			}
            			}
				
			});
		})(jQuery);
	</script>
					<div id="divConfirmAlert" class="error2">
						<label>
							<c:out value="${sessionScope.deleteRow}"/>
						</label>
						<span> <input type="button" value="Yes"
								onclick="deleteRow('yes')" />
						</span>
						<span> <input type="button" value="No"
								onclick="deleteRow('no')" />
						</span>
					</div>
			
			
				
	</body>
</html>
