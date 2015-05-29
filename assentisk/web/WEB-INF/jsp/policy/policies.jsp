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
 var sortingOrder = 'number';
function personController($scope,$http,$filter) {
							$("div.leftpanelinner>ul>li#policy").css("background","#012345");

   				
    $scope.sortingOrder = sortingOrder;
    $scope.reverse = false; 
    $scope.filteredItems = [];
    $scope.groupedItems = [];
    $scope.itemsPerPage = 15;
    $scope.pagedItems = [];
    $scope.currentPage = 0;
  	$http.get('policyList.assess.htm').
    success(function(data, status, headers, config) {
    $scope.items = data.policyBeans;
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
    

    $scope.sort_by = function(predicate) {
    
    
 $scope.predicate = predicate;
 $scope.reverse = !$scope.reverse;
 };
 
    }).
    error(function(data, status, headers, config) {
      // log error
    });
 
}
personController.$inject = ['$scope','$http','$filter'];  
 
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
		$.get("deleteCountry.master.htm?id="+rowID,function(data,status){ location.reload(true);});
	}
	else
	{
		$('#divConfirmAlert').hide();
	}
}

function callHistory(id){

		$.get("policyhistoryDetails.assess.htm?policyid="+id,function(data,status){ 
		
			
			
			document.getElementById("tabledata").innerHTML=data;
			$('#dialog-12').modal('show');
		
		});
}
</script>
</head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">

<section>
 
<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>

		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>
			
	<div class="modal fade" id="dialog-12" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="exampleModalLabel">History</h4>
			    			        
			      </div>
			      <div class="modal-body scheduler">
			         	<div id="tabledata"></div>
			        
			     <div class="bottomdiv">
			     </div></div></div></div>
			 </div>		
			
    <div class="pageheader">
      <h2><c:out value="${sessionScope.policies}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.policies}"/></li>
        </ol>
      </div>
    </div>

    <div class="contentpanel">
   <div ng-app="" ng-controller="personController">
   	<c:if test="${sessionScope.add_mod_28=='1'}">
   <a class="btn btn-success" href="addpolicy.assess.htm" title="<c:out value="${sessionScope.tooltip_add}"/>" style="margin-bottom:10px;"><c:out value="${sessionScope.tooltip_add}"/>&nbsp;&nbsp;<i class="fa fa-plus"></i></a>
      
      </c:if>
            <div class="input-append">
                <input type="text" ng-model="query" ng-change="search()" class="input-large search-query" placeholder="<c:out value="${sessionScope.toolip_search}"/>">
            <span class="add-on"><i class="icon-search"></i></span>
            </div></br>
            
      <div class="content demo-x">
    		 <table class="table table-striped table-condensed table-hover" id="country">
      			  <thead>
           			 <tr>
                                		
                  		<th class="number" style="min-width:150px;max-width:150px;"><a ng-click="sort_by('number')"><i class="icon-sort"></i><c:out value="${sessionScope.policy_number}"/></a></th>
           			     <th class="title" style="min-width:150px;max-width:150px;"><a ng-click="sort_by('title')"><i class="icon-sort"></i><c:out value="${sessionScope.policy_title}"/></a></th>
           			    <th class="location" style="min-width:150px;max-width:150px;"><a ng-click="sort_by('location')"><i class="icon-sort"></i><c:out value="${sessionScope.policy_location}"/></a></th>
           	            <th class="department" style="min-width:150px;max-width:150px;"><a ng-click="sort_by('department')"><i class="icon-sort"></i><c:out value="${sessionScope.policy_department}"/></a></th>
           	           	<th class="ModifiedBy" style="min-width:150px;max-width:150px;"><a ng-click="sort_by('ModifiedBy')"><i class="icon-sort"></i><c:out value="${sessionScope.policy_ModifiedBy}"/></a></th>
           			    <th class="ModifiedDate" style="min-width:150px;max-width:150px;"><a ng-click="sort_by('ModifiedDate')"><i class="icon-sort"></i><c:out value="${sessionScope.policy_ModifiedDate}"/></a></th>
           			    <th class="version" style="min-width:100px;max-width:100px;"><a ng-click="sort_by('version')"><i class="icon-sort"></i><c:out value="${sessionScope.policy_version}"/></a></th>
           			     <th style="min-width:150px;max-width:150px;"><c:out value="${sessionScope.Country_Action}"/></th>                              
           			
           			 </tr>
       			</thead> 
       
        		<tfoot>
                    <td colspan="9">
                        <div class="pagination pull-right"  style="height:auto;">
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
            <tr ng-repeat="item in pagedItems[currentPage] | orderBy:sortingOrder:reverse">            	
            		<td  style="min-width:150px;max-width:150px;word-wrap:break-word;">
            				{{item.number}}
            		</td>
            			<td  style="min-width:150px;max-width:150px;word-wrap:break-word;">
            				{{item.title}}
            		</td>
            		<td  style="min-width:150px;max-width:150px;word-wrap:break-word;">
            				{{item.LocationsData}}
            		</td>
            			<td  style="min-width:150px;max-width:150px;word-wrap:break-word;">
            				{{item.departmentData}}
            		</td>
            		<td  style="min-width:150px;max-width:150px;word-wrap:break-word;">
            				{{item.user}}
            		</td>
            		<td  style="min-width:150px;max-width:150px;word-wrap:break-word;">
            				{{item.ModifiedDate}}
            		</td>
            		
					<td  style="min-width:100px;max-width:100px;word-wrap:break-word;">
            					<a  onclick="callHistory({{item.id}})" title="History">{{item.version}}</a>
            		</td>
            		 <td class="center" style="min-width:150px;max-width:150px;">  
            		 	<div ng-switch on="item.creator">
            		 		<div ng-switch-when="1">
			            		 	<c:if test="${sessionScope.edit_mod_28=='1'}">          		 			
											<a class="btn btn-info" href="editpolicy.assess.htm?policyno={{item.id}}" title="<c:out value="${sessionScope.tooltip_edit}"/>"><i class="fa fa-edit "></i></a>
									</c:if>
									<a class="btn btn-teal" href="circular.assess.htm?policyno={{item.oldpolicyID}}" title="<c:out value="${sessionScope.tooltip_circulation}"/>"><i class="fa fa-circle-o-notch "></i></a>
							</div>
							
						</div>		
						 <div ng-switch on="item.assignedapprove">
						 	<div ng-switch-when="1">
						 			<a class="btn btn-info" href="showassignedpolicy.assess.htm?policyno={{item.id}}" title="<c:out value="${sessionScope.tooltip_edit}"/>"><i class="fa fa-user"></i></a>
						 	</div>
						 	<div ng-switch-when="0">
						 		<div ng-switch on="item.circular">
						 				<div ng-switch-when="1">
						 						<a class="btn btn-info" href="showassignedpolicy.assess.htm?policyno={{item.oldpolicyID}}" title="<c:out value="${sessionScope.tooltip_edit}"/>"><i class="fa fa-user"></i></a>
						 				</div>
						 		</div>
						 	</div>
						 
						 </div>
            		 </td>
            </tr>
         </tbody>    
    </table>
    </div>
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

<div  id="divConfirmAlert" class="error2">
 		<label> <c:out value="${sessionScope.deleteRow}"/></label>
         <span > <input type="button" value="Yes" onclick="deleteRow('yes')"/></span>
         <span > <input type="button" value="No" onclick="deleteRow('no')"/></span>
 </div>


</body>
</html>
