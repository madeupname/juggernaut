
<%@ page import="ocjug.juggernaut.Location" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'location.label', default: 'Location')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-location" class="content scaffold-show" role="main">
			<h1>${locationInstance?.name}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<p>
				${locationInstance?.street}<br>
				<g:if test="${locationInstance?.unit}">Unit ${locationInstance?.unit}<br></g:if>
				${locationInstance?.city}, ${locationInstance?.state} ${locationInstance?.zipCode}<br>
			</p>
			<p>
				<g:if test="${locationInstance?.link}">link ${locationInstance?.link}</g:if>
			</p>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${locationInstance?.id}" />
						<g:link class="btn btn-primary" action="edit" id="${locationInstance?.id}"><i class="icon-pencil icon-white"></i> <g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:link class="btn btn-danger" action="delete" id="${locationInstance?.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" ><i class="icon-trash icon-white"></i> ${message(code: 'default.button.delete.label', default: 'Delete')}</g:link>
					</fieldset>
				</g:form>
			</sec:ifAllGranted>
		</div>
	</body>
</html>
