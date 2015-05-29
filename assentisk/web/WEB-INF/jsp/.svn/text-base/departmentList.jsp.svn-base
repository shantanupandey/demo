<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>



<select class="form-control" id="departmentid" ng-model="departmentid">
<option value="">
			---Select Department---
		</option>
	<c:if test="${flag == true}">
		<c:forEach var="departmentList" items="${departmentList}">
			<option value="<c:out value="${departmentList.DepartmentID}"/>">
				<c:out value="${departmentList.DeptName}" />
			</option>
		</c:forEach>
	</c:if>
	

</select>