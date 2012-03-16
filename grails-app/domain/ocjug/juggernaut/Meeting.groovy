package ocjug.juggernaut

import java.sql.Timestamp

class Meeting {

    static constraints = {
		title blank: false
		speaker blank: false
		description size: 5..500, blank: false
		meetingDate min: (new Date()).minus(1) // earliest date must be within 24h
		startTime matches: "[0-9]+:[0-9]+(AM|PM)?", blank: false
		endTime matches: "[0-9]+:[0-9]+(AM|PM)?", blank: false
    }
	
	String title
	String speaker
	String description
	
	Date meetingDate
	String startTime
	String endTime
	
	Location location
}
