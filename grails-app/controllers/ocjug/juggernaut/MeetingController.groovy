package ocjug.juggernaut

import org.springframework.dao.DataIntegrityViolationException

class MeetingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [meetingInstanceList: Meeting.list(params), meetingInstanceTotal: Meeting.count()]
    }

    def create() {
        [meetingInstance: new Meeting(params)]
    }

    def save() {
        def meetingInstance = new Meeting(params)
        if (!meetingInstance.save(flush: true)) {
            render(view: "create", model: [meetingInstance: meetingInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'meeting.label', default: 'Meeting'), meetingInstance.id])
        redirect(action: "show", id: meetingInstance.id)
    }

    def show() {
        def meetingInstance = Meeting.get(params.id)
        if (!meetingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'meeting.label', default: 'Meeting'), params.id])
            redirect(action: "list")
            return
        }

        [meetingInstance: meetingInstance]
    }

    def edit() {
        def meetingInstance = Meeting.get(params.id)
        if (!meetingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'meeting.label', default: 'Meeting'), params.id])
            redirect(action: "list")
            return
        }

        [meetingInstance: meetingInstance]
    }

    def update() {
        def meetingInstance = Meeting.get(params.id)
        if (!meetingInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'meeting.label', default: 'Meeting'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (meetingInstance.version > version) {
                meetingInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'meeting.label', default: 'Meeting')] as Object[],
                          "Another user has updated this Meeting while you were editing")
                render(view: "edit", model: [meetingInstance: meetingInstance])
                return
            }
        }

        meetingInstance.properties = params

        if (!meetingInstance.save(flush: true)) {
            render(view: "edit", model: [meetingInstance: meetingInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'meeting.label', default: 'Meeting'), meetingInstance.id])
        redirect(action: "show", id: meetingInstance.id)
    }

    def delete() {
        def meetingInstance = Meeting.get(params.id)
        if (!meetingInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'meeting.label', default: 'Meeting'), params.id])
            redirect(action: "list")
            return
        }

        try {
            meetingInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'meeting.label', default: 'Meeting'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'meeting.label', default: 'Meeting'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def icalendar() {
		Meeting meeting = Meeting.get(params.id)
		
		render(contentType: 'text/calendar') {
			calendar {
				events {
					event(start: meeting.getStartDate(),
							end: meeting.getEndDate(),
							description: meeting.description,
							summary: meeting.title,
							location: meeting.location.toString(),
							timezone: Location.defaultTimeZone){
								organizer(name: 'OCJUG', email: 'ocjug@ocjug.org')
							}
				}
			}
		}
	}
}
