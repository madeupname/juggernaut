package ocjug.juggernaut;

import static org.junit.Assert.*;

class MeetingTests {

	void testGetStartDate() {
		Location location = new Location(name: "Smart Soft", street: "18006 Sky Park Circle", unit: "204", city: "Irvine", state: "CA")
		Meeting meeting = new Meeting(title: "Fun with Grails!", speaker: "John Doe", description: "Learn Grails", 
			meetingDate: new Date(), startTime: "6:30 PM", endTime: "8:30 PM", location: location)
		Date startDate = meeting.getStartDate()
		assertNotNull(startDate)
	}
}
