package ocjug.juggernaut

import java.sql.Timestamp
import java.text.SimpleDateFormat

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
		description minSize: 5, blank: false, widget: "textarea"
		meetingDate min: (new Date()).minus(1) // earliest date must be within 24h
		startTime matches: "[0-9]+:[0-9]+ (AM|PM)", blank: false
		endTime matches: "[0-9]+:[0-9]+ (AM|PM)", blank: false
    }
	
	String title
	String speaker
	String description
	
	Date meetingDate
	String startTime 
	String endTime 
	
	Location location
	
	Date getStartDate() {
		getDate(startTime)
	}

	Date getEndDate() {
		getDate(endTime)
	}
	
	private Date getDate(String time) {
		if (location) {
			SimpleDateFormat ymd = new SimpleDateFormat('yyyy-MM-dd')
			SimpleDateFormat ymdhm= new SimpleDateFormat('yyyy-MM-dd hh:mm aa')
			return ymdhm.parse(ymd.format(meetingDate) + ' ' + time)
		}
		return null
	}

}
