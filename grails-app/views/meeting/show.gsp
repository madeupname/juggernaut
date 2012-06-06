
<%@ page import="ocjug.juggernaut.Meeting" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'meeting.label', default: 'Meeting')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<%--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">--%>
	</head>
	<body>
		<div class="container"><%--
			<a href="#show-meeting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<div class="nav" role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			--%><div id="show-meeting" class="content scaffold-show" role="main">
				<h1><%--<g:message code="default.show.label" args="[entityName]" />--%>${meetingInstance?.title}</h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<p>Presented by <g:fieldValue bean="${meetingInstance}" field="speaker"/> on <g:formatDate format="EEEE, MMMM d, yyyy 'at' hh:mmaaa" style="LONG" date="${meetingInstance?.meetingDate}" />. The location is <g:link controller="location" action="show" id="${meetingInstance?.location?.id}">${meetingInstance?.location?.encodeAsHTML()}</g:link>.</p>
				<p>Abstract: <g:fieldValue bean="${meetingInstance}" field="description"/></p>
			</div>
		</div>
	</body>
</html>
