package ocjug.juggernaut

class IndexController {

    def index() { 
		// TODO: Get the next meeting 
		def meetings = Meeting.list(sort: "meetingDate", order: "desc", max: 1)
		Meeting meeting = !meetings.isEmpty() ? meetings[0] : null 
		render view: "/index.gsp", model: [meeting: meeting]
	}
}
