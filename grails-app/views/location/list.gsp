
<%@ page import="ocjug.juggernaut.Location" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-location" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table">
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'location.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="link" title="${message(code: 'location.link.label', default: 'Link')}" />
					
						<g:sortableColumn property="street" title="${message(code: 'location.street.label', default: 'Street')}" />
					
						<g:sortableColumn property="unit" title="${message(code: 'location.unit.label', default: 'Unit')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'location.city.label', default: 'City')}" />
					
						<g:sortableColumn property="state" title="${message(code: 'location.state.label', default: 'State')}" />
					
						<g:sortableColumn property="zipCode" title="${message(code: 'location.state.label', default: 'ZIP Code')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${locationInstanceList}" status="i" var="locationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${locationInstance.id}">${fieldValue(bean: locationInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: locationInstance, field: "link")}</td>
					
						<td>${fieldValue(bean: locationInstance, field: "street")}</td>
					
						<td>${fieldValue(bean: locationInstance, field: "unit")}</td>
					
						<td>${fieldValue(bean: locationInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: locationInstance, field: "state")}</td>
					
						<td>${fieldValue(bean: locationInstance, field: "zipCode")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${locationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>