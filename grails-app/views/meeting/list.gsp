
<%@ page import="ocjug.juggernaut.Meeting" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'meeting.label', default: 'Meeting')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<%--<link rel="stylesheet" href="${resource(dir: 'css', file: 'custom-main.css')}" type="text/css">
	--%></head>
	<body>
		<div class="container"><%--
	
			<a href="#list-meeting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
			<div class="nav" role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			--%><div id="list-meeting" class="content scaffold-list" role="main">
				<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<br />
				<table class="table">
					<thead>
						<tr>
						
							<g:sortableColumn property="title" title="${message(code: 'meeting.title.label', default: 'Title')}" />
						
							<g:sortableColumn property="speaker" title="${message(code: 'meeting.speaker.label', default: 'Speaker')}" />
						
							<g:sortableColumn property="description" title="${message(code: 'meeting.description.label', default: 'Description')}" />
						
							<g:sortableColumn property="meetingDate" title="${message(code: 'meeting.meetingDate.label', default: 'Meeting Date')}" />
						
							<g:sortableColumn property="startTime" title="${message(code: 'meeting.startTime.label', default: 'Start Time')}" />
						
							<g:sortableColumn property="endTime" title="${message(code: 'meeting.endTime.label', default: 'End Time')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${meetingInstanceList}" status="i" var="meetingInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${meetingInstance.id}">${fieldValue(bean: meetingInstance, field: "title")}</g:link></td>
						
							<td>${fieldValue(bean: meetingInstance, field: "speaker")}</td>
						
							<td>${fieldValue(bean: meetingInstance, field: "description")}</td>
						
							<td><g:formatDate date="${meetingInstance.meetingDate}" /></td>
						
							<td>${fieldValue(bean: meetingInstance, field: "startTime")}</td>
						
							<td>${fieldValue(bean: meetingInstance, field: "endTime")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${meetingInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
