<%@ page import="ocjug.juggernaut.Meeting" %>



<div class="fieldcontain ${hasErrors(bean: meetingInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="meeting.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${meetingInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: meetingInstance, field: 'speaker', 'error')} required">
	<label for="speaker">
		<g:message code="meeting.speaker.label" default="Speaker" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="speaker" required="" value="${meetingInstance?.speaker}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: meetingInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="meeting.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea class="span8" name="description" cols="80" rows="8" required="" value="${meetingInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: meetingInstance, field: 'meetingDate', 'error')} required">
	<label for="meetingDate">
		<g:message code="meeting.meetingDate.label" default="Meeting Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="meetingDate" precision="day"  value="${meetingInstance?.meetingDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: meetingInstance, field: 'startTime', 'error')} required">
	<label for="startTime">
		<g:message code="meeting.startTime.label" default="Start Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="startTime" id="startTime" pattern="${meetingInstance.constraints.startTime.matches}" required="" value="${meetingInstance?.startTime}"/>
	
</div>

<div class="fieldcontain ${hasErrors(bean: meetingInstance, field: 'endTime', 'error')} required">
	<label for="endTime">
		<g:message code="meeting.endTime.label" default="End Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="endTime" id="endTime" pattern="${meetingInstance.constraints.endTime.matches}" required="" value="${meetingInstance?.endTime}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: meetingInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="meeting.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="location" name="location.id" from="${ocjug.juggernaut.Location.list()}" optionKey="id" required="" value="${meetingInstance?.location?.id}" class="many-to-one"/>
</div>

