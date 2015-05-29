<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="shortcut icon" href="images/favicon.ico">
		<link href="css/jquery.dataTables.css" rel="stylesheet"
			type="text/css" />
		<link href="css/font-awesome.css" rel="stylesheet">
		<script type="text/javascript" charset="utf8" src="js/jquery.js"></script>
		<script src="js/angular.min.js"></script>
		<title>Assentisk</title>

		<link href="css/custom.css" rel="stylesheet">
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">

		<script type="text/javascript">

var rowID;
 var sortingOrder = 'Doc_name';
function applicationsController($scope,$http,$filter) {

	        $("div.leftpanelinner>ul>li#library").css("background","#003366");
    	    $("div.leftpanelinner>ul>li#library>a").css("color","white");
    		$("div.leftpanelinner>ul>li#library>a>span").css("color","white");
			$("div.leftpanelinner>ul>li#regulations").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#regulations>ul").css("display","block");
			$("div.leftpanelinner>ul>li#regulations>ul>li#library").addClass("active");

    $scope.sortingOrder = sortingOrder;
    $scope.reverse = false; 
    $scope.filteredItems = [];
    $scope.groupedItems = [];
    $scope.itemsPerPage = 15;
    $scope.pagedItems = [];
    $scope.currentPage = 0;
  	$http.get('risklist.reg.htm').
    success(function(data, status, headers, config) {
      
       $scope.items = data.riskBean;
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

    };
    }).
    error(function(data, status, headers, config) {
      // log error
    });
 
}
applicationsController.$inject = ['$scope','$http','$filter'];  

function confirmRow(id)
{
	rowID = id;
	$('#divConfirmAlert').show();


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
					<c:out value="${sessionScope.risk_Header}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.risk_Header}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">
			
		
			
			
				<div ng-app="" ng-controller="applicationsController">
				
				
				<c:if test="${sessionScope.add_mod_21=='1'}">	
				<a class="btn btn-success" href="addImportExcel.reg.htm" style="margin-bottom:10px;" title="<c:out value="${sessionScope.tooltip_add}"/>"><c:out value="${sessionScope.tooltip_add}"/>&nbsp;&nbsp;<i class="fa fa-plus"></i></a>
			</c:if>	
				
					
					
					<div class="input-append">
					<a class="btn btn-info" href="downloadExcelForRisk.reg.htm?doc_name=SampleCopy" title="<c:out value="${sessionScope.download_sample}"/>"
							style="margin-right: 10px;"><i class="fa fa-download"></i>
						</a>
						<input type="text" ng-model="query" ng-change="search()"
							class="input-large search-query" placeholder="<c:out value="${sessionScope.search}"/>">
						<span class="add-on"><i class="icon-search"></i> </span>
					</div>
					</br>
					
				 <div class="content demo-x">
					<table class="table table-striped table-condensed table-hover"
						id="company">
						<thead>
							<tr>

								<th class="ApplicationName" style="min-width:800px;max-width:800px;">
									<a ng-click="sort_by('Doc_name')"><i class="icon-sort"></i><c:out value="${sessionScope.riskModuleName}"/></a>
								</th>
								
								<th style="width:300px;">
									<c:out value="${sessionScope.action}"/>
								</th>

							</tr>
						</thead>

						<tfoot>
							<td colspan="18">
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
								<td style="min-width:800px;max-width:800px;word-wrap:break-word;">
									{{item.Doc_name}}
								</td>
							
								

								<td class="center" style="width:300px;">
								<c:if test="${sessionScope.edit_mod_21=='1'}">
									<a class="btn btn-info"
										href="downloadExcelForRisk.reg.htm?doc_name={{item.Doc_name}}" title="<c:out value="${sessionScope.tooltip_download}"/>"><i class="fa fa-download"></i></a>
										</c:if>
										


								</td>
							</tr>
						</tbody>
					</table>
					
					
</div>
				
			</div>
			<!-- panel-body -->
		</div>
		<!-- panel -->
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
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
		(function($){
			$(window).load(function(){
				var value= document.getElementById("toggledata").value
				 		
            		if(value==1){  			
            			if(flag == false)
            			{            			
            				flag = true;
            				$('div#mCSB_1_container').removeAttr('class');
            		  		$('div#mCSB_1_container').removeAttr('style');
            		        $('div#mCSB_1_container').removeAttr('id');
            		        $('div#mCSB_1_container').removeAttr('ltr');			
            			}
            			
            			else if(flag  == true)
            			{            				
            				flag = false;
            				$('#mCSB_1>div').attr('id', 'mCSB_1_container');
	 			  							  $('#mCSB_1>div').attr('class', 'mCSB_container');
            			}
            			}
            			else if(value==0){  			
            			if(flag == true)
            			{            			
            				flag = false;
            				 $('div#mCSB_1_container').removeAttr('class');
            		  		 $('div#mCSB_1_container').removeAttr('style');
            		   		 $('div#mCSB_1_container').removeAttr('id');
            		  		 $('div#mCSB_1_container').removeAttr('ltr');			
            			}
            			
            			else if(flag  == false)
            			{            				
            				flag = true;
            				$('#mCSB_1>div').attr('id', 'mCSB_1_container');
	 			  							  $('#mCSB_1>div').attr('class', 'mCSB_container');
            			}
            			}
				
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
				
			});
		})(jQuery);
	</script>




<div  id="divConfirmAlert" class="error2">
 		<label> <c:out value="${sessionScope.deleteRow}"/></label>
         <span > <input type="button" value="Yes" onclick="deleteRow('yes')"/></span>
         <span > <input type="button" value="No" onclick="deleteRow('no')"/></span>
 </div>

	</body>
</html>
