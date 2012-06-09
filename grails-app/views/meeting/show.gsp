
<%@ page import="ocjug.juggernaut.Meeting" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'meeting.label', default: 'Meeting')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-meeting" class="content scaffold-show" role="main">
			<h1><%--<g:message code="default.show.label" args="[entityName]" />--%>${meetingInstance?.title}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<p>Presented by ${meetingInstance?.speaker} on <g:formatDate format="EEEE, MMMM d, yyyy 'at' hh:mmaaa" style="LONG" date="${meetingInstance?.meetingDate}" />. The location is <g:link controller="location" action="show" id="${meetingInstance?.location?.id}">${meetingInstance?.location?.encodeAsHTML()}</g:link>.</p>
			<p>Abstract: ${meetingInstance?.description}</p>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${meetingInstance?.id}" />
						<g:link class="btn btn-primary" action="edit" id="${meetingInstance?.id}"><i class="icon-pencil icon-white"></i> <g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:link class="btn btn-danger" action="delete" id="${meetingInstance?.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" ><i class="icon-trash icon-white"></i> ${message(code: 'default.button.delete.label', default: 'Delete')}</g:link>
					</fieldset>
				</g:form>
			</sec:ifAllGranted>
		</div>
	</body>
</html>
