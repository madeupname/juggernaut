package ocjug.juggernaut

import java.sql.Timestamp

/**
 * Represents a user group meeting.
 * 
 * @author Philip Yurchuk
 *
 */
class Meeting {

    static constraints = {
		title blank: false
		speaker blank: false
		description minSize: 5, blank: false
		meetingDate min: (new Date()).minus(1) // earliest date must be within 24h
		startTime matches: "[0-9]+:[0-9]+(AM|PM)?", blank: false
		endTime matches: "[0-9]+:[0-9]+(AM|PM)?", blank: false
    }
	
	String title
	String speaker
	String description
	
	// TODO: Remove meetingDate, change start and end times to Date to support exporting to calendars.
	Date meetingDate
	String startTime 
	String endTime 
	
	Location location
}
