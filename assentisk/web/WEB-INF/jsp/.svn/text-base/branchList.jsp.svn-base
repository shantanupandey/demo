<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>


<select class="form-control" id="branchid" ng-model="branchid">
	
	<option value="">
			---Select Location---
		</option>
		
	<c:if test="${flag == true}">
	<c:forEach var="branchList" items="${branchList}">
		<option value="<c:out value="${branchList.LocationID}"/>">
			<c:out value="${branchList.Name}" />
		</option>
	</c:forEach>
	</c:if>
	
</select>
