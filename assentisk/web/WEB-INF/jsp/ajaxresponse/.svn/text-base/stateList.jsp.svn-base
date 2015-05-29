<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>

<select class="form-control" id="stateid"  name="state" ng-model="stateid">
	<option value="">
		-- Select State --
	</option>
	<c:if test="${flag == true}">
	<c:forEach var="list" items="${stateList}">
		<option value="<c:out value="${list.StateID}"/>">
			<c:out value="${list.StateName}" />
		</option>
	</c:forEach>
	</c:if>
</select>
